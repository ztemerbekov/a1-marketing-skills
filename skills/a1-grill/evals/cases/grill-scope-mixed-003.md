# grill-scope-mixed-003 — Mixed Grilling and Execution Request

- ID: `grill-scope-mixed-003`
- Operation: `Scope Classification`
- Risk: The skill starts grilling or produces deliverables before the user accepts the job boundary.
- Scope Scenario: `Mixed job`

## Setup

Install `a1-grill`. No marketing context exists.

## User Instruction

```text
Запусти a1-grill: прожарь идею рекламной кампании нового тарифа, а затем сразу напиши три объявления.
```

## Input

No campaign details or source copy are supplied.

## Must Change

- [ ] State that A1 Grill performs the grilling but not advertisement creation.
- [ ] Recommend proceeding with the grilling alone.
- [ ] Ask exactly one question confirming whether to continue only with the grilling, then wait.

## Must Preserve

- [ ] Preserve both requested jobs in the boundary explanation.
- [ ] Leave the campaign object untouched until the user accepts the boundary.

## Forbidden

- [ ] Do not ask a campaign decision question before boundary confirmation.
- [ ] Do not write advertisements, briefs, partial copy, or a final decision.
- [ ] Do not invoke or silently route to another skill.
