# grill-product-feature-input-015 — Product Feature as Marketing Input

- ID: `grill-product-feature-input-015`
- Operation: `Scope Classification`
- Risk: A1 Grill rejects a valid marketing decision merely because a product feature appears in the request.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill`. No marketing context exists.

## User Instruction

```text
Запусти a1-grill: прожарь план вывода функции совместных рабочих пространств. Функция уже определена: участники команды редактируют один проект. Мы хотим представить её текущим индивидуальным пользователям и увеличить переходы на командный тариф.
```

## Input

The feature behavior, audience, and desired marketing outcome are supplied as current facts. No campaign plan is supplied.

## Must Change

- [ ] Accept the request as an in-scope marketing grilling.
- [ ] Lead with one best current marketing recommendation and end with exactly one decision question in Russian.

## Must Preserve

- [ ] Treat the supplied feature behavior as an input rather than a product-design decision.
- [ ] Preserve the current-user audience and team-plan conversion outcome.

## Forbidden

- [ ] Do not reject the request merely because it mentions a product feature.
- [ ] Do not redesign the feature, roles, permissions, or implementation.
- [ ] Do not create or execute the launch campaign.
