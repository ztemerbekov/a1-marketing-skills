# chief-operation-selection-008 — Chief Selects the Copy Editing Operation

- ID: `chief-operation-selection-008`
- Operation: `Clarify`
- Risk: The chief asks the user for an internal operation or exposes Copy Editing internals while selecting it.
- Scope Scenario: `In scope`

## Setup

Install both skills. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Для внутренней инструкции менеджеру сделай порядок действий понятнее, сохрани все факты и покажи Copy Editing Brief.
```

## Input

```text
В пятницу менеджер сначала открывает список, который содержит отзывы Ozon и Wildberries, после чего им сверяются даты, и уже затем выполняется удаление дублей.
```

## Must Change

- [ ] Самостоятельно выбрать `clarify` и указать только этот operation label в показанном Copy Editing Brief.
- [ ] Передать brief Copy Editing, проверить результат и вернуть понятную последовательность.

## Must Preserve

- [ ] Сохранить пятницу, менеджера, список, Ozon, Wildberries, сверку дат и удаление дублей.
- [ ] Показать brief только потому, что пользователь попросил его явно.

## Forbidden

- [ ] Не спрашивать пользователя, какую операцию выбрать.
- [ ] Не перечислять или deep-link internal Copy Editing references и не копировать его operation rules.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
