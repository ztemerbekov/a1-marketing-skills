# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository Purpose

This repository contains marketing-focused Agent Skills. Skills should be useful across Codex, Claude Code, Cursor, and other clients that understand the Agent Skills folder format.

## Agent skills

### Issue tracker

Work is tracked in GitHub Issues. External pull requests are not a triage request surface. See `docs/agents/issue-tracker.md`.

### Triage labels

Use the canonical `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, and `wontfix` labels. See `docs/agents/triage-labels.md`.

### Domain docs

This is currently a single-context repository: use root `CONTEXT.md` and `docs/adr/` when they exist. When adding a skill, reassess whether it introduces a distinct domain context; raise the need for `CONTEXT-MAP.md` with the user before creating one. See `docs/agents/domain.md`.

## README Languages

`README.md` is the default English README.

`README.ru.md` is the Russian translation.

Keep the language switcher near the top of both files:

- `README.md`: `**English** | [Русский](./README.ru.md)`
- `README.ru.md`: `[English](./README.md) | **Русский**`

When changing installation, architecture, platform-support, or development instructions in one README, update the other README in the same change.

## Architecture

Canonical skills live under `skills/`:

```text
skills/
  a1-marketing-context/
  a1-editor/
  a1-editor-in-chief/
  a1-update/
```

Each skill directory must be self-contained and installable directly from GitHub. Do not require users to run a build or sync step after installation.

Public installation and updates use the cross-agent `npx skills` CLI. Do not add client-specific plugin metadata, rules, copied skill trees, or manual installers unless a future issue explicitly restores that compatibility surface.

`scripts/` contains maintainer tools only and is not required after installation.

## A1 Design Contract

Every new or materially changed skill must follow the canonical [A1 skill design contract](docs/a1-skill-design-contract.md). Use the [A1 marketing glossary](docs/a1-marketing-glossary.md) for shared operational terms.

Before declaring a new or materially changed skill complete, use the [A1 skill completion checklist](docs/a1-skill-completion-checklist.md). Record the installed semantic run and any remaining limitations; structural validation alone is not a semantic pass.

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
- Every skill must include this exact language policy:

```markdown
## Language

Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise.
```

## Compatibility Philosophy

Behavior over spec purity.

This repository follows the Agent Skills format, with documented pragmatic extensions when they protect critical runtime behavior.

Allowed extensions:

- `disable-model-invocation: true` may be used for command-only skills such as `a1-editor-in-chief`, where accidental auto-triggering would produce the wrong workflow.
- `agents/openai.yaml` may provide UI-only display metadata for a canonical skill. It must not redefine runtime behavior, duplicate the skill tree, or be required by clients that ignore it.

When adding a non-standard field:

- Document it here.
- Teach validators to accept it.
- Keep the scope narrow.
- Do not add platform-specific hacks just because they are convenient.

## Current Skills

### a1-marketing-context

Public, Model-invoked context-maintenance skill for explicit natural-language setup and update intent.

Uses Auto-draft for ordinary explicit requests and starts a one-question-at-a-time interview only when explicitly requested. It creates and incrementally updates one public `.agents/marketing-context.md` per repository from confirmed information, preserves unrelated additions, and never creates hypotheses or writes passively after installation, project opening, a generic marketing mention, or another skill finding no context.

### a1-editor

Public, auto-triggered rewrite skill.

Uses a soft gate: if the user provides text and an editing command, it works immediately. It should not block on missing marketing context, audience, channel, or constraints. It must not invent facts or unsupported claims.

### a1-editor-in-chief

Public, command-only bounded chief-editor skill.

Classifies scope before all other work, accepts completed product and marketing decisions as inputs, and uses an adaptive gate for only the material editorial facts that remain unclear. It chooses the editing operation, creates an internal Editor Brief, delegates all text execution to `a1-editor`, reviews the result, and may request at most one corrective Editor pass. It does not create market research, segmentation, pricing, positioning, GTM, product strategy, or general marketing strategy.

### a1-update

Public, explicitly requested update skill.

Uses `npx skills` to refresh only installations tracked from `ztemerbekov/marketing-skills`. Existing skills and upstream deletions are applied without confirmation; newly available skills require one grouped confirmation. It must not update unrelated sources, scan other projects, or connect new clients without permission.

## Cross-Client Distribution

Do not put Claude-only command injection syntax, Cursor-only MDC behavior, or Codex-only assumptions into canonical `skills/*/SKILL.md` files unless we explicitly accept that as a documented behavior-over-spec extension.

Keep the canonical Agent Skills folders compatible with the clients supported by `npx skills`. Client selection and linking belong to the installer, not to repository adapters.

## Change Reporting

After every code or documentation change, include a suggested commit title in the response.

## Validation

Run:

```bash
./scripts/validate-skills.sh
```

Before changing README skill lists, run:

```bash
node scripts/sync-readmes.js
```
