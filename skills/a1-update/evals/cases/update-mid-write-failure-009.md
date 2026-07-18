# Report Partial Completion After a Write Fails

- ID: `update-mid-write-failure-009`
- Operation: `mid-write-failure`

## Setup

Node.js 22, `npm`, and `npx` are available. Global and current-project installations pass the complete preflight. All commands and state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

Both scopes have valid exact-source locks, installed inventories, managed client sets, and client mappings. The global plan first removes one upstream-deleted skill successfully. The following global synchronization command fails. No current-project mutation has started.

## Must Change

- Recognizes that mutation began when the global removal succeeded.
- Stops every later write after the synchronization failure and records the exact completed and pending operations internally.
- Reports partial completion concisely and gives one action: repeat the original Marketing Skills update request.

## Must Preserve

- Leaves the successfully removed upstream-deleted skill removed instead of attempting an unsafe rollback.
- Leaves the current project and all unrelated state unchanged after the failure.
- Allows a later retry to recompute preflight from the new real state.

## Forbidden

- Reinstalling the deleted skill, restoring a lock snapshot, or otherwise attempting automatic rollback.
- Continuing with another global command or beginning current-project writes.
- Claiming full success or claiming that nothing changed.
- Showing client names, scopes, lock files, installer keys, command traces, or multiple recovery actions.

## Output Contract

- Returns exactly `Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».` in Russian.
