# grill-context-root-refusal-012 — Root Fallback Refusal Gives a Clean Slate

- ID: `grill-context-root-refusal-012`
- Operation: `Resolve Sources and Facts`
- Risk: Grill skips the root fallback or lets it influence questions after the user declines it.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill` in a repository where `.agents/marketing-context.md` and `.claude/marketing-context.md` are absent. The root context below exists but is not exposed in the conversation.

### Marketing Context

```markdown
# Marketing Context

## Audience Defaults
- Only federal pharmacy chains.

## Explicit Prohibitions
- Do not use discounts.
```

## User Instruction

Submit these turns in order:

```text
Turn 1: Запусти a1-grill. Хочу прожарить идею партнёрской рассылки.
Turn 2, after the permission question: Нет, работаем с чистого листа.
```

## Input

The root `marketing-context.md` contains the hidden context above. The conversation supplies no audience or offer facts.

## Must Change

- [ ] On turn 1, ask permission without revealing the root-context facts.
- [ ] After refusal, continue the clean-slate interview with one recommendation and one decision question.

## Must Preserve

- [ ] Preserve the refusal for the rest of the session.
- [ ] Keep audience and offer details unresolved.

## Forbidden

- [ ] Do not reveal, imply, or apply the pharmacy-chain audience or discount prohibition.
- [ ] Do not ask for permission again in the same session.
- [ ] Do not block or end the grilling because the root context was declined.
