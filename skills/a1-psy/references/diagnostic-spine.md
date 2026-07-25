# Diagnostic spine

Use this sequence for every accepted diagnosis.

## 1. Separate observation from explanation

State the observed behavior or metric and the supplied context. Do not convert correlation, timing, a plausible narrative, or a named bias into a causal finding.

For a post-change metric request, show the scope notice from `SKILL.md` first. It is an analytic assumption, not a claim that the user personally completed an audit.

## 2. Choose the smallest defensible hypothesis set

Use the active model reference to test whether the facts meet the model's diagnostic conditions.

- Select **one primary** only when the facts favor it over its nearest alternatives.
- Add **zero to two secondary** hypotheses only if each is distinct and decision-useful.
- Select **no primary** when the evidence does not discriminate. Name the uncertainty plainly; do not fill the gap with a generic list of biases.

Never use a user example as a rule that a particular interface change must imply a particular model.

For pricing/valuation models, retain a hypothesis only when the evidence
matches all four dimensions: (1) the actual manipulation or reference source,
(2) the experienced payment or choice process, (3) the measured outcome, and
(4) the relevant horizon. A changed price, plan, ending, payment method, or
revenue metric alone does not satisfy this test. Child models may be primary
only when they are the narrowest best match; otherwise state that there is no
primary hypothesis yet.

For **each retained hypothesis**, provide a compact hypothesis card containing its diagnostic signs, missing discriminating evidence, evidence-context limitation, prediction, minimum test, primary metric, countermetrics, plausible backfire, and decision rule. A single experiment may serve multiple cards only when it genuinely distinguishes all of them; say how its outcome separates them.

## 3. Say what would distinguish it

Ask for no information unless it makes the next recommendation materially less arbitrary. When information is missing, name the smallest useful observation: for example, selection share by option, whether an option was preselected, or the comparison order people saw.

## 4. Design a falsifiable move

Offer a reversible, truth-based intervention or experiment. Specify:

- **Prediction:** what should differ if the hypothesis is right.
- **Variant:** the smallest change that tests the mechanism.
- **Primary metric:** the intended behavioral outcome.
- **Countermetrics:** harms, quality, reversals, complaints, refunds, retention, or equity metrics relevant to the change.
- **Plausible backfire:** what could worsen even if the primary metric improves, and how the countermetrics would reveal it.
- **Decision rule:** what result would weaken or reject the hypothesis.

Do not promise an uplift. Do not invent a sample-size requirement or statistical result.

For pricing tests, select the behavior metric together with the relevant
economic and durable outcomes: revenue and contribution margin where pricing
changes, plus refunds, cancellation, trust, comprehension, and durable
behavior where applicable. A perceptual result, a higher start rate, or gross
revenue alone is not a complete win condition.

## 5. Explain evidence proportionately

Give each retained hypothesis its model's evidence grade and one material limitation. Mention sources only from the local evidence ledger and only at the precision those sources support. Identify which of these dimensions materially limit the local inference: evidence quality, directness, population, outcome, horizon, and transportability. A research effect is not a guaranteed local product effect.

## Output shape

Use compact, readable sections appropriate to the user's language:

1. `Observation and boundary`
2. `Working hypothesis` (or `No primary hypothesis yet`)
3. `What would distinguish it`
4. `Test`
5. `Evidence and limits`
6. `Ethics warning` when triggered

Omit sections that would be empty, except that uncertainty must remain visible when no primary hypothesis is selected.
