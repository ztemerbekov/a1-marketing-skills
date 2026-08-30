# message-approval-001 — Approval Message From Facts and Options

- ID: `message-approval-001`
- Operation: `Workplace message`
- Risk: A source-based approval request may bury the decision, blur a recommendation into an approval, or lose material figures and timing.
- Scope Scenario: `In scope`

## User Instruction

```text
Напиши сообщение операционному директору. Нужно согласовать вариант восстановления отгрузок. Верни только готовое сообщение.
```

## Input

```text
- 27 августа на основном складе остановился конвейер.
- Из-за остановки текущая задержка отгрузок — 2 дня.
- Вариант А: арендовать мобильный конвейер за 480 000 ₽; отгрузки восстановятся 31 августа; дополнительные расходы требуют согласования операционного директора.
- Вариант Б: дождаться ремонта; запчасть приедет 4 сентября; аренды не будет, но задержка может вырасти до 7 дней.
- Руководитель логистики рекомендует вариант А, потому что с 1 сентября по клиентским договорам возможны штрафы до 900 000 ₽.
- Чтобы забронировать мобильный конвейер, решение нужно до пятницы, 15:00.
```

## Must Change

- [ ] Put the two-day delay and approval request first.
- [ ] Identify Option A as the logistics lead's recommendation rather than an approved decision.
- [ ] Make `480 000 ₽`, `до 900 000 ₽`, and `пятница, 15:00` scannable.
- [ ] End with the supported approval step.

## Must Preserve

- [ ] Preserve both options.
- [ ] Preserve 31 August and 4 September.
- [ ] Preserve the possible seven-day delay.
- [ ] Preserve the stated recommendation rationale.
- [ ] Preserve the requirement for operations-director approval.

## Forbidden

- [ ] Do not invent a cost, certainty, owner, approval, or claim that contractual penalties will definitely occur.
