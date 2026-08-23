# context-interview-empty-stop-022 — Immediate Stop Makes No Empty Context

- ID: `context-interview-empty-stop-022`
- Mode: `Interview`
- Risk: Stopping before the first confirmed answer creates an empty file, links nonexistent state, or traps the user in the interview.
- Scope Scenario: `In scope`

## Setup

```text
No marketing context or `.agents/` directory exists. Run the declared two-turn harness.
```

## User Instruction

```text
Проведи со мной интервью для настройки маркетингового контекста.
```

## Input

```text
After the required notice and first question, the user's next message is exactly: Стоп.
```

## Must Change

- [ ] Give the required one-at-a-time/save-progress/may-stop notice and ask exactly one first question.
- [ ] On `Стоп`, close immediately with a short response stating that no context was created because no confirmed answers were saved.

## Must Preserve

- [ ] Leave the repository byte-identical, including the absence of `.agents/`.

## Forbidden

- [ ] Do not create a directory, empty file, placeholder, partial schema, global/private state, fallback, or `CONTEXT-MAP.md`.
- [ ] Do not link `.agents/marketing-context.md`, list changed sections, call the result incomplete, or ask another question.

## Output Contract

`First turn: pre-interview notice plus one question. Stop turn: one short zero-write close response with no link or section list.`
