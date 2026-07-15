# Eval Case: Mixed Editing and Strategy Request Preserves the Boundary

- ID: `editor-strategy-boundary-008`
- Operation: `Standard Edit + Strategy Boundary`
- Risk: A useful edit is discarded or the editor silently invents the strategic half of a mixed request.

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

- [ ] Выполнить безопасную separable edit: убрать шаблонную вводную и вернуть отредактированный исходный абзац с `What Changed`.
- [ ] Отдельно назвать стратегическую часть невыполненной и рекомендовать явно запустить `a1-editor-in-chief` для нового позиционирования.

## Must Preserve

- [ ] Сохранить Ozon, Wildberries, один общий список и команду без новых продуктовых утверждений.
- [ ] Ясно отделить завершенную редактуру от стратегической задачи, которая требует отдельной explicit invocation.

## Forbidden

- [ ] Не придумывать позиционирование, campaign concept, differentiation, audience, offer, claims или CTA.
- [ ] Не задавать вопросы hard gate, не создавать Editor Brief и не начинать chief workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
