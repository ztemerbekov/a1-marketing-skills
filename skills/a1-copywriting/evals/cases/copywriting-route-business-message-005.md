# copywriting-route-business-message-005 — Route One Business Message

- ID: `copywriting-route-business-message-005`
- Operation: `Route`
- Risk: The router treats an existing-contact workplace message as generic copy or sends it to Cold Email.
- Scope Scenario: `In scope`

## User Instruction

```text
Use A1 Copywriting to write a message to our operations director asking her to approve the warehouse recovery option by Friday.
```

## Input

```text
The operations director is an existing internal contact. The warehouse lead recommends renting a mobile conveyor for 480,000 rubles because waiting for repairs may extend shipment delays to seven days. The rental must be reserved by Friday at 15:00.
```

## Must Change

- [ ] Classify the deliverable as one workplace message for an existing business contact.
- [ ] Invoke `a1-business-message` through its public interface.

## Must Preserve

- [ ] Preserve the existing-contact status, recommendation, amount, delay risk, and approval deadline during handoff.
- [ ] Let Business Message own source policy, message structure, and the final artifact.

## Forbidden

- [ ] Do not write the message in A1 Copywriting.
- [ ] Do not route the request to Cold Email or Decision Memo.
