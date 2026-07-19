# grill-context-consent-005 — Marketing Context Consent

- ID: `grill-context-consent-005`
- Operation: `Resolve Sources and Facts`
- Risk: The skill reads repository marketing context before permission or repeats facts after permission.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill` in a repository containing the marketing context below. Do not expose its contents in conversation.

### Marketing Context

```markdown
# Marketing Context

## Product Facts

- Сервис собирает отзывы Ozon и Wildberries в один список.

## Audience Defaults

- Руководители операционных команд маркетплейсов.
```

## User Instruction

Submit these turns in order:

```text
Turn 1: Запусти a1-grill. Хочу прожарить идею вебинара о работе с отзывами.
Turn 2, after the permission question: Да, используй контекст.
```

## Input

The context file exists at `.agents/marketing-context.md`; no other project material applies.

## Must Change

- [ ] On turn 1, check only for context existence, recommend using it, explain the clean-slate alternative, and ask exactly one permission question.
- [ ] After turn 2, read the context and use its confirmed product and audience facts when forming one recommended decision question.

## Must Preserve

- [ ] Preserve the context wording as sourced facts rather than user decisions.
- [ ] Keep the webinar idea as the focal object.

## Forbidden

- [ ] Do not reveal or rely on the audience or product facts before turn 2.
- [ ] Do not ask the user to restate the confirmed audience or product function after consent.
- [ ] Do not update the context file.
