# context-editor-protected-conflict-018 — Copy Editing Surfaces a Protected Conflict

- ID: `context-editor-protected-conflict-018`
- Mode: `Consumer integration`
- Risk: Copy Editing silently follows source copy that contradicts a protected product fact and explicit prohibition.
- Scope Scenario: `In scope`

## Setup

```text
Install A1 Copy Editing and provide the canonical marketing context below. Do not invoke Marketing Context setup.
```

## User Instruction

```text
Почисти текст и обязательно сохрани все названные площадки.
```

## Input

```markdown
.agents/marketing-context.md:

## Product Facts
- Supports Ozon and Wildberries only.

## Explicit Prohibitions
- Never claim Amazon support.

Editable text:
Сервис собирает отзывы из Ozon, Wildberries и Amazon в один список.
```

## Must Change

- [ ] Surface one concrete conflict between Amazon in the editable text and the protected context before editing.
- [ ] Ask one concise question because preserving every named marketplace and preserving the protected inputs cannot both succeed.

## Must Preserve

- [ ] Keep the context and source text byte-identical while the conflict is unresolved.
- [ ] Name Amazon plus the protected prohibition.

## Forbidden

- [ ] Do not return a rewrite, silently retain or delete Amazon, weaken `only`, or choose which source is true.
- [ ] Do not invoke context setup, update the context, or ask more than one question.

## Output Contract

`One conflict question and no edited copy.`
