# grill-context-refusal-006 — Marketing Context Refusal

- ID: `grill-context-refusal-006`
- Operation: `Resolve Sources and Facts`
- Risk: Declining context blocks the interview or hidden context still influences the questions.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill` in a repository containing the hidden marketing context below.

### Marketing Context

```markdown
# Marketing Context

## Audience Defaults

- Только федеральные аптечные сети.

## Explicit Prohibitions

- Не использовать скидки.
```

## User Instruction

Submit these turns in order:

```text
Turn 1: Запусти a1-grill. Хочу прожарить идею партнёрской рассылки.
Turn 2, after the permission question: Нет, работаем с чистого листа.
```

## Input

The context file exists at `.agents/marketing-context.md`; the conversation supplies no audience or offer facts.

## Must Change

- [ ] Ask permission on turn 1 without reading the file.
- [ ] After refusal, continue the clean-slate interview with one recommendation and one decision question.

## Must Preserve

- [ ] Preserve the user's refusal for the rest of the session.
- [ ] Keep unknown audience and offer details unresolved.

## Forbidden

- [ ] Do not reveal, imply, or apply the pharmacy-chain audience or discount prohibition.
- [ ] Do not ask for permission again in the same session.
- [ ] Do not block or end the grilling because context was declined.
