# context-conflict-011 — Material Conflict Stops the Write

- ID: `context-conflict-011`
- Mode: `Auto-draft`
- Risk: Auto-draft silently chooses, merges, or preserves two incompatible protected product facts.
- Scope Scenario: `In scope`

## Setup

```text
An existing context and authoritative README disagree. The user does not select a source or explicitly update price.
```

## User Instruction

```text
Обнови маркетинговый контекст по материалам репозитория.
```

## Input

```markdown
.agents/marketing-context.md:
Last updated: 2026-07-10
## Product Facts
- Тариф Start стоит 4 900 ₽ в месяц.

README.md:
Start costs 5,900 RUB per month.
```

## Must Change

- [ ] Stop before writing and ask one concrete question naming `4 900 ₽` from context and `5 900 ₽` from README.

## Must Preserve

- [ ] Preserve the original file byte-for-byte, including its old date and price, until the user resolves the conflict.

## Forbidden

- [ ] Do not choose by recency, merge both prices, average them, change `Last updated`, create a warning-only update, or ask more than one question.
- [ ] Do not change any unrelated section or create a second context file.

## Output Contract

`One concrete conflict question and zero writes.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
