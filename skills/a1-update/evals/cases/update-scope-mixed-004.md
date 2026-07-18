# Reject a Mixed Source Update

- ID: `update-scope-mixed-004`
- Operation: `scope`

## Setup

Marketing Skills and `humanizer` are installed globally from different repositories. Command execution is intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills и humanizer.
```

## Input

The global lock tracks Marketing Skills from `ztemerbekov/marketing-skills` and `humanizer` from `blader/humanizer`.

## Must Change

- Classifies the whole request as a mixed job before checking prerequisites or inventory.
- Names the unsupported unrelated-source update and asks the user to separate it from the Marketing Skills update.
- Stops without performing either part.

## Must Preserve

- Leaves every installed skill, lock entry, and client connection unchanged.
- Keeps the exact Marketing Skills source boundary intact.

## Forbidden

- Partially updating Marketing Skills.
- Updating or removing `humanizer`.
- Running `node`, `npm`, `npx`, or lock-helper commands.
- Returning `Marketing Skills обновлены.` or any other completion claim.

## Output Contract

- Returns one concise mixed-job boundary response and no partial update result.
