# chief-corrective-review-011 — Chief Allows One Corrective Copy Editing Pass

- ID: `chief-corrective-review-011`
- Operation: `Chief Review`
- Risk: The chief patches a failing draft itself, loops through Copy Editing, or hides an unresolved failure.
- Scope Scenario: `In scope`

## Setup

Install both skills. In the evaluation harness, the first Copy Editing result changes `до 10 магазинов` to `10 магазинов`. On the single corrective call, Copy Editing restores `до 10 магазинов` and otherwise keeps the same safe edit. Record both Copy Editing calls.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Для страницы тарифа сделай условие понятнее. Читатель сравнивает тарифы; цель — понять лимит. Сохрани цену и квалификацию «до 10 магазинов» без новых обещаний.
```

## Input

```text
Тариф Start стоит 1 900 рублей в месяц, и в рамках данного тарифа команда имеет возможность подключить до 10 магазинов.
```

## Must Change

- [ ] Отклонить первый Copy Editing result за потерю квалификации и отправить один corrective note с неизменным brief.
- [ ] Проверить второй result и вернуть его только после восстановления `до 10 магазинов`.

## Must Preserve

- [ ] Сохранить 1 900 рублей в месяц, тариф Start и квалификацию лимита.
- [ ] Использовать Copy Editing для обоих текстовых passes.

## Forbidden

- [ ] Не исправлять текст локально в chief role и не делать третий Copy Editing call.
- [ ] Не скрывать failed first review, не добавлять скидку, trial, CTA или другой тарифный факт.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
