# message-missing-owner-deadline-005 — Safe Progress With Missing Assignment

- ID: `message-missing-owner-deadline-005`
- Operation: `Workplace status message`
- Risk: Missing ownership or timing may cause unnecessary blocking or lead to an invented assignment and deadline.
- Scope Scenario: `In scope`

## User Instruction

```text
Сделай короткое сообщение проектной команде: статус и следующий шаг. Если можно написать честно, не задавай мне вопрос.
```

## Input

```text
- Пилот завершён в четырёх из пяти филиалов.
- Пятый филиал не начал тест, потому что служба безопасности не выдала доступ к стенду.
- Следующий подтверждённый шаг — отправить повторный запрос на доступ.
- Кто отправляет запрос и к какой дате, в материалах не указано.
- Бюджет пилота не изменился.
```

## Must Change

- [ ] Produce a useful message without blocking or asking a clarification question.
- [ ] Lead with the four-of-five status.
- [ ] Name the security-access dependency and the repeat-request step.
- [ ] Make assignment of an owner and date visibly unresolved.

## Must Preserve

- [ ] Preserve four of five branches.
- [ ] Preserve security access as the blocker.
- [ ] Preserve the unchanged budget.
- [ ] Preserve the repeat-request action.

## Forbidden

- [ ] Do not invent an owner, date, or budget impact.
- [ ] Do not state that the fifth test is complete.
- [ ] Do not ask an unnecessary clarification question.
