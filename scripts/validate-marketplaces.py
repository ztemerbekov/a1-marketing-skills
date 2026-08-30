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
PRODUCT_DISPLAY_NAME = "A1 Marketing Skills"
PRODUCT_DISPLAY_NAME_RU = "A1 Маркетинговые скиллы"
PRODUCT_DISPLAY_NAMES = {PRODUCT_DISPLAY_NAME_RU, PRODUCT_DISPLAY_NAME}
PRODUCT_SEARCH_NAMES = {"Маркетинговые скиллы", "Marketing Skills"}
AGENT_PLUGINS_SCHEMA = (
    "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json"
)
PORTABLE_MANIFEST_FIELDS = {
    "$schema",
    "name",
    "version",
    "description",
    "author",
    "homepage",
    "repository",
    "license",
    "keywords",
    "extensions",
}
PORTABLE_SHARED_FIELDS = (
    "name",
    "version",
    "description",
    "author",
    "homepage",
    "repository",
    "license",
    "keywords",
)
CLAUDE_PACKAGES = {
    "1-marketing-strategies": {
        "displayName": "Marketing Strategies",
        "category": "productivity",
    },
    "2-writing-and-editing": {
        "displayName": "Writing & Editing",
        "category": "productivity",
    },
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
    "portable manifest": ROOT / "plugin.json",
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


def keyword_set(document, path, subject):
    keywords = document.get("keywords")
    if not isinstance(keywords, list):
        fail(path, f"{subject} keywords must be an array")
        return None
    if not all(isinstance(keyword, str) for keyword in keywords):
        fail(path, f"{subject} keywords must contain only strings")
        return None
    duplicates = sorted(
        keyword for keyword in set(keywords) if keywords.count(keyword) > 1
    )
    if duplicates:
        fail(path, f"{subject} keywords contain duplicates: {', '.join(duplicates)}")
    return set(keywords)


def require_product_search_names(values, path, subject):
    if values is None:
        return
    missing = sorted(PRODUCT_SEARCH_NAMES - values)
    if missing:
        fail(
            path,
            f"{subject} must include required search names: {', '.join(missing)}",
        )
    prefixed = sorted(PRODUCT_DISPLAY_NAMES & values)
    if prefixed:
        fail(
            path,
            f"{subject} must omit A1-prefixed product names: {', '.join(prefixed)}",
        )


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
portable_manifest = load_json("portable manifest")

portable_manifest_path = MANIFEST_PATHS["portable manifest"]
if not isinstance(portable_manifest, dict):
    fail(portable_manifest_path, "portable manifest must be a JSON object")
    portable_manifest = {}

unknown_portable_fields = sorted(
    set(portable_manifest) - PORTABLE_MANIFEST_FIELDS
)
if unknown_portable_fields:
    fail(
        portable_manifest_path,
        "portable manifest contains unsupported top-level fields: "
        + ", ".join(unknown_portable_fields),
    )

check_value(portable_manifest, portable_manifest_path, "$schema", AGENT_PLUGINS_SCHEMA)
portable_name = portable_manifest.get("name")
if (
    not isinstance(portable_name, str)
    or not 1 <= len(portable_name) <= 64
    or re.fullmatch(r"[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?", portable_name)
    is None
    or "--" in portable_name
    or ".." in portable_name
):
    fail(
        portable_manifest_path,
        "name must satisfy the Agent Plugins v1 name constraints",
    )
full_plugin_name = portable_name if isinstance(portable_name, str) else ""
claude_full_plugin_source = f"./plugins/{full_plugin_name}"

for field in ("version", "description", "homepage", "repository", "license"):
    if field in portable_manifest and not isinstance(portable_manifest[field], str):
        fail(portable_manifest_path, f"{field!r} must be a string")

portable_author = portable_manifest.get("author")
if portable_author is not None:
    if not isinstance(portable_author, dict):
        fail(portable_manifest_path, "'author' must be an object")
    else:
        unknown_author_fields = sorted(
            set(portable_author) - {"name", "email", "url"}
        )
        if unknown_author_fields:
            fail(
                portable_manifest_path,
                "author contains unsupported fields: "
                + ", ".join(unknown_author_fields),
            )
        for field, value in portable_author.items():
            if not isinstance(value, str):
                fail(
                    portable_manifest_path,
                    f"author field {field!r} must be a string",
                )

portable_extensions = portable_manifest.get("extensions")
if portable_extensions is not None:
    if not isinstance(portable_extensions, dict):
        fail(portable_manifest_path, "'extensions' must be an object")
    else:
        for namespace, value in portable_extensions.items():
            if not isinstance(namespace, str) or not isinstance(value, dict):
                fail(
                    portable_manifest_path,
                    "each extension namespace must map to an object",
                )

for label, marketplace in (
    ("claude marketplace", claude_marketplace),
    ("codex marketplace", codex_marketplace),
    ("cursor marketplace", cursor_marketplace),
):
    check_value(
        marketplace,
        MANIFEST_PATHS[label],
        "name",
        portable_name,
    )

for label, manifest in (
    ("codex manifest", codex_manifest),
    ("cursor manifest", cursor_manifest),
):
    path = MANIFEST_PATHS[label]
    check_value(manifest, path, "name", portable_name)
    check_value(manifest, path, "skills", SKILLS_PATH)
    skills_value = manifest.get("skills")
    skills_dir = (
        ROOT / skills_value.removeprefix("./")
        if isinstance(skills_value, str)
        else None
    )
    if skills_dir is None or not skills_dir.is_dir():
        fail(path, f"skills path does not resolve to a directory: {manifest.get('skills')!r}")

for field in PORTABLE_SHARED_FIELDS:
    expected = portable_manifest.get(field)
    for label, manifest in (
        ("codex manifest", codex_manifest),
        ("cursor manifest", cursor_manifest),
    ):
        check_value(manifest, MANIFEST_PATHS[label], field, expected)

portable_version = portable_manifest.get("version")
if not isinstance(portable_version, str) or not re.fullmatch(
    r"(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)", portable_version
):
    fail(
        portable_manifest_path,
        f"version must use MAJOR.MINOR.PATCH semver, found {portable_version!r}",
    )

claude_plugin_entries = {}
claude_package_expectations = {
    **CLAUDE_PACKAGES,
    full_plugin_name: {
        "displayName": PRODUCT_DISPLAY_NAME,
        "category": "productivity",
    },
}
for name, expected_metadata in claude_package_expectations.items():
    entry = plugin_entry(
        claude_marketplace,
        MANIFEST_PATHS["claude marketplace"],
        name,
    )
    claude_plugin_entries[name] = entry
    for key, expected_value in expected_metadata.items():
        check_value(
            entry,
            MANIFEST_PATHS["claude marketplace"],
            key,
            expected_value,
        )

claude_full_plugin = claude_plugin_entries[full_plugin_name]
claude_full_description = claude_full_plugin.get("description")
if (
    not isinstance(claude_full_description, str)
    or PRODUCT_DISPLAY_NAME not in claude_full_description
    or PRODUCT_DISPLAY_NAME_RU in claude_full_description
):
    fail(
        MANIFEST_PATHS["claude marketplace"],
        f"full plugin description must use {PRODUCT_DISPLAY_NAME!r} in English only",
    )
codex_full_plugin = plugin_entry(
    codex_marketplace,
    MANIFEST_PATHS["codex marketplace"],
    full_plugin_name,
)
cursor_full_plugin = plugin_entry(
    cursor_marketplace,
    MANIFEST_PATHS["cursor marketplace"],
    full_plugin_name,
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

full_plugin_keywords = {
    "Portable manifest": (
        keyword_set(
            portable_manifest,
            portable_manifest_path,
            "full plugin",
        ),
        portable_manifest_path,
    ),
    "Claude marketplace": (
        keyword_set(
            claude_full_plugin,
            MANIFEST_PATHS["claude marketplace"],
            "full plugin",
        ),
        MANIFEST_PATHS["claude marketplace"],
    ),
    "Codex manifest": (
        keyword_set(
            codex_manifest,
            MANIFEST_PATHS["codex manifest"],
            "full plugin",
        ),
        MANIFEST_PATHS["codex manifest"],
    ),
    "Cursor manifest": (
        keyword_set(
            cursor_manifest,
            MANIFEST_PATHS["cursor manifest"],
            "full plugin",
        ),
        MANIFEST_PATHS["cursor manifest"],
    ),
}
for label, (keywords, path) in full_plugin_keywords.items():
    require_product_search_names(keywords, path, f"{label} full-plugin keywords")

for package_name in ("1-marketing-strategies", "2-writing-and-editing"):
    package_keywords = keyword_set(
        claude_plugin_entries[package_name],
        MANIFEST_PATHS["claude marketplace"],
        f"{package_name} plugin",
    )
    require_product_search_names(
        package_keywords,
        MANIFEST_PATHS["claude marketplace"],
        f"{package_name} plugin keywords",
    )

cursor_tags = cursor_manifest.get("tags")
if not isinstance(cursor_tags, list) or not all(
    isinstance(tag, str) for tag in cursor_tags
):
    fail(
        MANIFEST_PATHS["cursor manifest"],
        "full plugin tags must be an array of strings",
    )
else:
    forbidden_tags = sorted(
        (PRODUCT_SEARCH_NAMES | PRODUCT_DISPLAY_NAMES) & set(cursor_tags)
    )
    if forbidden_tags:
        fail(
            MANIFEST_PATHS["cursor manifest"],
            "full plugin tags must omit product-name search terms: "
            + ", ".join(forbidden_tags),
        )

claude_keywords = full_plugin_keywords["Claude marketplace"][0]
if claude_keywords is not None:
    for label, (keywords, path) in full_plugin_keywords.items():
        if keywords is None or keywords == claude_keywords:
            continue
        missing = sorted(claude_keywords - keywords)
        extra = sorted(keywords - claude_keywords)
        details = []
        if missing:
            details.append(f"missing: {', '.join(missing)}")
        if extra:
            details.append(f"extra: {', '.join(extra)}")
        fail(
            path,
            f"{label} full-plugin keywords must match Claude marketplace"
            + (f" ({'; '.join(details)})" if details else ""),
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
    "source",
    claude_full_plugin_source,
)
claude_full_plugin_dir = ROOT / claude_full_plugin_source.removeprefix("./")
if not claude_full_plugin_dir.is_dir():
    fail(
        MANIFEST_PATHS["claude marketplace"],
        f"{full_plugin_name!r} source does not resolve to a directory",
    )

if codex_full_plugin.get("source") != {
    "source": "url",
    "url": REPOSITORY_URL,
}:
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{full_plugin_name!r} source must point to {REPOSITORY_URL}",
    )
if codex_full_plugin.get("policy") != {
    "installation": "AVAILABLE",
    "authentication": "ON_INSTALL",
}:
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{full_plugin_name!r} must use the approved installation and authentication policy",
    )
if codex_full_plugin.get("category") != "Productivity":
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{full_plugin_name!r} category must be 'Productivity'",
    )

if cursor_full_plugin.get("source") != "./":
    fail(
        MANIFEST_PATHS["cursor marketplace"],
        f"{full_plugin_name!r} source must be './'",
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
        f"{full_plugin_name!r} dependencies must be an array",
    )
    declared_dependencies = []
declared_skills = []
for dependency in declared_dependencies:
    package = claude_plugins.get(dependency)
    if package is None:
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"{full_plugin_name!r} references missing dependency {dependency!r}",
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
    print(f"\nPackaging summary: {len(failures)} failures")
    sys.exit(1)

print(
    "Packaging summary: portable identity, product slug, display names, and "
    "bilingual search names are synchronized across Agent Plugins, Claude, Codex, "
    "and Cursor; "
    "Claude package categories validated; "
    f"{len(canonical_skills)} canonical skills covered"
)
