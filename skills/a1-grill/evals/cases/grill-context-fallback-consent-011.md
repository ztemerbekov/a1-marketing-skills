# grill-context-fallback-consent-011 — Claude-Local Fallback Requires Consent

- ID: `grill-context-fallback-consent-011`
- Operation: `Resolve Sources and Facts`
- Risk: Grill ignores a repository-local fallback, or reads its content before the user consents.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill` in a repository where `.agents/marketing-context.md` is absent and `.claude/marketing-context.md` contains the context below. Do not expose the context content in the conversation.

### Marketing Context

```markdown
# Marketing Context

## Product Facts
- Review Hub collects Ozon and Wildberries reviews in one list.

## Audience Defaults
- Marketplace support leads.
```

## User Instruction

Submit these turns in order:

```text
Turn 1: Запусти a1-grill. Хочу прожарить идею еженедельного обзора отзывов.
Turn 2, after the permission question: Да, используй контекст.
```

## Input

The root `marketing-context.md` is also absent. No other project material or conversation facts apply.

## Must Change

- [ ] On turn 1, detect that an eligible repository context exists without revealing its content, recommend using it, explain the clean-slate alternative, and ask exactly one permission question.
- [ ] After turn 2, read the Claude-local context and use its confirmed product and audience facts in one recommended decision question.

## Must Preserve

- [ ] Preserve the context wording as sourced facts rather than user decisions.
- [ ] Keep the weekly-review idea as the focal object.

## Forbidden

- [ ] Do not reveal or rely on the context facts before turn 2.
- [ ] Do not ask the user to restate the confirmed product or audience after consent.
- [ ] Do not create, update, or migrate any context file.
