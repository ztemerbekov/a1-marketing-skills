# Stop When the Refreshed Updater Cannot Be Reloaded

- ID: `update-reload-failure-013`
- Operation: `unknown-client-recovery`

## Setup

The runtime satisfies the current `skills` requirement. The running A1 Update is installed globally, every non-mapping preflight check succeeds, and command execution and global state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

One source-owned installed skill reports a hypothetical newer client that the running updater cannot map. The automatic A1 Update bootstrap succeeds, but the refreshed `SKILL.md` cannot be read from the installed path.

## Must Change

- Invokes the matching automatic updater bootstrap once and then attempts to reload the refreshed instructions from the same installed path.
- Stops immediately when the reload fails and reports the result as potentially partial with one retry action.

## Must Preserve

- Retains the successfully refreshed updater state without rollback.
- Runs no restarted preflight, collection write, verification, or second bootstrap.

## Forbidden

- Continuing under the stale loaded instructions or claiming complete success.
- Claiming that nothing changed.
- Showing the bootstrap command, installed path, client label, installer key, scope, lock, or command trace to the user.

## Output Contract

- Returns only `Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».`
