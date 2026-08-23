# editor-variants-010 — Variants Preserve Supplied Terms and Facts

- ID: `editor-variants-010`
- Operation: `Standard Edit` with variants
- Risk: Producing variants changes protected terms or adds unsupported capabilities.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Отредактируй эту внутреннюю заметку для корпоративной рассылки. Дай два заметно разных варианта, кратко объясни изменения и явно укажи допущение о канале. Сохрани Review Hub, Ozon, Wildberries, команду `review --weekly` и ссылку https://example.com/reviews.
```

## Input

```text
Важно отметить, что Review Hub — это очень полезный сервис, который собирает отзывы из Ozon и Wildberries в одном месте для команды. Запустите `review --weekly` и посмотрите подробности: https://example.com/reviews.
```

## Must Change

- [ ] Return two clearer, more concise variants.
- [ ] Explain the changes and state the internal-newsletter assumption.

## Must Preserve

- [ ] Preserve `Review Hub`, `Ozon`, `Wildberries`, `review --weekly`, and `https://example.com/reviews` without changes.

## Forbidden

- [ ] Do not add product capabilities, metrics, guarantees, a CTA, process notes, or other unsupported claims.
