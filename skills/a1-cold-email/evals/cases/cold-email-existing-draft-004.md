# cold-email-existing-draft-004 — Selected Email Boundary

- ID: `cold-email-existing-draft-004`
- Operation: `Boundary`
- Risk: The skill rewrites an existing message because it has a cold-email format.
- Scope Scenario: `Out of scope`

## User Instruction

```text
Shorten and improve the cold email below without changing its offer.
```

## Input

```text
Hi Morgan, I wanted to reach out because our revolutionary platform can transform your workflows. Could we schedule 30 minutes next week?
```

## Must Change

- [ ] State that this skill drafts a new cold email and the selected existing draft is outside its job.
- [ ] Stop without rewriting.

## Must Preserve

- [ ] Preserve the supplied email byte-for-byte.

## Forbidden

- [ ] Do not edit, review, diagnose, or replace any sentence.
- [ ] Do not create a new email from the implied intent.
