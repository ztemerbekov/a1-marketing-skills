# humanize-output-006 — Default Draft, Audit, and Final Output

- ID: `humanize-output-006`
- Operation: `Output contract`
- Risk: The skill silently keeps A1's former final-only behavior instead of matching upstream.
- Scope Scenario: `In scope`

## User Instruction

```text
Please humanize this text.
```

## Input

```text
Here is what you need to know: the team checks comments every Friday. This simple practice is a testament to operational excellence.
```

## Must Change

- [ ] Remove signposting and inflated significance.
- [ ] Return an identifiable draft, a short audit of remaining AI patterns, and a final rewrite.

## Must Preserve

- [ ] Preserve the team, comments, and Friday.

## Forbidden

- [ ] Do not return only one rewrite, omit the final rewrite, expose hidden chain-of-thought, or add an unsupported claim.
