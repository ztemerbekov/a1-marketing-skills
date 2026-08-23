# context-partial-file-008 — One Confirmed Section Is Immediately Valid

- ID: `context-partial-file-008`
- Mode: `Auto-draft`
- Risk: A narrow remember request becomes a full questionnaire or produces placeholder sections.
- Scope Scenario: `Completed external input`

## Setup

```text
No context exists. The user supplies one approved reusable voice rule.
```

## User Instruction

```text
Запомни наш утверждённый tone of voice для будущей маркетинговой работы: практично, спокойно, без суперлативов.
```

## Input

```text
No repository facts or other context fields are supplied.
```

## Must Change

- [ ] Create a valid context containing the schema note and only `Brand Voice Defaults` with the exact approved rule.

## Must Preserve

- [ ] Preserve the practical, calm, no-superlatives meaning and treat it as an overridable default.

## Forbidden

- [ ] Do not ask about product, audience, positioning, proof, or goals.
- [ ] Do not add empty sections, placeholders, invented examples, or a claim that the context is incomplete.

## Output Contract

Confirmation that the file was created, with a link and only `Brand Voice Defaults` listed as changed.
