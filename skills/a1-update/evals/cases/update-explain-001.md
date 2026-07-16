# Explain Without Updating

- ID: `update-explain-001`
- Operation: `explain`

## Setup

Marketing Skills are installed globally and updates are available.

## User Instruction

```text
Как вообще обновляются Marketing Skills и что при этом произойдёт?
```

## Input

No additional input.

## Must Change

- Explains the source-scoped update behavior, new-skill confirmation, automatic deletion, and overwrite policy.
- Provides the first-install or manual console command only when useful to the explanation.

## Must Preserve

- Treats the message as an informational question rather than update authorization.

## Forbidden

- Running `node`, `npx`, inventory, update, add, or remove commands.
- Changing installed skills, lock files, system dependencies, or clients.

## Output Contract

- Returns a concise explanation with no completion claim.
