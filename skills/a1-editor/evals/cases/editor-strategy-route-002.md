# editor-strategy-route-002 — Offer Request Stops at Editor Boundary

- ID: `editor-strategy-route-002`
- Operation: `Strategy Boundary`
- Risk: The fast editor invents an offer or misroutes commercial strategy creation to the bounded chief workflow.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Собери оффер для нового тарифа: реши, что в него включить, чем обосновать цену и к какому действию вести читателя.
```

## Input

```text
Факты для контекста, не текст для редактуры: текущий тариф стоит 4 900 ₽ в месяц и собирает отзывы из Ozon и Wildberries в один список.
```

## Must Change

- [ ] Определить запрос как создание оффера и коммерческого решения, а не как strengthening существующего текста.
- [ ] Коротко объяснить границу A1 Editor и указать, что `a1-editor-in-chief` тоже не создаёт оффер, ценовую логику или CTA и может принять их только как готовый вход.

## Must Preserve

- [ ] Ответить на русском и назвать стратегическую часть: состав тарифа, обоснование цены и CTA еще не выбраны.
- [ ] Не превращать факты о цене и сборе отзывов в готовый оффер.

## Forbidden

- [ ] Не предлагать состав тарифа, ценностное обещание, скидку, urgency, CTA или объяснение цены.
- [ ] Не рекомендовать `a1-editor-in-chief` как способ создать оффер, обосновать цену или выбрать CTA.
- [ ] Не задавать вопросы chief gate, не создавать Editor Brief и не начинать chief workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
