# editor-language-010 — Russian Instruction Localizes the Complete Response

- ID: `editor-language-010`
- Operation: `Standard Edit` with variants
- Risk: English source copy causes the Editor to return English service labels or explanations despite a Russian instruction.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Почисти этот английский текст и сохрани английский язык. Считай, что это черновик для внутренней рассылки, и явно укажи это как допущение. Сохрани названия Review Hub и Ozon, команду `review --weekly` и ссылку https://example.com/reviews. Дай два варианта и кратко объясни изменения по-русски.
```

## Input

```text
Review Hub is a really very useful service for teams that want to review Ozon customer comments in one place. Run `review --weekly` and see the details at https://example.com/reviews.
```

## Must Change

- [ ] Вернуть два более ясных и компактных английских варианта.
- [ ] Естественно локализовать на русский служебные заголовки для отредактированного текста, описания изменений и допущений, а также подписи двух вариантов.
- [ ] Объяснить изменения и сформулировать допущение по-русски.

## Must Preserve

- [ ] Сохранить английский язык редактируемого текста.
- [ ] Оставить без перевода и изменений `Review Hub`, `Ozon`, `review --weekly` и `https://example.com/reviews`.

## Forbidden

- [ ] Не использовать английские служебные элементы или пояснения.
- [ ] Не добавлять функции продукта, метрики, гарантии, CTA или другие неподтверждённые утверждения.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
