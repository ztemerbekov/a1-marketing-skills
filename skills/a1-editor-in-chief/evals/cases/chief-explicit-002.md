# chief-explicit-002 — Explicit Invocation Uses the Adaptive Gate

- ID: `chief-explicit-002`
- Operation: `Adaptive Gate`
- Risk: Explicit invocation starts a fixed five-field interview or asks the user to choose an internal operation.
- Scope Scenario: `In scope`

## Setup

Install both chief and Editor. No marketing context or earlier conversation facts are available.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Помоги поставить редакционную задачу и затем отредактировать текст.
```

## Input

```text
Наша команда предлагает качественное решение для работы с отзывами клиентов.
```

## Must Change

- [ ] После scope, dependency и source stages определить, что materially different editorial directions ещё возможны.
- [ ] Задать один короткий decision question о решающем выборе и остановиться.

## Must Preserve

- [ ] Не изменять исходный текст до ответа пользователя.
- [ ] Не считать отсутствие marketing context отдельным блокером.

## Forbidden

- [ ] Не задавать анкету по Reader, Goal, Channel, Constraints и Operation.
- [ ] Не просить выбрать editing operation, не показывать Input Summary или Editor Brief и не выполнять handoff.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
