# message-selected-draft-002 — Selected Workplace Draft Reordered

- ID: `message-selected-draft-002`
- Operation: `Workplace message rewrite`
- Risk: Rewriting a selected draft may preserve its chronology instead of making the recipient's current action clear, or may alter facts and tone.
- Scope Scenario: `In scope`

## User Instruction

```text
Перепиши это сообщение нашему действующему клиенту. Тон спокойный, без оправданий. Сохрани все факты и верни только готовое сообщение.
```

## Input

```text
Алексей, добрый день. 21 августа мы получили вашу партию из 120 блоков. Потом отдел качества провёл проверку и 23 августа выяснил, что 18 блоков не проходят тест герметичности. Мы ещё всё обсуждали с производством. Сейчас можем отгрузить 102 блока 29 августа. По 18 блокам производство подтвердит новую дату 30 августа. Напишите, пожалуйста, подходит ли вам частичная отгрузка.
```

## Must Change

- [ ] Lead with the available partial shipment and the reply required from Alexey.
- [ ] Place the inspection chronology below the current state.
- [ ] Keep the message calm and compact, without apologies or excuses.

## Must Preserve

- [ ] Preserve Alexey, 21 August, 120 blocks, 23 August, 18 failed blocks, 102 blocks, 29 August, and 30 August.
- [ ] Preserve the seal test.
- [ ] Preserve that the replacement date is not yet confirmed.

## Forbidden

- [ ] Do not add editorial commentary or apologies not present in the draft.
- [ ] Do not turn the replacement date into a guarantee.
- [ ] Do not add a new reply deadline.
