# Marketing Skills

Marketing skills for AI agents.

This repository follows the Agent Skills directory format: each skill is a self-contained folder with a `SKILL.md` file and optional `references/`, `scripts/`, or `assets/`.

## Skills

<!-- SKILLS:START -->
| Skill | Description |
|-------|-------------|
| [editor](skills/editor/) | Fast marketing text editor and rewrite assistant. Use when the user wants to shorten, rewrite, sharpen, clean up,... |
| [editor-in-chief](skills/editor-in-chief/) | Strategic editorial director for strict text diagnosis, questioning, editor brief creation, and handoff to editor. Use... |
| [marketing-context](skills/marketing-context/) | Create or update the shared marketing context for a repository. Use when the user wants to set up marketing context,... |
<!-- SKILLS:END -->

## Architecture

The v1 system has three skills:

- `marketing-context`: creates and updates the shared `.agents/marketing-context.md` file for the repository.
- `editor`: public, auto-triggered, soft-gate text rewriting.
- `editor-in-chief`: command-only strategic editor, hard gate, Editor Brief, and handoff to `editor`.

The `marketing-context` skill is shared by all future marketing skills. It stores product, audience, positioning, voice, proof, and business context. It does not store editorial canon.

## Platform Support

Canonical skills live in `skills/`.

Claude Code plugin metadata lives in `.claude-plugin/`.

Cursor support lives in `.cursor/rules/` as an adapter. Cursor rules are not the source of truth.

Maintainer scripts live in `scripts/` and are not required after installation.

## Compatibility Philosophy

This repository follows the Agent Skills format with documented pragmatic extensions when behavior matters more than strict spec purity.

Allowed extension:

- `disable-model-invocation: true` may be used for command-only skills such as `editor-in-chief`, where accidental auto-triggering would produce the wrong workflow.

## Development

Validate skills:

```bash
./scripts/validate-skills.sh
```

Sync the README skill table and Claude plugin version metadata:

```bash
node scripts/sync-readme-and-plugin.js
```
