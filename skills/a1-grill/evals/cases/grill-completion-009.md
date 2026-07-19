# grill-completion-009 — Confirmed Russian Completion

- ID: `grill-completion-009`
- Operation: `Confirmed Output`
- Risk: The skill ends without confirmation, leaks process scaffolding, or executes the plan.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill`. Continue a Russian session whose tree has passed the completion audit and whose state is supplied below.

## User Instruction

```text
Да, подтверждаю: мы достигли общего понимания и можем завершать прожарку.
```

## Input

```text
Decision: Run a two-week Telegram pilot for marketplace operations leads.
Rationale: The audience already gathers in two identified channels; the pilot tests qualified registration demand within the approved budget.
Assumption: Channel administrators will approve placement at the quoted price.
Deferred: Scaling beyond the first two channels.
Next action under consideration: Request written placement terms from both administrators.
```

## Must Change

- [ ] Return naturally localized Russian level-two sections for the decision, rationale, assumptions, deferred branches, and next step, in that order.
- [ ] Summarize the agreed result concisely and recommend exactly one next action without performing it.

## Must Preserve

- [ ] Preserve the two-week duration, Telegram channel, audience, assumption, and deferred scaling branch.
- [ ] Treat the user's statement as explicit completion confirmation.

## Forbidden

- [ ] Do not ask another decision question.
- [ ] Do not expose the internal tree, replay the interview, or call the result partial.
- [ ] Do not contact administrators, draft outreach, invoke another skill, or otherwise execute the next step.
