# chief-context-incomplete-007 — Incomplete Gate Asks One Decision Question

- ID: `chief-context-incomplete-007`
- Operation: `Adaptive Gate`
- Risk: The chief guesses the text goal or sends a multi-field interview when one editorial fork matters.
- Scope Scenario: `In scope`

## Setup

Install both skills. No context or applicable conversation facts exist.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Это email новым клиентам. Поставь редакционную задачу и перепиши.
```

## Input

```text
Сервис собирает отзывы из Ozon и Wildberries в один список.
```

## Must Change

- [ ] Определить, что email может объяснять функцию или вести к следующему действию, а этот выбор materially changes editorial direction.
- [ ] Задать один decision question о цели email и остановиться.

## Must Preserve

- [ ] Считать новых клиентов reader, email channel и исходную функцию уже известными.
- [ ] Оставить исходный текст без изменений до ответа.

## Forbidden

- [ ] Не спрашивать reader, channel, constraints или editing operation повторно.
- [ ] Не создавать CTA, цель, brief, edit или partial output.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
