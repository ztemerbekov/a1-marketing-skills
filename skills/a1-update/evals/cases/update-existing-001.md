# Update Existing Marketing Skills

- ID: `update-existing-001`
- Operation: `update`

## Setup

The runtime satisfies the current `skills` requirement, and `npm` and `npx` are available. The current directory contains a project lock. All command execution is intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

Upstream `main` contains `a1-marketing-context`, `a1-editor`, `a1-editor-in-chief`, and `a1-update`.

The global lock tracks the first three names from `ztemerbekov/marketing-skills` and also tracks `a1-unrelated` from `another-owner/another-repo`. Global list output reports Marketing Skills in Codex and Cursor.

The current-project lock tracks `a1-editor` from `ztemerbekov/marketing-skills`. Project list output reports it in Claude Code. A different project elsewhere also contains Marketing Skills.

## Must Change

- Synchronizes all four upstream Marketing Skills from the canonical source and current `main` into both active scopes.
- Installs all four global skills into Codex and Cursor, the union already connected to Marketing Skills globally.
- Installs all four current-project skills into Claude Code, the client already connected to Marketing Skills in that scope.
- Installs `a1-update` automatically without asking a question.

## Must Preserve

- Leaves `a1-unrelated` unchanged because its source differs.
- Leaves every other project unchanged.
- Keeps global and current-project managed client sets distinct.

## Forbidden

- Running an unfiltered `npx skills update` or using `--all`.
- Scanning the filesystem for other projects.
- Connecting a client not already associated with Marketing Skills in that scope.
- Asking before refreshing, adding, or removing Marketing Skills.
- Backing up installed skill files.

## Output Contract

- Returns only the concise completion message in the instruction language and does not name clients or scopes.
