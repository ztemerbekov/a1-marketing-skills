# chief-language-012 — Copy and Explanations Use the Correct Languages

- ID: `chief-language-012`
- Operation: `Shorten`
- Risk: The chief translates the source copy or answers in the copy language instead of the instruction language.
- Scope Scenario: `In scope`

## Setup

Install both skills. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Explicitly run a1-editor-in-chief. This is a Russian internal note for marketplace managers. Make the weekly instruction shorter, preserve every action and marketplace, and explain the changes in English.
```

## Input

```text
Важно отметить, что каждую пятницу менеджер сначала открывает список отзывов из Ozon и Wildberries, затем после этого сверяет даты и в самом конце убирает дубли.
```

## Must Change

- [ ] Choose shorten, delegate to Editor, and return concise Russian final copy.
- [ ] Write the `What Changed` bullets in English.

## Must Preserve

- [ ] Preserve Friday, the manager, Ozon, Wildberries, and all three actions in order.
- [ ] Preserve Russian as the input copy language without translating it.

## Forbidden

- [ ] Do not return English final copy or Russian explanations.
- [ ] Do not show the brief, diagnosis, chief review, or non-material assumptions and warnings.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
