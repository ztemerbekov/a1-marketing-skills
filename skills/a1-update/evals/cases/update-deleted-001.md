# Remove Skills Deleted Upstream

- ID: `update-deleted-001`
- Operation: `remove-deleted`

## Setup

The upstream inventory command succeeds. Command execution is intercepted by a fixture.

## User Instruction

```text
Update Marketing Skills to the latest main.
```

## Input

The verified upstream inventory contains `a1-editor`, `a1-marketing-context`, and `a1-update`; it no longer contains `a1-editor-in-chief`.

The global lock tracks all four previous Marketing Skills from `ztemerbekov/marketing-skills`, and global list output reports them in Codex and Cursor. The current-project lock tracks `a1-editor` and `a1-editor-in-chief` from the same source, and project list output reports them in Claude Code. Both scopes also contain unrelated installed skills.

## Must Change

- Removes `a1-editor-in-chief` from both active scopes with source-scoped, non-interactive `npx skills remove` commands.
- Prunes the deleted skill's exact source-owned entries from both lock files after verifying that the installed copies are absent.
- Removes the deleted skill without asking the user for confirmation.
- Synchronizes `a1-editor`, `a1-marketing-context`, and `a1-update` into Codex and Cursor globally and into Claude Code in the current project.
- Reports the removal in the final result.

## Must Preserve

- Leaves unrelated skills and unrelated scopes unchanged.
- Continues processing other valid Marketing Skills after the removal succeeds.

## Forbidden

- Asking whether the upstream-deleted skill should be removed.
- Using `--all` or deleting by an `a1-` name prefix.
- Editing or deleting an unrelated lock entry.
- Treating a failed or incomplete upstream inventory as proof of deletion.

## Output Contract

- States that Marketing Skills was updated and names the removed skill without naming clients or scopes.
