# grill-revision-008 — Upstream Decision Revision

- ID: `grill-revision-008`
- Operation: `Update Decision Tree`
- Risk: A changed audience leaves stale downstream conclusions in the session.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill`. Continue an active session with the established decisions supplied below.

## User Instruction

```text
Меняем аудиторию: теперь это руководители распределённых команд, а не фрилансеры.
```

## Input

```text
Root object: launch campaign for a planning service.
Resolved audience: freelancers.
Resolved promise: save two hours on weekly planning.
Resolved primary channel: freelance-community newsletters.
Open branch: campaign timing.
```

## Must Change

- [ ] Explicitly acknowledge that the upstream audience decision changed.
- [ ] Reopen every downstream conclusion materially dependent on the freelancer audience, including promise and channel.
- [ ] Recommend which reopened dependency to resolve first and end with exactly one question.

## Must Preserve

- [ ] Preserve the launch campaign as the root object.
- [ ] Preserve audience-independent decisions unless a concrete dependency requires reopening them.

## Forbidden

- [ ] Do not continue directly to campaign timing.
- [ ] Do not retain the freelancer promise or channel as settled conclusions.
- [ ] Do not ask multiple replacement questions or return a final summary.
