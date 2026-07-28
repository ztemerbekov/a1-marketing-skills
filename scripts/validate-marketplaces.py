#!/usr/bin/env python3

import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
MARKETPLACE_NAME = "a1-marketing-skills"
SUITE_NAME = "a1-marketing-suite"
SKILLS_PATH = "./skills/"
REPOSITORY_URL = "https://github.com/ztemerbekov/a1-marketing-skills.git"

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
        MARKETPLACE_NAME,
    )

for label, manifest in (
    ("codex manifest", codex_manifest),
    ("cursor manifest", cursor_manifest),
):
    path = MANIFEST_PATHS[label]
    check_value(manifest, path, "name", SUITE_NAME)
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

claude_suite = plugin_entry(
    claude_marketplace,
    MANIFEST_PATHS["claude marketplace"],
    SUITE_NAME,
)
codex_suite = plugin_entry(
    codex_marketplace,
    MANIFEST_PATHS["codex marketplace"],
    SUITE_NAME,
)
cursor_suite = plugin_entry(
    cursor_marketplace,
    MANIFEST_PATHS["cursor marketplace"],
    SUITE_NAME,
)

if codex_suite.get("source") != {
    "source": "url",
    "url": REPOSITORY_URL,
}:
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{SUITE_NAME!r} source must point to {REPOSITORY_URL}",
    )
if codex_suite.get("policy") != {
    "installation": "AVAILABLE",
    "authentication": "ON_INSTALL",
}:
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{SUITE_NAME!r} must use the approved installation and authentication policy",
    )
if codex_suite.get("category") != "Productivity":
    fail(
        MANIFEST_PATHS["codex marketplace"],
        f"{SUITE_NAME!r} category must be 'Productivity'",
    )

if cursor_suite.get("source") != "./":
    fail(
        MANIFEST_PATHS["cursor marketplace"],
        f"{SUITE_NAME!r} source must be './'",
    )

claude_plugins = {
    entry.get("name"): entry
    for entry in claude_marketplace.get("plugins", [])
    if isinstance(entry, dict) and isinstance(entry.get("name"), str)
}
declared_dependencies = claude_suite.get("dependencies", [])
if not isinstance(declared_dependencies, list):
    fail(
        MANIFEST_PATHS["claude marketplace"],
        f"{SUITE_NAME!r} dependencies must be an array",
    )
    declared_dependencies = []
declared_skills = []
for dependency in declared_dependencies:
    package = claude_plugins.get(dependency)
    if package is None:
        fail(
            MANIFEST_PATHS["claude marketplace"],
            f"{SUITE_NAME!r} references missing dependency {dependency!r}",
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
        "suite composition must cover every canonical skill exactly once"
        + (f" ({'; '.join(details)})" if details else ""),
    )

if failures:
    for failure in failures:
        print(f"FAIL {failure}")
    print(f"\nMarketplace summary: {len(failures)} failures")
    sys.exit(1)

print(
    "Marketplace summary: Claude, Codex, and Cursor identities are synchronized; "
    f"{len(canonical_skills)} canonical skills covered"
)
