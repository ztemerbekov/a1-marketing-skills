# chief-language-014 — Russian Instruction Localizes the Complete Chief Response

- ID: `chief-language-014`
- Operation: `Standard Edit` with variants
- Risk: English source copy or delegated Editor headings cause Chief to return English or mixed-language response scaffolding.
- Scope Scenario: `In scope`

## Setup

Install both `a1-editor-in-chief` and `a1-editor`. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запусти a1-editor-in-chief. Это английский текст для внутренней email-рассылки команде marketplace operations. Цель — дать короткое нейтральное описание Review Hub. Сделай два варианта по два предложения, сохрани английский язык, Review Hub, Ozon, Wildberries, команду `review --weekly` и ссылку https://example.com/reviews. Считай, что это черновик для внутренней рассылки, и явно вынеси это как допущение. Обещание `will increase sales` не подтверждено: убери его из текста и вынеси предупреждение, что подтверждения нет. Объясни изменения по-русски.
```

## Input

```text
Review Hub brings Ozon and Wildberries reviews into one list and will increase sales. Run `review --weekly` and see the details at https://example.com/reviews.
```

## Must Change

- [ ] Выбрать bounded editorial direction, делегировать Editor и вернуть два английских варианта без неподтверждённого обещания.
- [ ] Естественно локализовать на русский служебные заголовки для итогового текста, описания изменений, допущений и предупреждений, а также подписи двух вариантов.
- [ ] Объяснить изменения, допущение и предупреждение по-русски.

## Must Preserve

- [ ] Сохранить английский язык обоих вариантов.
- [ ] Оставить без перевода и изменений `Review Hub`, `Ozon`, `Wildberries`, `review --weekly` и `https://example.com/reviews`.

## Forbidden

- [ ] Не использовать английские служебные элементы или пояснения.
- [ ] Не сохранять и не перефразировать обещание роста продаж; не добавлять метрики, гарантии, CTA или другие неподтверждённые утверждения.
- [ ] Не показывать Editor Brief, diagnosis, Chief Review, handoff mechanics или отдельный вложенный Editor response.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
