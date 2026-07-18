# Ignore an Unrelated Project Lock Silently

- ID: `update-unrelated-project-lock-011`
- Operation: `scope-isolation`

## Setup

The runtime satisfies the current `skills` requirement, and `npm` and `npx` are available. Marketing Skills are installed globally. The current directory contains `skills-lock.json`, and all command execution and filesystem state are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

Upstream `main` contains the complete current Marketing Skills collection. The exact-source global lock tracks that collection, and global installed inventory reports one valid managed client set. The current-project `skills-lock.json` contains only `humanizer` from `blader/humanizer`; it contains no entry from `ztemerbekov/marketing-skills`.

## Must Change

- Treats only the global Marketing Skills installation as active.
- Completes the source-scoped global synchronization without running a current-project inventory or installation command.
- Returns the ordinary concise success response.

## Must Preserve

- Leaves the current-project lock and `humanizer` installation byte-for-byte unchanged.
- Leaves every unrelated source, skill, client connection, and project file unchanged.

## Forbidden

- Treating the presence of `skills-lock.json` alone as an active Marketing Skills project scope.
- Running `npx skills list --json`, `add`, `remove`, or the lock helper for the current project.
- Mentioning `humanizer`, `blader/humanizer`, `skills-lock.json`, the project scope, or the decision to skip it in user-visible output.
- Asking the user whether the unrelated project entry should be updated, removed, or ignored.

## Output Contract

- Returns only `Marketing Skills обновлены.`
