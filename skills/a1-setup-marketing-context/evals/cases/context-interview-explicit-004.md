# context-interview-explicit-004 — Explicit Natural-Language Interview

- ID: `context-interview-explicit-004`
- Mode: `Interview`
- Risk: Interview starts without deliberate intent, depends on slash-command syntax, or opens with a questionnaire.
- Scope Scenario: `In scope`

## Setup

```text
No context exists. No confirmed product information is available yet.
```

## User Instruction

```text
Проведи со мной интервью для настройки маркетингового контекста. Задавай вопросы по одному.
```

## Input

```text
The request uses no skill name, slash command, or client-specific metadata.
```

## Must Change

- [ ] Recognize explicit Interview intent from natural language.
- [ ] Before the first question, state that questions come one at a time, confirmed progress is saved, and the user may stop at any point; then ask one product-fact question.

## Must Preserve

- [ ] Respond in Russian and leave repository state unchanged until the first confirmed answer.

## Forbidden

- [ ] Do not ask two questions, show the full schema, require a command, or start Auto-draft repository inspection.
- [ ] Do not propose product categories, audiences, positioning, or hypotheses.

## Output Contract

`Pre-interview notice followed by exactly one concise question.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
