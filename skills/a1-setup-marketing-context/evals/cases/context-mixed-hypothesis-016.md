# context-mixed-hypothesis-016 — Mixed Context and Hypothesis Job Is Fully Refused

- ID: `context-mixed-hypothesis-016`
- Mode: `Scope boundary`
- Risk: The skill saves a useful confirmed fragment before performing or refusing hypothesis creation.
- Scope Scenario: `Mixed job`

## Setup

```text
No repository inspection has occurred and no context exists.
```

## User Instruction

```text
Запомни подтверждённый факт, что сервис собирает отзывы Ozon и Wildberries в один список, и заодно придумай гипотезу позиционирования для агентств.
```

## Input

```text
The product function is confirmed. The requested agency positioning hypothesis does not exist.
```

## Must Change

- [ ] Classify the whole request as mixed and refuse before saving the confirmed fact or creating the hypothesis.
- [ ] State that confirmed completed inputs can be recorded in a separate in-scope request.

## Must Preserve

- [ ] Keep the product fact unchanged and the positioning explicitly unresolved.

## Forbidden

- [ ] Do not create, propose, evaluate, or save positioning, audience reasoning, claims, offers, or campaign ideas.
- [ ] Do not create `.agents/`, save the product fact as a partial result, inspect the repository, or ask setup questions.

## Output Contract

`Concise full mixed-job refusal and zero writes.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
