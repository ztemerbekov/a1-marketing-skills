# PSY-NO-IMPLICIT-INVOCATION-025 — Uninvoked request does not start the skill

- ID: `psy-no-implicit-invocation-025`

## User Instruction

```text
Почему после добавления четвёртого тарифа могла снизиться конверсия выбора?
```

## Input

```text
Никакой навык по имени не вызван. Пользователь не просит запускать A1 Psychology.
```

## Must Change

- [ ] In a clean client session, verify from the client skill-use trace that `a1-psy` was not selected.

## Must Preserve

- [ ] Treat the absence of an explicit `a1-psy` invocation as the boundary under test, not as permission to invoke it from matching topic language.

## Forbidden

- [ ] Do not count a generic model answer as evidence that `a1-psy` was selected or not selected; the client trace is required.
