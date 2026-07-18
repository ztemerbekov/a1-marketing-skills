# Fail Closed When Upstream Is Unavailable

- ID: `update-upstream-failure-001`
- Operation: `inventory-failure`

## Setup

The installed lock contains Marketing Skills, but GitHub is unavailable and the upstream inventory command fails.

## User Instruction

```text
Update Marketing Skills.
```

## Input

The local lock includes `a1-editor-in-chief`. The failed inventory output contains no skill names.

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
