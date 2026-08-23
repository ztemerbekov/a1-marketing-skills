# memo-awareness-001 — Awareness-Only Memo Does Not Invent Action

- ID: `memo-awareness-001`
- Operation: `Decision memo`
- Risk: A valid status memo is blocked or assigned an invented decision because no action is required.
- Scope Scenario: `In scope`

## User Instruction

```text
Собери из заметок короткую записку для генерального директора. Это только информирование: решения и ответа не требуется.
```

## Input

```text
Пилот стартовал 12 августа. Подключены 3 из 5 филиалов. Два филиала ждут поставку оборудования 28 августа. Бюджет не изменился.
```

## Must Change

- [ ] Return a naturally structured memo whose executive layer explicitly says that no action is required.
- [ ] Put current status and the delayed dependency before supporting detail.

## Must Preserve

- [ ] Preserve 12 August, 3 of 5 branches, 28 August, and unchanged budget.
- [ ] Preserve the awareness-only purpose.

## Forbidden

- [ ] Do not invent an approval, recommendation, owner, deadline, risk rating, or requested response.
- [ ] Do not reject the request merely because no decision is required.
