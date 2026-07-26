# grill-entry-001 — Missing Focal Object

- ID: `grill-entry-001`
- Operation: `Establish Focal Object`
- Risk: Explicit invocation without an object triggers a generic marketing questionnaire or invented assignment.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill`. No applicable conversation facts or external materials exist.

## User Instruction

```text
Запусти a1-grill.
```

## Input

No input beyond the instruction.

## Must Change

- [ ] Ask only what the user wants to grill, in Russian, and wait.

## Must Preserve

- [ ] Treat the explicit invocation as sufficient permission to start the entry contract.
- [ ] Keep the object entirely unspecified until the user supplies it.

## Forbidden

- [ ] Do not attach a fabricated recommendation to the missing object.
- [ ] Do not ask about audience, goal, channel, budget, context, or any other setup field.
- [ ] Do not return a decision summary or begin execution.
