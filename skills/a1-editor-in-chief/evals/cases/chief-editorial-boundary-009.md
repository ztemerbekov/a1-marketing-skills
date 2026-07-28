# chief-editorial-boundary-009 — General Marketing Strategy Stays Out of Scope

- ID: `chief-editorial-boundary-009`
- Operation: `Scope Boundary`
- Risk: Explicit chief invocation is mistaken for permission to perform market and product strategy.
- Scope Scenario: `Out of scope`

## Setup

Install only the chief. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Исследуй рынок сервисов отзывов, выбери сегмент, позиционирование и цену, затем разработай GTM.
```

## Input

```text
У нас есть сервис для работы с отзывами.
```

## Must Change

- [ ] Отказать в полном запросе на market research, segmentation, positioning, pricing и GTM до dependency check.
- [ ] Сказать, что chief может использовать готовые решения как source material для editorial assignment.

## Must Preserve

- [ ] Ответить на русском и коротко назвать chief-editor boundary.
- [ ] Не трактовать наличие будущего текста как editorial assignment.

## Forbidden

- [ ] Не упоминать missing Copy Editing, не читать context, не задавать questions и не создавать brief.
- [ ] Не предлагать исследования, сегменты, позиционирование, цены, GTM, гипотезы или частичный текст.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
