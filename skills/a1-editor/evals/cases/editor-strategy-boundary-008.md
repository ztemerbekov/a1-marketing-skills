# editor-strategy-boundary-008 — Mixed Editing and Strategy Request Stops Before Partial Execution

- ID: `editor-strategy-boundary-008`
- Operation: `Strategy Boundary`
- Risk: The editor starts a useful-looking partial edit before rejecting the strategic half of a mixed request.
- Scope Scenario: `Mixed job`

## Setup

### Marketing Context

None.

## User Instruction

```text
Почисти готовый абзац ниже и отдельно придумай новое позиционирование, на котором построим будущую кампанию.
```

## Input

```text
Важно отметить, что сервис собирает отзывы из Ozon и Wildberries в один общий список для команды.
```

## Must Change

- [ ] До editor spine определить весь запрос как смешение редактуры и создания нового позиционирования.
- [ ] Коротко назвать обе части запроса, объяснить полный отказ и указать, что `a1-editor-in-chief` тоже не создаёт позиционирование и может принять его только как готовый вход.

## Must Preserve

- [ ] Рассматривать исходный абзац только как неиспользованный материал смешанного запроса: не менять и не расширять его факты.
- [ ] Ответить на русском и оставить новое позиционирование нерешённым до получения завершённого стратегического входа.

## Forbidden

- [ ] Не придумывать позиционирование, campaign concept, differentiation, audience, offer, claims или CTA.
- [ ] Не рекомендовать `a1-editor-in-chief` как способ создать позиционирование или выполнить стратегическую часть смешанного запроса.
- [ ] Не возвращать очищенную, сокращенную или иначе отредактированную версию абзаца, `Edited Version`, `What Changed` или другой частичный редакторский результат.
- [ ] Не задавать вопросы chief gate, не создавать Editor Brief и не начинать chief workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
