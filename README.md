![Marketing Skills](./assets/marketing-skills-evolution.png)

# Marketing Skills

**English** | [Русский](./README.ru.md)

Marketing skills for AI agents.

This repository follows the Agent Skills directory format: each skill is a self-contained folder with a `SKILL.md` file and optional `references/`, `scripts/`, or `assets/`.

## Contents

- [Install](#install)
- [Skills](#skills)
- [Design Contract](#design-contract)
- [Architecture](#architecture)
- [Platform Support](#platform-support)
- [Compatibility Philosophy](#compatibility-philosophy)
- [Development](#development)

## Install

### <img src="./assets/vercel.webp" alt="npx skills" width="16" height="16"> Recommended: npx skills

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

### <img src="./assets/codex.webp" alt="Codex" width="16" height="16"> Codex

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

### <img src="./assets/claude.webp" alt="Claude Code" width="16" height="16"> Claude Code

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

### <img src="./assets/cursor.webp" alt="Cursor" width="16" height="16"> Cursor

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

### <img src="./assets/antigravity.webp" alt="Antigravity" width="16" height="16"> Antigravity

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
| [a1-editor](skills/a1-editor/) | Fast marketing text editor and rewrite assistant. Use when the user wants to shorten, rewrite, clean up, clarify,... |
| [a1-editor-in-chief](skills/a1-editor-in-chief/) | Strategic editorial director for strict text diagnosis, blocking questions, editor brief creation, and handoff to... |
| [a1-setup-marketing-context](skills/a1-setup-marketing-context/) | Create or update the shared marketing context for a repository. Use when the user wants to set up marketing context,... |
<!-- SKILLS:END -->

## Design Contract

A1 skills keep complexity inside and the user-facing surface simple:

- One public skill represents one understandable user job. Variations stay as internal operations until they require a materially different interaction contract.
- Safe natural-language entry points are model-invoked. Deliberate interviews and consequential workflows are user-invoked or command-only.
- Fast skills use marketing context when it exists but continue without it. A strategic skill may require context when proceeding would force an unsafe choice.
- Results can vary with the material, but the process stays predictable: every skill has a short invariant spine and reveals deeper references only when needed.

Maintainers use the canonical [A1 skill design contract](docs/a1-skill-design-contract.md) and [A1 marketing glossary](docs/a1-marketing-glossary.md). Each installed skill remains self-contained.

If a skill produces a bad result, remove confidential data and email the input, instruction, output, and expected behavior to [z.temerbekov@gmail.com](mailto:z.temerbekov@gmail.com).

## Architecture

The v1 system has three skills:

- `a1-setup-marketing-context`: creates and updates the shared `.agents/marketing-context.md` file for the repository.
- `a1-editor`: public, auto-triggered, soft-gate text rewriting.
- `a1-editor-in-chief`: command-only strategic editor, hard gate, Editor Brief, and handoff to `a1-editor`.

The `a1-setup-marketing-context` skill is shared by all future marketing skills. It stores product, audience, positioning, voice, proof, and business context. It does not store editorial canon.

## Editing Workflows and Modes

Choose the entry point by how much assignment discovery you need:

| Workflow | Use it when | Behavior |
|----------|-------------|----------|
| `a1-editor` | The text and editing intent are already clear | Starts immediately with a soft gate and returns the edited text plus concise change notes |
| `a1-editor-in-chief` | Reader, goal, channel, constraints, or editorial strategy need to be established | Uses a hard gate, creates an Editor Brief, and then hands the selected operation to `a1-editor` |

Both workflows use the same editing operations. Standard requests such as “edit,” “clean up,” “shorten,” or “clarify” preserve the normal, more conservative editing behavior.

Information style is a separate explicit mode. Activate it with unambiguous requests such as “in information style,” “по Ильяхову,” or “по «Пиши, сокращай».” The mode may remove empty author-focused setup, neutralize unsupported evaluations, reorganize existing material, and improve Markdown. It still cannot introduce facts, definitions, claims, or conclusions from model knowledge. Explicit constraints such as “preserve my voice” or “preserve the structure” always take priority.

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
