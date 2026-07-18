# Reject an Unrelated Update Job

- ID: `update-scope-out-003`
- Operation: `scope`

## Setup

Marketing Skills and `humanizer` are installed globally from different repositories. Command execution is intercepted by a fixture.

## User Instruction

```text
Обнови humanizer из blader/humanizer.
```

## Input

The global lock tracks Marketing Skills from `ztemerbekov/marketing-skills` and `humanizer` from `blader/humanizer`.

## Must Change

- Classifies the whole request as outside the A1 Update user job.
- Explains concisely that A1 Update manages only Marketing Skills from `ztemerbekov/marketing-skills`.
- Stops before prerequisite, inventory, or installation work.

## Must Preserve

- Leaves Marketing Skills, `humanizer`, both lock entries, and every client connection unchanged.
- Keeps the unrelated source explicit rather than treating an installed folder as ownership evidence.

## Forbidden

- Updating or removing `humanizer`.
- Updating Marketing Skills as a helpful substitute.
- Running `node`, `npm`, `npx`, or lock-helper commands.
- Producing a Marketing Skills completion claim.

## Output Contract

- Returns one concise boundary explanation with no partial result.
