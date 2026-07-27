# Consumer Psychology Evaluation

This manual suite tests `a1-consumer-psy` through its installed public interaction.
Each case is a non-canonical regression fixture: runtime instructions must not
copy its scenario, wording, or expected model choice.

## Selecting a run

Run this suite only when the maintainer explicitly requests semantic evaluation, for example before a release. A focused run uses the cases that answer the requested question; a full `a1-consumer-psy` run means every case cited in this README.

For every selected case:

1. Install the candidate `a1-consumer-psy` revision in a clean client session.
2. Reproduce only the setup written in the case and submit its exact user instruction and input without paraphrasing.
3. Judge every `Must Change`, `Must Preserve`, and `Forbidden` criterion.
4. Treat ambiguous evidence as failure. Record the required evidence in the pull request or release under the repository policy.

## Coverage map

| Parent runtime-behavior family | What the cases protect | Case IDs |
| --- | --- | --- |
| 1. Explicit entry | A deliberate invocation starts the interaction; an uninvoked psychology request does not select the skill. | `psy-explicit-invocation-022`, `psy-no-implicit-invocation-025` |
| 2. Metric-change diagnosis | A post-change observation is not mistaken for a cause. | `psy-post-change-001`, `psy-no-primary-002`, `psy-goals-no-primary-016` |
| 3. Hypothesis discipline | Retained hypotheses need discriminating observations, instrumentation, readable roles, and separate confidence. | `psy-secondary-010`, `psy-belief-ambiguity-013`, `psy-executive-readable-audit-027`, `psy-recommendation-ready-028` |
| 4. Evidence and transport | Research status never becomes a local-effect guarantee. | `psy-evidence-008`, `psy-transport-014` |
| 5. Choice complexity and defaults | Choice-set complexity and preselection remain conditional, reversible hypotheses. | `psy-benign-006`, `psy-completed-input-004` |
| 6. Goals, plans, and habits | Goal progress, if–then plans, and automaticity keep their required operations. | `psy-goal-progress-014`, `psy-if-then-011`, `psy-habit-frequency-013` |
| 7. Attention and familiarity | Exposure is separated from clicks, purchase, and dose-independent claims. | `psy-exposure-wearout-011` |
| 8. Understanding and belief | Fluency, expert knowledge, and belief selection are not generic labels. | `psy-processing-fluency-015`, `psy-novice-comprehension-012`, `psy-belief-ambiguity-013` |
| 9. Pricing references | Anchors and reference prices need a truthful, identifiable comparison standard. | `psy-pricing-reference-013` |
| 10. Pricing perception and quality | Left-digit and price-quality inferences do not become revenue promises. | `psy-pricing-left-digit-014`, `psy-pricing-quality-015` |
| 11. Payment timing and true zero | Payment affect, present bias, and zero price retain their actual manipulations. | `psy-pricing-timing-011`, `psy-pricing-free-012` |
| 12. Post-choice evaluation | Expectations and episode evaluation are separated from retention. | `psy-post-choice-015`, `psy-transport-014` |
| 13. Social influence | Descriptive, normative, informational, and source effects keep source and outcome conditions. | `psy-descriptive-norm-011`, `psy-normative-informational-012`, `psy-social-evidence-source-013` |
| 14. Identity, autonomy, and vulnerability | Identity and reactance protect voluntary, non-exploitative choice. | `psy-identity-vulnerability-015`, `psy-freedom-threat-012` |
| 15. Truth and dark-pattern risk | Fabricated scarcity or proof is warned about while a truthful test remains available. | `psy-false-scarcity-005`, `psy-scarcity-source-014`, `psy-social-evidence-source-013` |
| 16. Catalog boundary | Guardrails and research-only or unlisted positions remain outside ordinary diagnosis. | `psy-guardrail-framework-018`, `psy-guardrail-hick-016`, `psy-guardrail-routing-017`, `psy-guardrail-survivorship-019`, `psy-research-only-020`, `psy-unlisted-model-021` |
| 17. Language and localized output | Runtime messages follow the instruction language, use the public mechanism terminology for that language, and preserve supplied copy. | `psy-language-009`, `psy-language-post-change-026`, `psy-language-third-language-029` |
