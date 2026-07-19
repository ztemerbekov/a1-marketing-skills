# grill-early-stop-010 — English Early Stop With Mixed-Language Input

- ID: `grill-early-stop-010`
- Operation: `Partial Output`
- Risk: An early stop is presented as completion or supplied Russian terms are translated.
- Scope Scenario: `In scope`

## Setup

Install `a1-grill`. Continue an English-language session with the state below.

## User Instruction

```text
Stop here and give me the partial summary in English.
```

## Input

```text
Root object: launch plan for «Школа сильных редакторов».
Resolved: initial audience is редакторы продуктовых команд.
Resolved: desired behavior is registration for a diagnostic session.
Open: promise, evidence, channel, budget, and measurement.
```

## Must Change

- [ ] Stop questioning immediately.
- [ ] Return `## Partial Summary`, explicitly state that the grilling is incomplete, then use `### Resolved` and `### Open Branches`.
- [ ] List only the supplied resolved decisions and still-open branches.

## Must Preserve

- [ ] Keep `Школа сильных редакторов` and `редакторы продуктовых команд` in Russian.
- [ ] Use English for all service labels and explanations.

## Forbidden

- [ ] Do not claim shared understanding or use the confirmed-completion output.
- [ ] Do not add `Next Step`, resolve an open branch, or continue the interview.
- [ ] Do not translate the supplied Russian name or audience term.
