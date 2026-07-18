# Treat the First Write Failure as Partial Completion

- ID: `update-first-write-failure-010`
- Operation: `first-write-failure`

## Setup

Node.js 22.20.0 or newer, `npm`, and `npx` are available. One exact-source global installation passes the complete preflight, no current-project installation is active, and every command and file is intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

Upstream and the global lock contain all four current Marketing Skills. Installed inventory resolves the managed client set to Codex and Cursor, and no membership change is planned. The first mutating command is the global managed-set synchronization. It overwrites part of the installed `a1-editor` copy and then exits non-zero before the remaining skills are refreshed.

## Must Change

- Treats invocation of the first mutating command as the start of mutation instead of waiting for a successful exit.
- Stops all later writes and records the uncertain partial state internally.
- Reports partial completion with one action to repeat the original Marketing Skills update request.

## Must Preserve

- Leaves the actual partially written state in place for a fresh retry preflight.
- Leaves unrelated skills, clients, lock entries, and files unchanged.

## Forbidden

- Claiming that nothing changed because the command returned non-zero.
- Attempting to restore overwritten files, a lock snapshot, or any other automatic rollback.
- Retrying automatically, running another installer command, or exposing command/client/lock details to the user.

## Output Contract

- Returns exactly `Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».` in Russian.
