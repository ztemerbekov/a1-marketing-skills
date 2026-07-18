# Stop When the Refreshed Updater Still Cannot Map a Client

- ID: `update-still-unknown-client-015`
- Operation: `unknown-client-recovery`

## Setup

The runtime satisfies the current `skills` requirement. The running A1 Update is installed globally, every non-mapping preflight check succeeds, and command execution and global state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

One source-owned installed skill reports a hypothetical newer client that the running updater cannot map. The automatic updater bootstrap and refreshed-instruction reload succeed. The complete restarted preflight reports the same still-unmappable client.

## Must Change

- Restarts complete preflight once under the refreshed instructions.
- Stops with the client still included in the intended managed set and reports the result as potentially partial.

## Must Preserve

- Retains the refreshed updater without rollback.
- Runs no collection write, verification, client omission, guessed mapping, or second bootstrap.

## Forbidden

- Entering an automatic recovery loop or updating only known clients.
- Asking the user for a key or showing the bootstrap command, client label, installer key, scope, lock, or command trace.
- Claiming that nothing changed or that the collection update completed.

## Output Contract

- Returns only `Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».`
