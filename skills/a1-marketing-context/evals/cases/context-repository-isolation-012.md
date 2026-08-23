# context-repository-isolation-012 — Write Stays in Current Repository

- ID: `context-repository-isolation-012`
- Mode: `Auto-draft`
- Risk: Context leaks through a global profile, last-used repository, private variant, or domain map.
- Scope Scenario: `In scope`

## Setup

```text
Two temporary repositories exist: repo-a is current and repo-b was used previously. Neither has context. A home directory is writable in the harness.
```

## User Instruction

```text
In this repository, remember that the approved audience is marketplace managers.
```

## Input

```text
Current repository: repo-a
Previously used repository: repo-b
Confirmed value: audience = marketplace managers
```

## Must Change

- [ ] Create only `repo-a/.agents/marketing-context.md` with `Audience Defaults`.

## Must Preserve

- [ ] Leave repo-b and the home directory unchanged and link the file in repo-a.

## Forbidden

- [ ] Do not write to repo-b, a global config directory, a last-used pointer, private context, fallback file, or `CONTEXT-MAP.md`.
- [ ] Do not create more than one context inside repo-a.

## Output Contract

Confirmation that repo-a's canonical file was created, with its relative link and only `Audience Defaults` listed as changed.
