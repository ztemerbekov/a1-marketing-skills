# Stop When Preflight Fails After Updater Recovery

- ID: `update-restarted-preflight-failure-014`
- Operation: `unknown-client-recovery`

## Setup

The runtime satisfies the current `skills` requirement. The running A1 Update is installed globally, every non-mapping first-pass preflight check succeeds, and command execution and all active scopes are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

One source-owned installed skill reports a hypothetical newer client that the running updater cannot map. The automatic updater bootstrap and refreshed-instruction reload succeed. During the required complete restarted preflight, the upstream inventory becomes unavailable before any ordinary collection write.

## Must Change

- Restarts the original request from runtime and complete read-only preflight without reusing the earlier inventory or plan.
- Stops when the restarted upstream inventory fails and reports the result as potentially partial because the updater refresh already mutated state.

## Must Preserve

- Retains the refreshed updater without rollback.
- Runs no collection write, stale-plan continuation, verification, or second bootstrap.

## Forbidden

- Reporting an unchanged state or ordinary preflight-failure message after the updater changed.
- Showing the bootstrap command, client label, installer key, scope, lock, or command trace to the user.
- Treating missing upstream inventory as deletion evidence.

## Output Contract

- Returns only `Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».`
