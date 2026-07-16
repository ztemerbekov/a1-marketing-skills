# Confirm Newly Available Skills

- ID: `update-new-001`
- Operation: `install-new`

## Setup

Existing Marketing Skills have already refreshed successfully. Command execution is intercepted by a fixture.

## User Instruction

```text
Обнови маркетинговые навыки.
```

## Input

The verified upstream inventory contains two names absent from the active global lock: `a1-campaign-review` and `a1-offer-check`. Their descriptions are available. Existing Marketing Skills are connected to Codex and Antigravity.

The user answers the grouped confirmation with: `Только a1-offer-check`.

## Must Change

- Shows both new names, their descriptions, and the global scope in one confirmation.
- Installs only `a1-offer-check` into Codex and Antigravity.
- Leaves `a1-campaign-review` untracked so it will be offered on the next update.

## Must Preserve

- Preserves the user's subset choice.
- Preserves the existing connected-client set.

## Forbidden

- Installing either new skill before the user responds.
- Asking a separate confirmation for each new skill.
- Persisting an ignore or dismissal file for `a1-campaign-review`.
- Connecting Claude Code, Cursor, or any other new client.

## Output Contract

- Reports the installed and declined new skills separately.
