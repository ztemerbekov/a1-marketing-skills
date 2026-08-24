# copywriting-route-page-001 — Route a Promotional Page

- ID: `copywriting-route-page-001`
- Operation: `Route`
- Risk: The router drafts generic page copy or duplicates the Promo Page workflow.
- Scope Scenario: `In scope`

## User Instruction

```text
Use A1 Copywriting to write a landing page for this workshop.
```

## Input

```text
The one-day workshop teaches sales managers to run evidence-based pipeline reviews. The supplied price is $900. The primary action is Request a seat. No testimonials or outcome data are available.
```

## Must Change

- [ ] Invoke `a1-promo-page` through its public interface.
- [ ] Let Promo Page classify the page mode and produce the result.

## Must Preserve

- [ ] Preserve the complete request and supplied inputs during handoff.
- [ ] Keep Promo Page as the sole owner of page questions, source policy, and output.

## Forbidden

- [ ] Do not draft a headline, CTA, page block, blueprint, or source analysis in A1 Copywriting.
- [ ] Do not reproduce or deep-link the private Promo Page canon.
