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

- Stops the update and reports that the upstream inventory could not be verified.
- Identifies that no installed state was changed.

## Must Preserve

- Preserves every installed skill, lock entry, client connection, and local file.

## Forbidden

- Interpreting the empty failed output as an empty upstream repository.
- Removing `a1-editor-in-chief` or refreshing any skill after the inventory failure.
- Claiming that Marketing Skills is current.

## Output Contract

- Reports the failed inventory command and a safe retry action.
