# context-legacy-precedence-023 — Two Legacy Contexts Stop Migration

- ID: `context-legacy-precedence-023`
- Mode: `Auto-draft`
- Risk: Marketing Context merges, selects for migration, or removes one of two legacy contexts without a user decision.
- Scope Scenario: `In scope`

## Setup

```text
The canonical context is absent. Both repository-local legacy paths exist. No other authoritative product material exists.
```

## User Instruction

```text
Set up marketing context for this repository.
```

## Input

```markdown
.claude/marketing-context.md:
## Product
- Review Hub collects Ozon and Wildberries reviews in one list.

marketing-context.md:
## Product
- Review Hub supports Amazon only.
```

## Must Change

- [ ] Ask one concrete migration question naming both legacy paths and make zero file or directory changes.

## Must Preserve

- [ ] Preserve both legacy files byte-for-byte.
- [ ] Preserve the distinction between ordinary consumer precedence and a migration that would alter stored context.

## Forbidden

- [ ] Do not create canonical context, merge legacy content, choose a source for migration, or remove either legacy file.
- [ ] Do not infer a winner from path recency, source wording, or product plausibility.
