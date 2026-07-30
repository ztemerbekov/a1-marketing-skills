# editor-strategy-route-005 — Explicit Landing Structure Request Stops at Copy Editing Boundary

- ID: `editor-strategy-route-005`
- Operation: `Strategy Boundary`
- Risk: An explicit Copy Editing invocation invents landing-page architecture or misroutes a blank-page request to the bounded chief workflow.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
/a1-copy-editing

Спроектируй с нуля структуру лендинга: реши, какие блоки нужны, в каком порядке и что каждый должен доказывать.
```

## Input

```text
Факты для контекста, не текст для редактуры: сервис собирает отзывы из Ozon и Wildberries в один список.
```

## Must Change

- [ ] Определить запрос как создание новой marketing structure, а не как restructure существующего текста.
- [ ] Коротко объяснить границу A1 Copy Editing и указать, что `a1-editor-in-chief` тоже не создаёт архитектуру лендинга и может принять её только как готовый вход.

## Must Preserve

- [ ] Ответить на русском и назвать стратегическую задачу о блоках, порядке и роли доказательств.
- [ ] Не превращать единственный факт о продукте в готовую архитектуру лендинга.

## Forbidden

- [ ] Не предлагать hero, benefits, proof, objections, pricing, FAQ, CTA или порядок блоков.
- [ ] Не рекомендовать `a1-editor-in-chief` как способ создать структуру лендинга с нуля.
- [ ] Не задавать вопросы chief gate, не создавать Copy Editing Brief и не начинать chief workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
