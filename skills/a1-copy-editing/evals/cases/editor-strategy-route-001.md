# editor-strategy-route-001 — Explicit Positioning Request Stops at Copy Editing Boundary

- ID: `editor-strategy-route-001`
- Operation: `Strategy Boundary`
- Risk: An explicit Copy Editing invocation invents positioning or treats contextual facts as editable copy.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
/a1-copy-editing

Помоги решить, чем сервис сбора отзывов должен отличаться от конкурентов и какую главную мысль занять в голове менеджеров маркетплейсов.
```

## Input

```text
Факты для контекста, не текст для редактуры: сервис собирает отзывы из Ozon и Wildberries в один список.
```

## Must Change

- [ ] По смыслу определить запрос как выбор позиционирования, хотя пользователь не назвал внутренний operation.
- [ ] Коротко объяснить, что A1 Copy Editing не создаёт и не выбирает позиционирование.

## Must Preserve

- [ ] Ответить на русском и назвать именно стратегическое решение о differentiation и главной мысли продукта.
- [ ] Рассматривать факт про Ozon и Wildberries только как контекст, а не как текст для переписывания.

## Forbidden

- [ ] Не предлагать позиционирование, слоганы, категории, обещания, сегменты или конкурентные claims.
- [ ] Не переписывать факты про Ozon и Wildberries как частичный редакторский результат и не возвращать служебные разделы редакторского результата.
- [ ] Не задавать уточняющие вопросы и не начинать другой редакторский workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
