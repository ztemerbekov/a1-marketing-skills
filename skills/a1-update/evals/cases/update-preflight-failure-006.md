# Stop All Scopes When Preflight Is Incomplete

- ID: `update-preflight-failure-006`
- Operation: `preflight-failure`

## Setup

Node.js 22.20.0 or newer, `npm`, and `npx` are available. Global and current-project installations are active. Command execution and both scopes are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

The upstream inventory succeeds and contains all four current Marketing Skills. The global source-owned lock and installed inventory are valid and resolve to Codex. The current-project lock is valid, but its installed inventory command fails before returning any client state.

## Must Change

- Completes the runtime, upstream, active-scope, source-ownership, installed-inventory, managed-set, and client-mapping checks for every active scope before the first installation change.
- Stops the whole run when the current-project preflight cannot be completed, even though the global scope was already validated.
- States plainly that the update could not be prepared and nothing changed, then gives one retry action.

## Must Preserve

- Leaves both scopes' installed skills, lock entries, client connections, and unrelated state byte-for-byte unchanged.
- Preserves the valid global installation instead of updating it early.

## Forbidden

- Running `npx skills add`, `npx skills remove`, or `scripts/prune-lock.mjs` after any incomplete preflight result.
- Partially updating the already validated global scope.
- Treating failed or empty project output as an empty installation.
- Showing client tables, lock-file explanations, or installer keys.

## Output Contract

- Returns one concise, non-technical failure message that says nothing changed and provides exactly one retry action.
