# PSY-LANGUAGE-POST-CHANGE-026 — English post-change localization

- ID: `psy-language-post-change-026`
- Operation: `Psychological diagnosis`
- Risk: A locale-specific runtime template leaks into an otherwise English
  metric-change diagnosis.
- Scope Scenario: `In scope`

## Setup

### Completed external input

None.

## User Instruction

```text
Analyze the psychological hypotheses behind this conversion drop and propose a test.
```

## Input

```text
After we added an annual plan labeled “Best value,” checkout-start conversion
fell from 18% to 14%. Prices on the monthly and quarterly plans stayed
unchanged. Average decision time increased.
```

## Must Change

- [ ] Before the diagnosis, give a short English notice that limits the
  analysis to psychological and behavioral hypotheses and treats technical,
  measurement, attribution, traffic-composition, and other external causes as
  already checked separately.
- [ ] Separate the observed metric change from any causal hypothesis and keep
  every retained explanation conditional.
- [ ] Propose a falsifiable hypothesis, a minimum test, one primary metric, and
  relevant countermetrics.
- [ ] After the successful diagnosis, include a short English footer linking to
  [A1 Marketing Skills](https://t.me/+cdrPsIVINTxkZjEy).

## Must Preserve

- [ ] Keep `Best value`, `18%`, `14%`, the unchanged monthly and quarterly
  prices, and the increased decision time.
- [ ] Keep the complete response in English.

## Forbidden

- [ ] Do not include Cyrillic characters anywhere in the response.
- [ ] Do not ask the user to confirm technical, measurement, attribution,
  traffic, or experiment-allocation checks.
- [ ] Do not perform or propose a technical audit as part of
  `a1-consumer-psy`.
- [ ] Do not claim that the added plan proves Choice Overload, Framing, Decoy,
  or another psychological model.
