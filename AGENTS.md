# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository Purpose

This repository contains marketing-focused Agent Skills. Skills should be useful across Codex, Claude Code, Cursor, and other clients that understand the Agent Skills folder format.

## Architecture

Canonical skills live under `skills/`:

```text
skills/
  a1-marketing-context/
  a1-editor/
  a1-editor-in-chief/
```

Each skill directory must be self-contained and installable directly from GitHub. Do not require users to run a build or sync step after installation.

Platform-specific files are adapters:

- `.claude-plugin/` is for Claude Code plugin installation.
- `.cursor/rules/` is a Cursor bridge.
- `scripts/` contains maintainer tools only.

Do not make Cursor rules, Claude plugin metadata, or generated files the source of truth for skill behavior.

## Skill Format

Every skill must include `SKILL.md` with YAML frontmatter:

```yaml
---
name: skill-name
description: What the skill does and when to use it.
---
```

Rules:

- `name` must match the directory name.
- Use lowercase letters, digits, and hyphens.
- Name every skill with the `a1-` prefix so the skill list sorts this repository's skills together and near the top. Use lowercase canonical names such as `a1-editor`, not display-style names such as `A1-Editor`.
- Keep `description` specific; include trigger phrases and scope boundaries.
- Keep `SKILL.md` concise. Put detailed canon, rubrics, examples, and templates in `references/`.
- Use relative links from `SKILL.md` to files inside the same skill directory.

## Compatibility Philosophy

Behavior over spec purity.

This repository follows the Agent Skills format, with documented pragmatic extensions when they protect critical runtime behavior.

Allowed extensions:

- `disable-model-invocation: true` may be used for command-only skills such as `a1-editor-in-chief`, where accidental auto-triggering would produce the wrong workflow.

When adding a non-standard field:

- Document it here.
- Teach validators to accept it.
- Keep the scope narrow.
- Do not add platform-specific hacks just because they are convenient.

## Current Skills

### a1-marketing-context

Public, auto-triggered setup skill.

Creates and updates `.agents/marketing-context.md`, one context per repository. The context is shared by all marketing skills and stores product, audience, positioning, voice, proof, vocabulary, examples, and business goals.

### a1-editor

Public, auto-triggered rewrite skill.

Uses a soft gate: if the user provides text and an editing command, it works immediately. It should not block on missing marketing context, audience, channel, or constraints. It must not invent facts or unsupported claims.

### a1-editor-in-chief

Public, command-only strategy skill.

Uses a hard gate. It must not hand off to `a1-editor` until reader, goal, channel or format, constraints, and editing operation are clear. It creates an Editor Brief, then executes the rewrite through the `a1-editor` role.

## Platform Adapters

Do not put Claude-only command injection syntax, Cursor-only MDC behavior, or Codex-only assumptions into canonical `skills/*/SKILL.md` files unless we explicitly accept that as a documented behavior-over-spec extension.

Cursor rules should point to canonical skills, not duplicate their full logic.

Claude plugin files should describe where skills live, not redefine the skills.

## Validation

Run:

```bash
./scripts/validate-skills.sh
```

Before changing plugin metadata or README skill lists, run:

```bash
node scripts/sync-readme-and-plugin.js
```
