# message-raw-forward-003 — Forwarded Thread Summarized

- ID: `message-raw-forward-003`
- Operation: `Workplace message from correspondence`
- Risk: Compressing a forward may paste the thread, lose source-specific operational details, or turn a proposal into a decision.
- Scope Scenario: `In scope`

## User Instruction

```text
Из этой пересылки сделай сообщение директору по продукту: текущий статус, что осталось решить и какой следующий шаг уже предложен. Не вставляй саму переписку.
```

## Input

```text
Пн 10:10, Марина: «Предлагаю выпустить форму регистрации 2 сентября без отдельного согласия на рассылку».
Пн 14:30, Илья: «Аналитика настроена, события signup_started и signup_completed уже поступают».
Вт 09:20, Олег: «Юристы не согласовали вариант без отдельного согласия. До исправления форму выпускать нельзя».
Вт 12:45, Марина: «Тогда перенесём выпуск на 7 сентября и добавим отдельный чекбокс. Разработке нужно подтверждение этой даты».
Вт 16:00, Илья: «С аналитикой для варианта с чекбоксом всё готово».
```

## Must Change

- [ ] Summarize the current block, the proposed 7 September release, the ready analytics, the required date confirmation, and the proposed checkbox change without reproducing the thread.

## Must Preserve

- [ ] Preserve that legal has not approved the no-consent version.
- [ ] Preserve that 2 September is superseded.
- [ ] Preserve that 7 September remains proposed.
- [ ] Preserve that development needs confirmation.
- [ ] Preserve that both analytics events, `signup_started` and `signup_completed`, are ready.

## Forbidden

- [ ] Do not paste quotations or the correspondence thread.
- [ ] Do not present 2 September as current.
- [ ] Do not present legal approval as granted.
- [ ] Do not present 7 September as decided.
