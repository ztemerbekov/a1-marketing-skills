# chief-explicit-003 — Complete Assignment Returns Minimal Reviewed Output

- ID: `chief-explicit-003`
- Operation: `Clarify`
- Risk: A complete assignment is questioned again, exposes internal process, or lets the chief rewrite without Editor.
- Scope Scenario: `In scope`

## Setup

Install both chief and Editor. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Текст читает менеджер маркетплейса, который уже работает с отчетом. После внутреннего email он должен понять порядок еженедельной проверки. Сохрани пятницу, 16:00, Ozon, Wildberries и три действия; не добавляй факты. Верни обычный финальный ответ, бриф не показывай.
```

## Input

```text
Важным моментом является то, что по пятницам в 16:00 менеджер сначала открывает список отзывов из Ozon и Wildberries, затем после этого сверяет даты и в самом конце убирает дубли.
```

## Must Change

- [ ] Без дополнительных вопросов выбрать `clarify`, создать скрытый Editor Brief, делегировать текст Editor и проверить результат.
- [ ] Вернуть только `Final Text` и один-пять пунктов `What Changed`.

## Must Preserve

- [ ] Сохранить пятницу, 16:00, Ozon, Wildberries и порядок трёх действий.
- [ ] Сохранить русский язык текста и объяснений.

## Forbidden

- [ ] Не показывать Input Summary, diagnosis, Editor Brief, handoff, `Chief Review`, assumptions или warnings без материальной причины.
- [ ] Не добавлять аудиторию, выгоды, метрики, CTA, offer, proof, новую маркетинговую структуру или факты.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
