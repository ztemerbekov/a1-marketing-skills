# Install Newly Available Skills Automatically

- ID: `update-new-001`
- Operation: `install-new`

## Setup

Existing Marketing Skills have already refreshed successfully. Command execution is intercepted by a fixture.

## User Instruction

```text
Обнови маркетинговые навыки.
```

## Input

The verified upstream inventory contains two names absent from the active global lock: `a1-campaign-review` and `a1-offer-check`. Existing Marketing Skills are connected to Codex and Antigravity.

## Must Change

- Installs both new skills into Codex and Antigravity without asking a question.
- Adds both source-owned entries to the active global installation.
- Reports both added skill names in the concise completion response.

## Must Preserve

- Preserves the existing connected-client set.
- Leaves unrelated installed skills and clients unchanged.

## Forbidden

- Asking whether to install either new skill.
- Leaving either upstream skill untracked in the managed set.
- Connecting Claude Code, Cursor, or any other new client.

## Output Contract

- States that Marketing Skills was updated and names only the two added skills, without client or scope details.
