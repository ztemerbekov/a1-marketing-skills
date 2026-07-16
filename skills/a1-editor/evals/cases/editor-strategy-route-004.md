# editor-strategy-route-004 — Campaign Request Stops at Editor Boundary

- ID: `editor-strategy-route-004`
- Operation: `Strategy Boundary`
- Risk: The fast editor creates campaign messaging or misroutes campaign strategy to the bounded chief workflow.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Придумай основную идею запуска и систему сообщений для рекламной кампании нового отчета по отзывам.
```

## Input

```text
Факты для контекста, не текст для редактуры: отчет объединяет отзывы из Ozon и Wildberries.
```

## Must Change

- [ ] Определить запрос как создание campaign concept и message system, а не как редактуру готового объявления.
- [ ] Коротко объяснить границу A1 Editor и указать, что `a1-editor-in-chief` тоже не создаёт кампанию или систему сообщений и может принять их только как готовый вход.

## Must Preserve

- [ ] Ответить на русском и назвать отсутствующую стратегическую основу кампании.
- [ ] Сохранить фактическую границу: известен только источник отзывов.

## Forbidden

- [ ] Не предлагать big idea, слоганы, объявления, каналы, sequence, audience или CTA.
- [ ] Не рекомендовать `a1-editor-in-chief` как способ создать кампанию, big idea или систему сообщений.
- [ ] Не задавать вопросы chief gate, не создавать Editor Brief и не начинать chief workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
