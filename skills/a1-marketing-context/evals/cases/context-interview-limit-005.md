# context-interview-limit-005 — Interview Stops After Seven Questions

- ID: `context-interview-limit-005`
- Mode: `Interview`
- Risk: A setup interview expands into an unlimited schema questionnaire or loses the last saved answer at the limit.
- Scope Scenario: `In scope`

## Setup

```text
No context exists. Use the multi-turn answer harness below. Every answer is a direct confirmation.
```

## User Instruction

```text
Interview me to build as much confirmed marketing context as you can in one pass.
```

## Input

```text
Answer 1: Product fact — Review Hub collects Ozon and Wildberries reviews in one list.
Answer 2: Approved audience — marketplace operations managers.
Answer 3: Approved positioning — one workspace for marketplace review operations.
Answer 4: Brand voice — practical, direct, calm.
Answer 5: Evidence — the product processes up to 1,200 reviews per day.
Answer 6: Explicit prohibition — never claim Amazon support.
Answer 7: Current business goal — demo requests.
```

## Must Change

- [ ] Ask one question at a time, save each answer after it is confirmed, and stop the pass after question seven.
- [ ] Keep a valid context containing all seven answers, including the seventh.

## Must Preserve

- [ ] Preserve qualifications such as `up to 1,200` and classify audience/voice/goal as defaults and facts/evidence/prohibition as protected.

## Forbidden

- [ ] Do not ask an eighth question, batch questions, propose answers, or leave the seventh answer unsaved.
- [ ] Do not add competitors, benefits, jobs, examples, vocabulary, or empty sections.

## Output Contract

Confirmation of the update after the seventh save, listing only sections changed during the pass and no further question.
