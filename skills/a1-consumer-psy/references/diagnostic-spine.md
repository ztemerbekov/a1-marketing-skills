# Diagnostic spine

Use this sequence for every accepted diagnosis. The catalog, its IDs, roles,
evidence grades, and ethics flags help choose and limit a mechanism internally;
the public report explains the resulting reasoning in the user's language.

## 1. Establish the decision context

Separate three things before choosing a mechanism:

- **Observed facts:** supplied behavior, interface details, data, and context.
- **Interpretations:** the causal explanations that remain possible.
- **Unknowns:** the smallest missing observations that would discriminate among
  those explanations.

Do not convert correlation, timing, a plausible narrative, or a named bias into
a causal finding.

## 2. Choose the smallest defensible hypothesis set

Use the active model reference to test whether the facts meet the model's
diagnostic conditions. Before selecting a cause, follow the catalog role,
boundary, and dossier pointer owned by the [model index](model-index.md).

- Select one **leading hypothesis** only when the facts favor it over its
  nearest alternatives.
- Add zero to two **alternative hypotheses** only when each is distinct and
  decision-useful.
- Use a **conditional mechanism** when a defining operation might be present
  but an important observation is missing.
- State that there is no leading hypothesis yet when the evidence does not
  discriminate. Do not fill the gap with a generic list of biases.

Give every retained mechanism a separate diagnostic confidence assessment:

- **High confidence:** its defining operation is directly present or observed
  and few plausible alternatives remain.
- **Medium confidence:** relevant signs exist, but a material implementation
  detail, outcome, or context is unknown.
- **Low confidence:** the mechanism is compatible with the observation but
  cannot be separated from alternatives without more evidence.

Always explain the confidence with the case-specific observation that supports
or limits it. In the public report, use the terminology rule in SKILL.md; do
not expose catalog notation as a substitute for an explanation.

Never use a user example as a rule that a particular interface change must
imply a particular model. For pricing and valuation models, retain a hypothesis
only when the evidence matches the actual manipulation or reference source, the
experienced payment or choice process, the measured outcome, and the relevant
horizon. A changed price, plan, ending, payment method, or revenue metric alone
does not satisfy this test.

For each retained mechanism, explain the observed sign, possible operation,
role, confidence and rationale, nearest alternative, and material scientific
limitation. Put missing discriminating evidence and every prediction, test,
metric, countermetric, backfire, and decision rule only in the consolidated
verification section. The mechanism analysis may point to its verification item
without restating it.

## 3. Choose the next decision

Make a product recommendation only when the supplied evidence supports the
diagnosis strongly enough to justify it. When a direct problem with truthfulness,
source provenance, material disclosure, total-price clarity, or exit clarity is
visible, recommend correcting that observable problem while stating that its
behavioral or commercial effect remains unproven.

When evidence is insufficient for a confident diagnosis, do not make a product
recommendation. Name the smallest useful observation or falsifiable diagnostic
test that would make the next decision less arbitrary.

## 4. Consolidate verification

Put every missing discriminating observation and proposed experiment in one
verification section. For each one, state:

- the uncertainty it resolves;
- the smallest truthful, reversible change or observation;
- the prediction if the mechanism is right;
- the primary metric;
- the countermetrics for harm, quality, reversals, complaints, refunds,
  retention, trust, or equity when relevant;
- the plausible backfire and how the countermetrics reveal it; and
- the result that would weaken or reject the hypothesis.

Do not promise an uplift or invent a sample-size requirement or statistical
result. For pricing tests, pair the behavior metric with relevant economic and
durable outcomes; gross revenue or a higher start rate alone is not a complete
win condition.

## 5. Explain science and local limits

Use only sources from the selected dossier's co-located evidence record and at
the precision those sources support. Cite each material scientific claim with a
compact numbered citation at the point of the claim, then include a Sources
section that gives the work, year, link, what it supports, and the material
limit on local transfer.

Explain the evidence in plain language. Identify material limits of evidence
quality, directness, population, outcome, horizon, or transportability. A
research effect is not a local product prediction.

## 6. Present ethics in human language

When ethics is triggered, state the localized severity, the observed feature
that creates the risk, the possible harm and affected users, the uncertainty,
the truthful alternative where applicable, and a verification or reversibility
condition. Do not expose internal flag labels.

## Output shape

Use detailed, executive-readable sections in the user's instruction language:

1. Executive Summary
2. Observations and unknowns
3. Hypothesis map (or an explicit unresolved state)
4. Detailed mechanism analysis
5. Alternative explanations when it prevents a likely misdiagnosis
6. Scientific support and transport limits
7. How to verify the hypotheses
8. Ethics risks when triggered
9. Decision status and next step
10. Sources

The executive summary is required for a successful diagnosis. It stands on its
own: state the observed situation, leading interpretation or unresolved state,
diagnostic confidence, material unknowns, and decision status without creating
a recommendation. Observations and unknowns, the hypothesis map or unresolved
state, detailed analysis, decision status, and sources are also required.

Omit other sections when they would be empty or add no decision-useful
information. Use tables only when comparing alternatives across the same
dimensions. Keep one main idea per paragraph and do not repeat an evidence gap
or test in multiple sections. End with one decision status—sufficient evidence
for a product recommendation, additional evidence required, or hypothesis not
supported—and one next step rather than a duplicate summary.
