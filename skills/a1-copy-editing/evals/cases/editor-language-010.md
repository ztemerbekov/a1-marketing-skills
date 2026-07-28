# editor-language-010 — Instruction Language Localizes the Complete Response

- ID: `editor-language-010`
- Operation: `Standard Edit` with variants
- Risk: The source language overrides the instruction language for service elements, or the Copy Editing translates the source copy.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Edit this Russian internal note and keep the edited copy in Russian. Treat it as a draft for an internal newsletter and state that assumption explicitly. Preserve Review Hub, Ozon, Wildberries, the command `review --weekly`, and the link https://example.com/reviews. Give two distinct variants and explain the changes in English.
```

## Input

```text
Важно отметить, что Review Hub — это очень полезный сервис, который собирает отзывы из Ozon и Wildberries в одном месте для команды. Запустите `review --weekly` и посмотрите подробности: https://example.com/reviews.
```

## Must Change

- [ ] Return two clearer, more concise Russian variants.
- [ ] Use naturally localized English headings for edited copy, changes, and assumptions, plus English labels for both variants.
- [ ] Explain the changes and state the internal-newsletter assumption in English.

## Must Preserve

- [ ] Preserve Russian as the edited-copy language without translating it.
- [ ] Preserve `Review Hub`, `Ozon`, `Wildberries`, `review --weekly`, and `https://example.com/reviews` without changes.

## Forbidden

- [ ] Do not use Russian service labels or explanations, or return English edited copy.
- [ ] Do not add product capabilities, metrics, guarantees, a CTA, process notes, or other unsupported claims.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
