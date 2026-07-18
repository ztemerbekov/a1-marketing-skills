# Recover From an Unknown Client Mapping

- ID: `update-unknown-client-recovery-007`
- Operation: `unknown-client-recovery`

## Setup

The runtime satisfies the current `skills` requirement, and `npm` and `npx` are available. The running A1 Update is installed globally in Cursor. The current upstream copy of A1 Update recognizes the newer installer client. Command execution and global state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

The upstream inventory and exact-source global lock are valid. Global list output reports source-owned Marketing Skills in Cursor and in a hypothetical newer installer client labelled `Future Client`, which the running A1 Update cannot map safely. Refreshing A1 Update in its own global scope installs the current upstream fixture copy; after the refreshed instructions are reloaded, the client can be mapped.

## Must Change

- Stops the ordinary collection plan before every collection installation change because one connected client cannot be mapped.
- Automatically refreshes only `a1-update` in the running updater's global scope without asking the user to run a command.
- Reloads the refreshed A1 Update instructions and restarts the original update from a complete read-only preflight.
- Synchronizes the complete collection into every client in the recovered managed set.

## Must Preserve

- Keeps all connected clients in the intended managed set instead of dropping the unknown one.
- Does not connect a client outside the pre-update managed set or change an unrelated source.

## Forbidden

- Asking the user to choose or interpret an `--agent` key.
- Showing the automatic bootstrap command or asking the user to copy, paste, or retry it.
- Silently omitting the unknown client or updating only known clients.
- Naming clients, showing client tables, explaining lock files, or exposing an installer client key.
- Continuing from the stale preflight instead of restarting it after the updater refresh.
- Attempting the automatic updater refresh more than once in one request.

## Output Contract

- After the resumed update succeeds, returns only `Marketing Skills обновлены.`
