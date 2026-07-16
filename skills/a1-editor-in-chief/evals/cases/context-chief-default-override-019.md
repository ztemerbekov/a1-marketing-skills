# context-chief-default-override-019 — Chief May Override Context Defaults

- ID: `context-chief-default-override-019`
- Mode: `Consumer integration`
- Risk: Chief treats repository defaults as hard gate facts and asks the user to update context before a bounded assignment.
- Scope Scenario: `In scope`

## Setup

```text
Install A1 Editor in Chief and A1 Editor. Provide the canonical marketing context below.
```

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Для этой задачи читатель — владелец агентства, тон — прямой. Подготовь короткий onboarding email; цель — объяснить единый список отзывов. Не добавляй фактов.
```

## Input

```markdown
.agents/marketing-context.md:

## Product Facts
- Review Hub collects Ozon and Wildberries reviews in one list.

## Audience Defaults
- Marketplace managers.

## Brand Voice Defaults
- Calm and explanatory.

Editable text:
Review Hub собирает отзывы Ozon и Wildberries в одном списке.
```

## Must Change

- [ ] Build the assignment and final email for an agency owner in a direct voice, using the explicit task values over defaults.
- [ ] Complete the bounded Chief-to-Editor workflow without a decision question.

## Must Preserve

- [ ] Preserve Ozon, Wildberries, and the one-list product fact.
- [ ] Leave the marketing context unchanged.

## Forbidden

- [ ] Do not use marketplace managers or the calm explanatory default for this task.
- [ ] Do not ask to update context, treat default divergence as a protected conflict, or add claims.

## Output Contract

`Normal reviewed Chief result with concise What Changed and no context-maintenance output.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
