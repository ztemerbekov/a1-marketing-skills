# context-passive-noop-002 — Passive Events Cause No Write

- ID: `context-passive-noop-002`
- Mode: `Passive no-op`
- Risk: Installation, project opening, a marketing mention, or another skill's missing-context notice creates state without user intent.
- Scope Scenario: `Out of scope`

## Setup

```text
Install the skill in a repository with no .agents/ directory. Open the project. Then an Editor run internally observes that marketing context is absent.
```

## User Instruction

```text
We will work on marketing later. For now, open the project and shorten this sentence: Review Hub puts reviews in one list.
```

## Input

```text
No save, remember, setup, update, or interview request is present.
```

## Must Change

- [ ] Keep `a1-setup-marketing-context` uninvoked across installation, project opening, the generic marketing mention, and Editor's missing-context observation.

## Must Preserve

- [ ] Leave repository state exactly as it was and allow the separate Editor job to proceed without context.

## Forbidden

- [ ] Do not create `.agents/`, `.agents/marketing-context.md`, a global profile, private context, fallback file, or `CONTEXT-MAP.md`.
- [ ] Do not offer setup, ask context questions, or emit a context creation/update confirmation.

## Output Contract

`No context-skill output and no context write.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
