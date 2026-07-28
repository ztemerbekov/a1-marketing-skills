#!/usr/bin/env python3

import json
import math
import re
import struct
import sys
import xml.etree.ElementTree as ET
import zlib
from pathlib import Path, PurePosixPath


ROOT = Path(__file__).resolve().parent.parent
PRODUCT_SLUG = "a1-marketing-skills"
PRODUCT_DISPLAY_NAME = "A1 Marketing Skills"
CLAUDE_FULL_PLUGIN_SOURCE = f"./plugins/{PRODUCT_SLUG}"
CLAUDE_PLUGIN_CATEGORIES = {
    "a1-core": "productivity",
    "a1-editorial": "productivity",
    PRODUCT_SLUG: "productivity",
}
SKILLS_PATH = "./skills/"
REPOSITORY_URL = "https://github.com/ztemerbekov/a1-marketing-skills.git"
CODEX_LOGO_PATH = "./assets/marketplaces/codex/logo.svg"
CODEX_COMPOSER_ICON_PATH = "./assets/marketplaces/codex/composer-icon.svg"
CURSOR_LOGO_PATH = "assets/marketplaces/cursor/logo.png"
MAX_CODEX_IMAGE_BYTES = 5 * 1024 * 1024
SUPPORTED_CODEX_IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".webp", ".svg"}
SVG_NUMBER = re.compile(
    r"[-+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][-+]?\d+)?"
)

MANIFEST_PATHS = {
    "claude marketplace": ROOT / ".claude-plugin/marketplace.json",
    "codex marketplace": ROOT / ".agents/plugins/marketplace.json",
    "codex manifest": ROOT / ".codex-plugin/plugin.json",
    "cursor marketplace": ROOT / ".cursor-plugin/marketplace.json",
    "cursor manifest": ROOT / ".cursor-plugin/plugin.json",
}

failures = []


def fail(path, message):
    failures.append(f"{path.relative_to(ROOT)}: {message}")


def load_json(label):
    path = MANIFEST_PATHS[label]
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        fail(path, "missing required manifest")
    except json.JSONDecodeError as error:
        fail(path, f"invalid JSON at line {error.lineno}, column {error.colno}")
    return {}


def plugin_entry(marketplace, path, name):
    entries = [
        entry
        for entry in marketplace.get("plugins", [])
        if isinstance(entry, dict) and entry.get("name") == name
    ]
    if len(entries) != 1:
        fail(path, f"expected exactly one {name!r} plugin entry, found {len(entries)}")
        return {}
    return entries[0]


def check_value(document, path, key, expected):
    actual = document.get(key)
    if actual != expected:
        fail(path, f"{key!r} must be {expected!r}, found {actual!r}")


def resolve_asset(manifest_path, declared_path, *, require_dot_prefix):
    if not isinstance(declared_path, str):
        fail(manifest_path, "declared asset path must be a string")
        return None
    if not declared_path:
        fail(manifest_path, "declared asset path must not be empty")
        return None
    if declared_path != declared_path.strip():
        fail(manifest_path, "declared asset path must not have outer whitespace")
        return None
    if any(ord(character) < 32 or ord(character) == 127 for character in declared_path):
        fail(manifest_path, "declared asset path must not contain control characters")
        return None
    if require_dot_prefix and not declared_path.startswith("./"):
        fail(manifest_path, "Codex branding asset paths must start with './'")
        return None
    relative_path = declared_path.removeprefix("./")
    pure_path = PurePosixPath(relative_path)
    if (
        pure_path.is_absolute()
        or not pure_path.parts
        or ".." in pure_path.parts
        or re.match(r"^[A-Za-z]:", relative_path)
    ):
        fail(manifest_path, f"unsafe declared asset path: {declared_path!r}")
        return None
    resolved_path = (ROOT / Path(*pure_path.parts)).resolve()
    try:
        resolved_path.relative_to(ROOT)
    except ValueError:
        fail(manifest_path, f"declared asset path escapes the plugin: {declared_path!r}")
        return None
    if not resolved_path.is_file():
        fail(manifest_path, f"declared asset does not resolve to a regular file: {declared_path!r}")
        return None
    return resolved_path


def parse_svg_number(value):
    if not isinstance(value, str) or not SVG_NUMBER.fullmatch(value.strip()):
        return None
    number = float(value)
    return number if math.isfinite(number) else None


def validate_codex_svg(path):
    if path.suffix.lower() not in SUPPORTED_CODEX_IMAGE_EXTENSIONS:
        fail(path, f"unsupported Codex image extension: {path.suffix!r}")
        return
    if path.stat().st_size > MAX_CODEX_IMAGE_BYTES:
        fail(path, "Codex image must not exceed 5 MiB")
    if path.suffix.lower() != ".svg":
        fail(path, "approved Codex marketplace exports must be SVG files")
        return
    try:
        text = path.read_bytes().decode("utf-8")
    except UnicodeDecodeError:
        fail(path, "SVG must contain valid UTF-8 XML")
        return
    try:
        root = ET.fromstring(text)
    except ET.ParseError as error:
        fail(path, f"malformed SVG XML: {error}")
        return
    if root.tag.rsplit("}", 1)[-1] != "svg":
        fail(path, "SVG root element must be <svg>")
        return

    view_box = root.get("viewBox")
    if view_box is not None:
        values = [
            value
            for value in re.split(r"[\s,]+", view_box.strip())
            if value
        ]
        if len(values) != 4:
            fail(path, "SVG viewBox must contain four numeric values")
            return
        numbers = [parse_svg_number(value) for value in values]
        if any(number is None for number in numbers):
            fail(path, "SVG viewBox dimensions must be numeric and unitless")
            return
        width, height = numbers[2], numbers[3]
    else:
        width = parse_svg_number(root.get("width"))
        height = parse_svg_number(root.get("height"))
        if width is None or height is None:
            fail(path, "SVG must define a numeric viewBox or numeric width and height")
            return

    if width <= 0 or height <= 0:
        fail(path, "SVG dimensions must be positive finite numbers")
    elif not math.isclose(width, height, rel_tol=0, abs_tol=1e-9):
        fail(path, f"SVG dimensions must be square, found {width:g}×{height:g}")
    elif width < 48:
        fail(path, f"SVG dimensions must be at least 48×48, found {width:g}×{height:g}")


def validate_cursor_png(path):
    if path.suffix.lower() != ".png":
        fail(path, "approved Cursor marketplace export must be a PNG file")
        return
    data = path.read_bytes()
    if not data.startswith(b"\x89PNG\r\n\x1a\n"):
        fail(path, "Cursor logo does not contain a PNG signature")
        return

    offset = 8
    dimensions = None
    seen_idat = False
    seen_iend = False
    chunk_index = 0
    while offset < len(data):
        if len(data) - offset < 12:
            fail(path, "Cursor logo contains a truncated PNG chunk")
            return
        length = struct.unpack(">I", data[offset : offset + 4])[0]
        chunk_type = data[offset + 4 : offset + 8]
        chunk_end = offset + 12 + length
        if chunk_end > len(data):
            fail(path, "Cursor logo contains a truncated PNG chunk")
            return
        chunk_data = data[offset + 8 : offset + 8 + length]
        expected_crc = struct.unpack(">I", data[offset + 8 + length : chunk_end])[0]
        actual_crc = zlib.crc32(chunk_type + chunk_data) & 0xFFFFFFFF
        if actual_crc != expected_crc:
            fail(path, f"Cursor logo contains an invalid {chunk_type!r} chunk checksum")
            return
        if chunk_index == 0:
            if chunk_type != b"IHDR" or length != 13:
                fail(path, "Cursor logo must begin with a valid PNG IHDR chunk")
                return
            width, height = struct.unpack(">II", chunk_data[:8])
            dimensions = (width, height)
        elif chunk_type == b"IHDR":
            fail(path, "Cursor logo contains more than one PNG IHDR chunk")
            return
        if chunk_type == b"IDAT":
            seen_idat = True
        if chunk_type == b"IEND":
            if length != 0 or chunk_end != len(data):
                fail(path, "Cursor logo contains an invalid PNG IEND chunk")
                return
            seen_iend = True
            break
        offset = chunk_end
        chunk_index += 1

    if dimensions != (512, 512):
        found = (
            f"{dimensions[0]}×{dimensions[1]}"
            if dimensions is not None
            else "no dimensions"
        )
        fail(path, f"Cursor logo must be the approved 512×512 export, found {found}")
    if not seen_idat or not seen_iend:
        fail(path, "Cursor logo must contain PNG image data and a terminal IEND chunk")


claude_marketplace = load_json("claude marketplace")
codex_marketplace = load_json("codex marketplace")
codex_manifest = load_json("codex manifest")
cursor_marketplace = load_json("cursor marketplace")
cursor_manifest = load_json("cursor manifest")

for label, marketplace in (
    ("claude marketplace", claude_marketplace),
    ("codex marketplace", codex_marketplace),
    ("cursor marketplace", cursor_marketplace),
):
    check_value(
        marketplace,
        MANIFEST_PATHS[label],
        "name",
        PRODUCT_SLUG,
    )

for label, manifest in (
    ("codex manifest", codex_manifest),
    ("cursor manifest", cursor_manifest),
):
    path = MANIFEST_PATHS[label]
    check_value(manifest, path, "name", PRODUCT_SLUG)
    check_value(manifest, path, "skills", SKILLS_PATH)
    skills_value = manifest.get("skills")
    skills_dir = (
        ROOT / skills_value.removeprefix("./")
        if isinstance(skills_value, str)
        else None
    )
    if skills_dir is None or not skills_dir.is_dir():
        fail(path, f"skills path does not resolve to a directory: {manifest.get('skills')!r}")

codex_version = codex_manifest.get("version")
cursor_version = cursor_manifest.get("version")
if codex_version != cursor_version:
    fail(
        MANIFEST_PATHS["cursor manifest"],
        f"version must match Codex manifest {codex_version!r}, found {cursor_version!r}",
    )
if not isinstance(codex_version, str) or not re.fullmatch(
    r"(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)", codex_version
):
    fail(
        MANIFEST_PATHS["codex manifest"],
        f"version must use MAJOR.MINOR.PATCH semver, found {codex_version!r}",
    )

claude_plugin_entries = {
    name: plugin_entry(
        claude_marketplace,
        MANIFEST_PATHS["claude marketplace"],
        name,
    )
    for name in CLAUDE_PLUGIN_CATEGORIES
}
for name, expected_category in CLAUDE_PLUGIN_CATEGORIES.items():
    check_value(
        claude_plugin_entries[name],
        MANIFEST_PATHS["claude marketplace"],
        "category",
        expected_category,
    )

claude_full_plugin = claude_plugin_entries[PRODUCT_SLUG]
codex_full_plugin = plugin_entry(
    codex_marketplace,
    MANIFEST_PATHS["codex marketplace"],
    PRODUCT_SLUG,
)
cursor_full_plugin = plugin_entry(
    cursor_marketplace,
    MANIFEST_PATHS["cursor marketplace"],
    PRODUCT_SLUG,
)

codex_marketplace_interface = codex_marketplace.get("interface")
if not isinstance(codex_marketplace_interface, dict):
    fail(
        MANIFEST_PATHS["codex marketplace"],
        "'interface' must be an object",
    )
else:
    check_value(
        codex_marketplace_interface,
        MANIFEST_PATHS["codex marketplace"],
        "displayName",
        PRODUCT_DISPLAY_NAME,
    )

codex_plugin_interface = codex_manifest.get("interface")
if not isinstance(codex_plugin_interface, dict):
    fail(
        MANIFEST_PATHS["codex manifest"],
        "'interface' must be an object",
    )
else:
    check_value(
        codex_plugin_interface,
        MANIFEST_PATHS["codex manifest"],
        "displayName",
        PRODUCT_DISPLAY_NAME,
    )
    check_value(
        codex_plugin_interface,
        MANIFEST_PATHS["codex manifest"],
        "logo",
        CODEX_LOGO_PATH,
    )
    check_value(
        codex_plugin_interface,
        MANIFEST_PATHS["codex manifest"],
        "composerIcon",
        CODEX_COMPOSER_ICON_PATH,
    )
    codex_logo = resolve_asset(
        MANIFEST_PATHS["codex manifest"],
        codex_plugin_interface.get("logo"),
        require_dot_prefix=True,
    )
    codex_composer_icon = resolve_asset(
        MANIFEST_PATHS["codex manifest"],
        codex_plugin_interface.get("composerIcon"),
        require_dot_prefix=True,
    )
    if codex_logo is not None:
        validate_codex_svg(codex_logo)
    if codex_composer_icon is not None:
        validate_codex_svg(codex_composer_icon)
    if (
        codex_logo is not None
        and codex_composer_icon is not None
        and codex_logo == codex_composer_icon
    ):
        fail(
            MANIFEST_PATHS["codex manifest"],
            "logo and composerIcon must use separate approved exports",
        )

check_value(
    cursor_manifest,
    MANIFEST_PATHS["cursor manifest"],
    "displayName",
    PRODUCT_DISPLAY_NAME,
)
check_value(
    cursor_manifest,
    MANIFEST_PATHS["cursor manifest"],
    "logo",
    CURSOR_LOGO_PATH,
)
cursor_logo = resolve_asset(
    MANIFEST_PATHS["cursor manifest"],
    cursor_manifest.get("logo"),
    require_dot_prefix=False,
)
if cursor_logo is not None:
    validate_cursor_png(cursor_logo)

for unsupported_field in ("logo", "icon"):
    if unsupported_field in claude_marketplace:
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"Claude marketplace must not declare unsupported {unsupported_field!r} metadata",
        )
for plugin in claude_marketplace.get("plugins", []):
    if not isinstance(plugin, dict):
        continue
    for unsupported_field in ("logo", "icon"):
        if unsupported_field in plugin:
            fail(
                MANIFEST_PATHS["claude marketplace"],
                f"Claude plugin {plugin.get('name')!r} must not declare unsupported "
                f"{unsupported_field!r} metadata",
            )

check_value(
    claude_full_plugin,
    MANIFEST_PATHS["claude marketplace"],
    "displayName",
    PRODUCT_DISPLAY_NAME,
)
check_value(
    claude_full_plugin,
    MANIFEST_PATHS["claude marketplace"],
    "source",
    CLAUDE_FULL_PLUGIN_SOURCE,
)
claude_full_plugin_dir = ROOT / CLAUDE_FULL_PLUGIN_SOURCE.removeprefix("./")
if not claude_full_plugin_dir.is_dir():
    fail(
        MANIFEST_PATHS["claude marketplace"],
        f"{PRODUCT_SLUG!r} source does not resolve to a directory",
    )

if codex_full_plugin.get("source") != {
    "source": "url",
    "url": REPOSITORY_URL,
}:
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{PRODUCT_SLUG!r} source must point to {REPOSITORY_URL}",
    )
if codex_full_plugin.get("policy") != {
    "installation": "AVAILABLE",
    "authentication": "ON_INSTALL",
}:
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{PRODUCT_SLUG!r} must use the approved installation and authentication policy",
    )
if codex_full_plugin.get("category") != "Productivity":
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{PRODUCT_SLUG!r} category must be 'Productivity'",
    )

if cursor_full_plugin.get("source") != "./":
    fail(
        MANIFEST_PATHS["cursor marketplace"],
        f"{PRODUCT_SLUG!r} source must be './'",
    )

claude_plugins = {
    entry.get("name"): entry
    for entry in claude_marketplace.get("plugins", [])
    if isinstance(entry, dict) and isinstance(entry.get("name"), str)
}
declared_dependencies = claude_full_plugin.get("dependencies", [])
if not isinstance(declared_dependencies, list):
    fail(
        MANIFEST_PATHS["claude marketplace"],
        f"{PRODUCT_SLUG!r} dependencies must be an array",
    )
    declared_dependencies = []
declared_skills = []
for dependency in declared_dependencies:
    package = claude_plugins.get(dependency)
    if package is None:
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"{PRODUCT_SLUG!r} references missing dependency {dependency!r}",
        )
        continue
    package_skills = package.get("skills", [])
    if not isinstance(package_skills, list):
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"{dependency!r} skills must be an array",
        )
        continue
    package_source = package.get("source")
    if not isinstance(package_source, str):
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"{dependency!r} source must be a relative path",
        )
        continue
    package_root = (ROOT / package_source.removeprefix("./")).resolve()
    try:
        package_root.relative_to(ROOT)
    except ValueError:
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"{dependency!r} source escapes the repository",
        )
        continue
    for skill_path in package_skills:
        if not isinstance(skill_path, str):
            fail(
                MANIFEST_PATHS["claude marketplace"],
                f"{dependency!r} contains a non-string skill path",
            )
            continue
        resolved_skill = (package_root / skill_path.removeprefix("./")).resolve()
        try:
            resolved_skill.relative_to(ROOT)
        except ValueError:
            fail(
                MANIFEST_PATHS["claude marketplace"],
                f"{dependency!r} skill path escapes the repository: {skill_path!r}",
            )
            continue
        if not (resolved_skill / "SKILL.md").is_file():
            fail(
                MANIFEST_PATHS["claude marketplace"],
                f"{dependency!r} skill path does not resolve: {skill_path!r}",
            )
        declared_skills.append(Path(skill_path).name)

canonical_skills = sorted(
    path.parent.name for path in (ROOT / "skills").glob("*/SKILL.md")
)
if sorted(declared_skills) != canonical_skills:
    missing = sorted(set(canonical_skills) - set(declared_skills))
    extra = sorted(set(declared_skills) - set(canonical_skills))
    duplicates = sorted(
        name for name in set(declared_skills) if declared_skills.count(name) > 1
    )
    details = []
    if missing:
        details.append(f"missing: {', '.join(missing)}")
    if extra:
        details.append(f"unknown: {', '.join(extra)}")
    if duplicates:
        details.append(f"duplicated: {', '.join(duplicates)}")
    fail(
        MANIFEST_PATHS["claude marketplace"],
        "full plugin composition must cover every canonical skill exactly once"
        + (f" ({'; '.join(details)})" if details else ""),
    )

if failures:
    for failure in failures:
        print(f"FAIL {failure}")
    print(f"\nMarketplace summary: {len(failures)} failures")
    sys.exit(1)

print(
    "Marketplace summary: product slug and display name are synchronized across "
    "Claude, Codex, and Cursor; "
    f"{len(canonical_skills)} canonical skills covered"
)
