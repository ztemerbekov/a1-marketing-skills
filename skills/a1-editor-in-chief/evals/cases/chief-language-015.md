# chief-language-015 — English Instruction Keeps Russian Copy and Chief Labels

- ID: `chief-language-015`
- Operation: `Shorten`
- Risk: Chief follows the Russian source language or leaks delegated Editor labels instead of using the English instruction language.
- Scope Scenario: `In scope`

## Setup

Install both `a1-editor-in-chief` and `a1-editor`. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Explicitly run a1-editor-in-chief. This is a Russian internal note for marketplace managers. The goal is a direct weekly instruction in one sentence. Shorten it, preserve every action and marketplace, keep the manager explicit as the subject, keep the final copy in Russian, and explain the changes in English. Use a direct, practical voice.
```

## Input

```text
Важно отметить, что каждую пятницу менеджер сначала открывает список отзывов из Ozon и Wildberries, затем после этого сверяет даты и в самом конце убирает дубли.
```

## Must Change

- [ ] Choose shorten, delegate to Editor, and return concise Russian final copy under `Final Text`.
- [ ] Use `What Changed` and write every change explanation in English.

## Must Preserve

- [ ] Preserve Russian as the final-copy language without translating the note.
- [ ] Preserve Friday, the manager, Ozon, Wildberries, and all three actions in order.

## Forbidden

- [ ] Do not use `Edited Version`, Russian service labels, Russian explanations, or English final copy.
- [ ] Do not add non-material assumptions, warnings, input summaries, briefs, diagnosis, review notes, metrics, or product claims.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
