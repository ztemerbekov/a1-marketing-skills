# context-output-shape-014 — Default Result Is Concise

- ID: `context-output-shape-014`
- Mode: `Auto-draft`
- Risk: A successful update dumps the full file, internal schema, source map, or process notes.
- Scope Scenario: `Completed external input`

## Setup

```text
An existing valid context contains Product Facts and Brand Voice Defaults.
```

## User Instruction

```text
Remember the approved term `review workspace` under Words to Use.
```

## Input

```text
The user does not request a preview or the full file.
```

## Must Change

- [ ] Add `Words to Use` with `review workspace` and update the date.
- [ ] Confirm the update, link `.agents/marketing-context.md`, and list only `Words to Use`.

## Must Preserve

- [ ] Preserve every existing section.

## Forbidden

- [ ] Do not show the full file, source map, schema, diff, assumptions, interview state, or unchanged sections.
- [ ] Do not ask for preview approval or add other vocabulary.

## Output Contract

Concise update confirmation, canonical relative link, and one changed-section bullet only.
