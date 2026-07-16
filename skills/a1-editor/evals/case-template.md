# Eval Case: <short behavior name>

- ID: `editor-<operation>-<number>`
- Operation: `<editing operation or safety boundary>`
- Risk: `<what regression this case protects against>`
- Scope Scenario: `<In scope | Out of scope | Mixed job | Completed external input, when applicable>`

## Setup

### Marketing Context

None.

## User Instruction

```text
<exact instruction>
```

## Input

```text
<complete source text>
```

## Must Change

- [ ] `<observable problem the result must correct>`

## Must Preserve

- [ ] `<meaning, fact, voice, structure, or explicit constraint to keep>`

## Forbidden

- [ ] `<invention, unsupported claim, or boundary violation that must not appear>`
- [ ] `<for an out-of-scope or mixed-job case, each specific partial output or operation that must not appear>`

## Manual Run Record

- Date: `YYYY-MM-DD`
- Client and model: `<client / model>`
- Skill revision: `<commit SHA>`
- Reviewer: `<name>`

### Criterion Evidence

- Must change: `<pass/fail and evidence>`
- Must preserve: `<pass/fail and evidence>`
- Forbidden: `<pass/fail and evidence>`

### Result

`PASS` or `FAIL`
