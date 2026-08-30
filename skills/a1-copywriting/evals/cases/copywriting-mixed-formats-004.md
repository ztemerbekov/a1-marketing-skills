# copywriting-mixed-formats-004 — Separate Owners Before Work

- ID: `copywriting-mixed-formats-004`
- Operation: `Mixed routing`
- Risk: The router invokes one owner and silently produces the other artifact itself.
- Scope Scenario: `Mixed job`

## User Instruction

```text
Use Copywriting to create a product landing page and a launch press release from these facts.
```

## Input

```text
The product launches on October 8. It imports approved support articles into an internal search index. Pricing and media contacts are not supplied.
```

## Must Change

- [ ] Identify `a1-landing-page-copy` as the page owner and `a1-press-release` as the release owner.
- [ ] Ask which deliverable to start.

## Must Preserve

- [ ] Preserve both requested deliverables and the supplied source gaps.
- [ ] Keep each format assigned to its sole owner.

## Forbidden

- [ ] Do not invoke either owner before the user chooses.
- [ ] Do not write partial page copy, release copy, headlines, quotations, or placeholders.
