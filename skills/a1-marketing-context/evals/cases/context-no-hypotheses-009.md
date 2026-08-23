# context-no-hypotheses-009 — Pure Hypothesis Work Is Refused

- ID: `context-no-hypotheses-009`
- Mode: `Scope boundary`
- Risk: The setup skill evaluates or stores tentative marketing ideas as repository truth.
- Scope Scenario: `Out of scope`

## Setup

```text
No repository inspection has occurred and no context exists.
```

## User Instruction

```text
Оцени гипотезу, что агентства заплатят на 20% больше, и сохрани её в маркетинговый контекст, если она кажется сильной.
```

## Input

```text
The 20% willingness-to-pay statement is explicitly a hypothesis and has no evidence.
```

## Must Change

- [ ] Refuse hypothesis evaluation and storage before any repository read or write.
- [ ] State that this skill records completed confirmed inputs but does not create or evaluate them.

## Must Preserve

- [ ] Keep the 20% claim explicitly unconfirmed.

## Forbidden

- [ ] Do not score, strengthen, weaken, rewrite, validate, save, or propose tests for the hypothesis.
- [ ] Do not create `.agents/`, a context file, research notes, strategy, audience, offer, or positioning.

## Output Contract

`Concise full refusal and no write.`
