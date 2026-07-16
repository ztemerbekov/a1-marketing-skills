# editor-language-011 — English Instruction Keeps Russian Copy and English Service Elements

- ID: `editor-language-011`
- Operation: `Shorten`
- Risk: Russian source copy causes the Editor to answer in Russian instead of using the English instruction language for service elements and explanations.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Shorten this Russian internal note. Keep the edited copy in Russian, preserve every action and marketplace, and explain the changes in English.
```

## Input

```text
Важно отметить, что каждую пятницу менеджер сначала открывает список отзывов из Ozon и Wildberries, затем после этого сверяет даты и в самом конце убирает дубли.
```

## Must Change

- [ ] Return concise Russian edited copy under `Edited Version`.
- [ ] Use `What Changed` and write every change explanation in English.

## Must Preserve

- [ ] Preserve Russian as the edited-copy language without translating the note.
- [ ] Preserve Friday, the manager, Ozon, Wildberries, and all three actions in order.

## Forbidden

- [ ] Do not use `Отредактированный текст`, `Что изменилось`, Russian explanations, or English edited copy.
- [ ] Do not add non-material assumptions, warnings, process notes, metrics, or product claims.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
