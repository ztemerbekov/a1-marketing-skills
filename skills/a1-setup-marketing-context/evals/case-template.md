# Eval Case: <behavior>

- ID: `context-<behavior>-<number>`
- Mode: `<Auto-draft | Interview | Passive no-op | Scope boundary | Consumer integration>`
- Risk: `<regression protected by this case>`
- Scope Scenario: `<In scope | Out of scope | Mixed job | Completed external input>`

## Setup

```text
<complete repository and client state>
```

## User Instruction

```text
<exact instruction>
```

## Input

```text
<complete authoritative material, existing context, and multi-turn harness if applicable>
```

## Must Change

- [ ] `<observable required behavior or file change>`

## Must Preserve

- [ ] `<protected content, repository state, or interaction behavior>`

## Forbidden

- [ ] `<invention, overwrite, extra write, question, or partial artifact that must not appear>`
- [ ] `<for out-of-scope or mixed jobs, name every forbidden partial output>`

## Output Contract

`<applicable normal confirmation, one-question stop, refusal, or no-op>`

## Manual Run Record

- Date: `YYYY-MM-DD`
- Client and model: `<client / model>`
- Candidate revision: `<digest or commit>`
- Reviewer: `<name>`

### Criterion Evidence

- Must change: `<pass/fail and evidence>`
- Must preserve: `<pass/fail and evidence>`
- Forbidden: `<pass/fail and evidence>`
- Output contract: `<pass/fail and evidence>`

### Result

`PASS` or `FAIL`
