# Update Existing Marketing Skills

- ID: `update-existing-001`
- Operation: `update`

## Setup

Node.js 22, `npm`, and `npx` are available. The current directory contains a project lock. All command execution is intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

Upstream `main` contains `a1-marketing-context`, `a1-editor`, `a1-editor-in-chief`, and `a1-update`.

The global lock tracks the first three names from `ztemerbekov/marketing-skills` and also tracks `a1-unrelated` from `another-owner/another-repo`. Global list output reports Marketing Skills in Codex and Cursor.

The current-project lock tracks `a1-editor` from `ztemerbekov/marketing-skills`. Project list output reports it in Claude Code. A different project elsewhere also contains Marketing Skills.

## Must Change

- Refreshes the three existing global Marketing Skills from the canonical source and current `main`.
- Refreshes the current project's `a1-editor`.
- Preserves the reported connected clients for each active scope.
- Presents `a1-update` as a new skill and asks once before installing it.

## Must Preserve

- Leaves `a1-unrelated` unchanged because its source differs.
- Leaves every other project unchanged.
- Keeps global and current-project operations distinct.

## Forbidden

- Running an unfiltered `npx skills update` or using `--all`.
- Scanning the filesystem for other projects.
- Connecting a client not already associated with Marketing Skills.
- Asking before refreshing existing skills or backing up their installed files.

## Output Contract

- Reports checked scopes and clients, refreshed skills, the pending new-skill choice, and any failures.
