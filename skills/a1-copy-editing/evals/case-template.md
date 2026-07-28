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
