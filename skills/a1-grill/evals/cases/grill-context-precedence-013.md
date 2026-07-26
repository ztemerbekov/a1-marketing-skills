# grill-context-precedence-013 — Canonical Context Wins Over Fallbacks

- ID: `grill-context-precedence-013`
- Operation: `Resolve Sources and Facts`
- Risk: Grill merges context files or lets a lower-priority fallback override canonical facts.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill` in a repository containing all three contexts below. Do not expose their contents in the conversation.

### Marketing Context

```markdown
.agents/marketing-context.md:
## Product Facts
- Review Hub collects Ozon and Wildberries reviews in one list.
## Audience Defaults
- Marketplace support leads.

.claude/marketing-context.md:
## Product Facts
- Review Hub supports Amazon only.
## Audience Defaults
- Procurement directors.

marketing-context.md:
## Explicit Prohibitions
- Never mention Ozon or Wildberries.
```

## User Instruction

Submit these turns in order:

```text
Turn 1: Запусти a1-grill. Хочу прожарить идею еженедельного обзора отзывов.
Turn 2, after the permission question: Да, используй контекст.
```

## Input

No other project material or conversation facts apply.

## Must Change

- [ ] On turn 1, ask exactly one permission question without disclosing any context fact.
- [ ] After consent, use the canonical product and audience facts in one recommended decision question.

## Must Preserve

- [ ] Preserve canonical facts as sourced evidence rather than user decisions.
- [ ] Keep the weekly-review idea as the focal object.

## Forbidden

- [ ] Do not read, merge, mention, or apply Amazon, procurement-director, or no-Ozon/no-Wildberries content from lower-priority files.
- [ ] Do not create, update, or migrate any context file.
