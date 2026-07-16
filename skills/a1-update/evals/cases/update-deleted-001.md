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

The global and current-project locks both track `a1-editor-in-chief` from `ztemerbekov/marketing-skills`. The verified upstream inventory no longer contains that skill. Both scopes also contain unrelated installed skills.

## Must Change

- Removes `a1-editor-in-chief` from both active scopes with source-scoped, non-interactive `npx skills remove` commands.
- Prunes the deleted skill's exact source-owned entries from both lock files after verifying that the installed copies are absent.
- Removes the deleted skill without asking the user for confirmation.
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

- Names the removed skill and both affected scopes.
