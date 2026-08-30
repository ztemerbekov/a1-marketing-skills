# copywriting-route-decision-memo-009 — Route a Reference-Ready Decision Document

- ID: `copywriting-route-decision-memo-009`
- Operation: `Route`
- Risk: Channel wording such as “email” makes the hybrid skill choose a compact Business Message even when the requested artifact must remain a layered, durable internal document.
- Scope Scenario: `In scope`

## User Instruction

```text
Use A1 Copywriting to email our operations director about the warehouse recovery option. Make it suitable for forwarding and later reference: include a decision summary, compare renting a mobile conveyor with waiting for repairs using evidence and risks, recommend one option, and record who must approve it by Friday. The email should carry the full context, not just a short ask.
```

## Input

```text
The operations director is an existing internal contact. The warehouse lead recommends renting a mobile conveyor for 480,000 rubles because waiting for repairs may extend shipment delays to seven days. The rental must be reserved by Friday at 15:00.
```

## Must Change

- [ ] Classify the artifact by its required layered, durable, reference-ready shape, not by the delivery channel word “email”.
- [ ] Invoke `a1-decision-memo` through its public interface.
- [ ] Preserve the required decision summary, options, evidence, risks, recommendation, and decision record during handoff.

## Must Preserve

- [ ] Preserve the existing-contact status, recommendation, amount, delay risk, approval owner, and Friday 15:00 deadline.
- [ ] Keep Decision Memo as the sole owner of the layered document's source policy, structure, and final artifact.

## Forbidden

- [ ] Do not route the request to `a1-business-message` merely because the document will be delivered by email.
- [ ] Do not write a compact email body, subject line, or send-ready message in A1 Copywriting.
- [ ] Do not flatten the options, evidence, risks, recommendation, or decision record into a short approval ask.
