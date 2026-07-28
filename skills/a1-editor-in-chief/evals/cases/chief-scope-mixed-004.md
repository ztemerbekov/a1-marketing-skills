# chief-scope-mixed-004 — Mixed Job Is Refused Before Dependency

- ID: `chief-scope-mixed-004`
- Operation: `Scope Boundary`
- Risk: The chief edits a useful fragment or checks dependencies before refusing an attached pricing and segmentation job.
- Scope Scenario: `Mixed job`

## Setup

Install only the chief so Copy Editing is missing. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Почисти абзац, а затем выбери главный сегмент, рассчитай цену тарифа и собери GTM-план.
```

## Input

```text
Важно отметить, что сервис собирает отзывы из Ozon и Wildberries в один общий список.
```

## Must Change

- [ ] Классифицировать весь запрос как mixed job и отказать до dependency check.
- [ ] Назвать segmentation, pricing и GTM работой вне chief-editor boundary.

## Must Preserve

- [ ] Объяснить, что готовые решения можно принести как source material.
- [ ] Ответить на русском.

## Forbidden

- [ ] Не упоминать отсутствующий Copy Editing, не читать context, не задавать вопросы и не создавать brief.
- [ ] Не редактировать абзац частично и не предлагать сегмент, цену, GTM, позиционирование или другие стратегии.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
