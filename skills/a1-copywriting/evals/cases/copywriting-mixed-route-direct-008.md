# copywriting-mixed-route-direct-008 — Classify Routed and Direct Deliverables

- ID: `copywriting-mixed-route-direct-008`
- Operation: `Mixed routing`
- Risk: The hybrid skill treats a direct-fallback artifact as unowned work, then silently routes or drafts only part of a mixed request.
- Scope Scenario: `Mixed job`

## User Instruction

```text
Write a landing page for our workshop and one LinkedIn launch post for the same event.
```

## Input

```text
The one-day workshop teaches sales managers to run evidence-based pipeline reviews. It takes place on October 8 and costs $900. The landing page should ask readers to request a seat; the LinkedIn post should invite sales leaders to join the launch list. No testimonials or outcome data are supplied.
```

## Must Change

- [ ] Classify the landing page as `a1-landing-page-copy`.
- [ ] Classify the LinkedIn post as the direct fallback because no listed A1 owner covers an ordinary social post.
- [ ] Ask which eligible deliverable to start before producing either artifact.

## Must Preserve

- [ ] Preserve both requested deliverables and their distinct audiences and next steps.
- [ ] Preserve the supplied workshop, date, price, and absence of testimonials or outcome data during classification.
- [ ] Keep the landing page under its dedicated owner and the LinkedIn post under the direct fallback.

## Forbidden

- [ ] Do not invoke `a1-landing-page-copy` before the user chooses.
- [ ] Do not write the LinkedIn post, landing-page copy, headlines, calls to action, or placeholders.
- [ ] Do not silently drop, merge, or substitute either deliverable.
