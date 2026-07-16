# editor-strategy-route-003 — Audience Request Stops at Editor Boundary

- ID: `editor-strategy-route-003`
- Operation: `Strategy Boundary`
- Risk: The fast editor chooses a target segment or misroutes segmentation to the bounded chief workflow.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Выбери, на кого нам лучше нацелить продукт в первую очередь и кого считать главным читателем будущих материалов.
```

## Input

```text
Факты для контекста, не текст для редактуры: продукт собирает отзывы из маркетплейсов в один список.
```

## Must Change

- [ ] По смыслу определить запрос как выбор аудитории и приоритетного сегмента.
- [ ] Коротко объяснить границу A1 Editor и указать, что `a1-editor-in-chief` тоже не выбирает аудиторию или сегмент и может принять их только как готовый вход.

## Must Preserve

- [ ] Ответить на русском и отразить, что главный читатель еще должен быть выбран.
- [ ] Не выдавать предположение об аудитории за факт из входных данных.

## Forbidden

- [ ] Не выбирать селлеров, агентства, бренды, роли, размер бизнеса или awareness level.
- [ ] Не рекомендовать `a1-editor-in-chief` как способ выбрать аудиторию, сегмент или главного читателя.
- [ ] Не задавать вопросы chief gate, не создавать Editor Brief и не начинать chief workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
