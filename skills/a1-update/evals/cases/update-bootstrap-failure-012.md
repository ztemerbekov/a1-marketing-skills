# Stop After the Automatic Updater Refresh Fails

- ID: `update-bootstrap-failure-012`
- Operation: `unknown-client-recovery`

## Setup

The runtime satisfies the current `skills` requirement. The running A1 Update is installed globally, every non-mapping preflight check succeeds, and command execution and global state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

One source-owned installed skill reports a hypothetical newer client that the running updater cannot map. The automatic source-pinned A1 Update bootstrap overwrites part of the running updater and then exits non-zero.

## Must Change

- Invokes the matching automatic updater bootstrap once only after every other read-only check succeeds.
- Treats mutation as started before invoking the bootstrap and stops all later work after its non-zero exit.
- Reports the result as potentially partial with one retry action.

## Must Preserve

- Preserves the real uncertain updater state for a later complete preflight.
- Runs no refreshed-instruction reload, collection write, verification, rollback, or second bootstrap.

## Forbidden

- Claiming that nothing changed or that the complete collection was updated.
- Showing the bootstrap command, client label, installer key, scope, lock, or command trace to the user.
- Retrying automatically or attempting to restore the prior updater copy.

## Output Contract

- Returns only `Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».`
