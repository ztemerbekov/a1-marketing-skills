# Recover From an Unknown Client Mapping

- ID: `update-unknown-client-recovery-007`
- Operation: `unknown-client-recovery`

## Setup

Node.js 22, `npm`, and `npx` are available. The running A1 Update is installed globally in Cursor. Command execution and global state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

The upstream inventory and exact-source global lock are valid. Global list output reports source-owned Marketing Skills in Cursor and in a newer installer client labelled `Warp`, which the installed A1 Update cannot map safely.

## Must Change

- Stops during preflight before every installation change because one connected client cannot be mapped.
- States in plain Russian that the update could not be prepared and nothing changed.
- Generates exactly one copy-ready command that refreshes only `a1-update` in the running updater's global scope before the user retries the original request.

## Must Preserve

- Leaves every installed skill, lock entry, client connection, and unrelated file unchanged.
- Keeps all connected clients in the intended managed set instead of dropping the unknown one.

## Forbidden

- Asking the user to choose or interpret an `--agent` key.
- Silently omitting the unknown client or updating only known clients.
- Naming clients, showing client tables, explaining lock files, or exposing an installer client key.
- Providing multiple commands, alternatives, or diagnostic steps.

## Output Contract

- Returns one short human message followed by exactly `npx skills@latest add ztemerbekov/marketing-skills --skill a1-update --global --yes` as the only copy-ready command.
