# Fail Closed When Upstream Is Unavailable

- ID: `update-upstream-failure-001`
- Operation: `inventory-failure`

## Setup

Node.js 22.20.0 or newer, `npm`, and `npx` are available. One exact-source global installation is active in Codex and Cursor, no current-project installation is active, and every command is intercepted by a fixture. GitHub is unavailable and the upstream inventory command fails.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

The global lock tracks `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update` from exactly `ztemerbekov/marketing-skills`. Their installed state is unchanged before the run. The failed upstream inventory output contains no skill names, so installed-inventory reads and every mutating command remain unexecuted.

## Must Change

- Stops the whole update before the mutation barrier because the source collection could not be verified.
- States plainly that the update could not be prepared and nothing changed.
- Gives one retry action without exposing the failed command.

## Must Preserve

- Preserves every installed skill, lock entry, client connection, and local file.

## Forbidden

- Interpreting the empty failed output as an empty upstream repository.
- Removing `a1-editor-in-chief` or refreshing any skill after the inventory failure.
- Claiming that Marketing Skills is current.
- Showing the failed command, client state, lock files, installer keys, or diagnostic alternatives.

## Output Contract

- Returns exactly `Не удалось подготовить обновление. Ничего не изменено. Повторите запрос позже.` in Russian.
