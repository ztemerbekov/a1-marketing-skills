<p align="center">
  <img src="./assets/marketing-skills-mascot.png" alt="Marketing Skills mascot" width="140" height="140">
</p>

# Marketing Skills

Marketing skills for AI agents.

This repository follows the Agent Skills directory format: each skill is a self-contained folder with a `SKILL.md` file and optional `references/`, `scripts/`, or `assets/`.

## Contents

- [Install](#install)
- [Skills](#skills)
- [Architecture](#architecture)
- [Platform Support](#platform-support)
- [Compatibility Philosophy](#compatibility-philosophy)
- [Development](#development)

## Install

### Recommended: npx skills

Install all current skills into the current project:

```bash
npx skills@latest add ztemerbekov/marketing-skills
```

Install only the editorial team skills:

```bash
npx skills@latest add ztemerbekov/marketing-skills --skill a1-setup-marketing-context a1-editor a1-editor-in-chief
```

Remove the installed project skills:

```bash
rm -rf .agents/skills/a1-setup-marketing-context \
       .agents/skills/a1-editor \
       .agents/skills/a1-editor-in-chief \
       .claude/skills/a1-setup-marketing-context \
       .claude/skills/a1-editor \
       .claude/skills/a1-editor-in-chief
```

Use this path first when you want a clean cross-agent install. The platform-specific sections below are fallbacks or client-native alternatives.

### Codex

Install the current skills from GitHub:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo ztemerbekov/marketing-skills \
  --path skills/a1-setup-marketing-context skills/a1-editor skills/a1-editor-in-chief
```

Remove the installed skills:

```bash
rm -rf ~/.codex/skills/a1-setup-marketing-context \
       ~/.codex/skills/a1-editor \
       ~/.codex/skills/a1-editor-in-chief
```

Restart Codex after installing or removing skills.

### Claude Code

Install from GitHub:

```text
/plugin marketplace add ztemerbekov/marketing-skills
/plugin install marketing-skills
```

Install only the editorial team bundle:

```text
/plugin install editorial-team
```

Remove installed plugins:

```text
/plugin uninstall marketing-skills
/plugin uninstall editorial-team
/plugin marketplace remove marketing-skills
```

For local development, add this checkout as the marketplace instead:

```text
/plugin marketplace add /Users/ztemerbekov/Documents/GitHub/marketing-skills
```

### Cursor

Cursor support is a project adapter. Copy the canonical skills and Cursor rule into the project where you want to use them:

```bash
mkdir -p .cursor/rules skills
cp -R /Users/ztemerbekov/Documents/GitHub/marketing-skills/skills/a1-* skills/
cp /Users/ztemerbekov/Documents/GitHub/marketing-skills/.cursor/rules/marketing-skills.mdc .cursor/rules/
```

Remove them from a project:

```bash
rm -rf skills/a1-setup-marketing-context \
       skills/a1-editor \
       skills/a1-editor-in-chief \
       .cursor/rules/marketing-skills.mdc
```

### Antigravity

Antigravity support uses the cross-agent project convention. Copy the canonical skills into the target project's `.agents/skills/` directory:

```bash
mkdir -p .agents/skills
cp -R /Users/ztemerbekov/Documents/GitHub/marketing-skills/skills/a1-* .agents/skills/
```

For a clean install from GitHub into the current project:

```bash
tmpdir="$(mktemp -d)"
git clone --depth 1 https://github.com/ztemerbekov/marketing-skills.git "$tmpdir/marketing-skills"
mkdir -p .agents/skills
cp -R "$tmpdir/marketing-skills"/skills/a1-* .agents/skills/
rm -rf "$tmpdir"
```

Remove them from a project:

```bash
rm -rf .agents/skills/a1-setup-marketing-context \
       .agents/skills/a1-editor \
       .agents/skills/a1-editor-in-chief
```

## Skills

<!-- SKILLS:START -->
| Skill | Description |
|-------|-------------|
| [a1-editor](skills/a1-editor/) | Fast marketing text editor and rewrite assistant. Use when the user wants to shorten, rewrite, sharpen, clean up,... |
| [a1-editor-in-chief](skills/a1-editor-in-chief/) | Strategic editorial director for strict text diagnosis, questioning, editor brief creation, and handoff to editor. Use... |
| [a1-setup-marketing-context](skills/a1-setup-marketing-context/) | Create or update the shared marketing context for a repository. Use when the user wants to set up marketing context,... |
<!-- SKILLS:END -->

## Architecture

The v1 system has three skills:

- `a1-setup-marketing-context`: creates and updates the shared `.agents/marketing-context.md` file for the repository.
- `a1-editor`: public, auto-triggered, soft-gate text rewriting.
- `a1-editor-in-chief`: command-only strategic editor, hard gate, Editor Brief, and handoff to `a1-editor`.

The `a1-setup-marketing-context` skill is shared by all future marketing skills. It stores product, audience, positioning, voice, proof, and business context. It does not store editorial canon.

## Platform Support

Canonical skills live in `skills/`.

Claude Code plugin metadata lives in `.claude-plugin/`.

Cursor support lives in `.cursor/rules/` as an adapter. Cursor rules are not the source of truth.

Antigravity support uses `.agents/skills/` at the target project level.

Maintainer scripts live in `scripts/` and are not required after installation.

## Compatibility Philosophy

This repository follows the Agent Skills format with documented pragmatic extensions when behavior matters more than strict spec purity.

Allowed extension:

- `disable-model-invocation: true` may be used for command-only skills such as `a1-editor-in-chief`, where accidental auto-triggering would produce the wrong workflow.

## Development

Validate skills:

```bash
./scripts/validate-skills.sh
```

Sync the README skill table and Claude plugin version metadata:

```bash
node scripts/sync-readme-and-plugin.js
```
