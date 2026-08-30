# message-no-solution-004 — Problem Without a Supplied Solution

- ID: `message-no-solution-004`
- Operation: `Workplace problem message`
- Risk: A request to propose a solution may prompt an invented technical fix, estimate, owner, or recommendation when the source supplies none.
- Scope Scenario: `In scope`

## User Instruction

```text
Напиши руководителю сообщение о проблеме и сразу предложи решение.
```

## Input

```text
- Ночная выгрузка заказов завершилась с ошибкой.
- В отчёт не попали 17 заказов за 28 августа.
- Причина ошибки пока не установлена.
- Варианты исправления, оценка времени и ответственный ещё не определены.
```

## Must Change

- [ ] State the failed export and affected 17 orders first.
- [ ] Make the absence of a supported solution, timing estimate, and owner explicit.
- [ ] Request only the decision or diagnostic input supported by the facts.

## Must Preserve

- [ ] Preserve 28 August and 17 orders.
- [ ] Preserve that the cause is unknown.
- [ ] Preserve the absence of options, an estimate, and an owner.

## Forbidden

- [ ] Do not fabricate a technical fix, recovery time, owner, root cause, or recommendation presented as source-supported.
