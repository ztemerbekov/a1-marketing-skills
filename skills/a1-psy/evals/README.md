# A1 Psychology Evaluation

This manual suite tests `a1-psy` through its installed public interaction.
Each case is a non-canonical regression fixture: runtime instructions must not
copy its scenario, wording, or expected model choice.

## Mandatory release gate

Before merging or releasing a revision that changes runtime behavior:

1. Install the candidate `a1-psy` revision in a clean client session.
2. Run every case below, covering all 18 parent runtime-behavior families.
3. Reproduce only the setup written in each case and submit its exact user
   instruction and input without paraphrasing.
4. Judge every `Must Change`, `Must Preserve`, and `Forbidden` criterion.
5. Treat ambiguous evidence as failure. In the pull request or release, record
   the case IDs, client, model, revision, pass/fail evidence, and limitations.

Structural validation confirms package shape only. It does not replace this
semantic evaluation, and no PR may claim manual semantic validation before this
run has occurred. A case can support a closely adjacent family; a full run means
every listed case, not a sample of 18.

## Coverage map

| Parent runtime-behavior family | What the cases protect | Case IDs |
| --- | --- | --- |
| 1. Explicit entry | A deliberate invocation starts the interaction; an uninvoked psychology request does not select the skill. | `psy-explicit-invocation-022`, `psy-no-implicit-invocation-025` |
| 2. Scope classification | In-scope, mixed, and completed-external-input requests stay distinct. | `psy-mixed-scope-003`, `psy-completed-input-004` |
| 3. Independent input | Analysis uses the current request and directly supplied materials only. | `psy-independent-input-023` |
| 4. Metric-change boundary | A post-change observation is not mistaken for a cause or a technical investigation. | `psy-post-change-001`, `psy-no-primary-002`, `psy-goals-no-primary-016` |
| 5. Hypothesis discipline | Primary and secondary hypotheses need discriminating observations and instrumentation. | `psy-secondary-010`, `psy-belief-ambiguity-013` |
| 6. Evidence and transport | Research status never becomes a local-effect guarantee. | `psy-evidence-008`, `psy-transport-014` |
| 7. Choice complexity and defaults | Choice-set complexity and preselection remain conditional, reversible hypotheses. | `psy-benign-006`, `psy-completed-input-004` |
| 8. Goals, plans, and habits | Goal progress, if–then plans, and automaticity keep their required operations. | `psy-goal-progress-014`, `psy-if-then-011`, `psy-habit-frequency-013` |
| 9. Attention and familiarity | Exposure is separated from clicks, purchase, and dose-independent claims. | `psy-exposure-wearout-011` |
| 10. Understanding and belief | Fluency, expert knowledge, and belief selection are not generic labels. | `psy-processing-fluency-015`, `psy-novice-comprehension-012`, `psy-belief-ambiguity-013` |
| 11. Pricing references | Anchors and reference prices need a truthful, identifiable comparison standard. | `psy-pricing-reference-013` |
| 12. Pricing perception and quality | Left-digit and price-quality inferences do not become revenue promises. | `psy-pricing-left-digit-014`, `psy-pricing-quality-015` |
| 13. Payment timing and true zero | Payment affect, present bias, and zero price retain their actual manipulations. | `psy-pricing-timing-011`, `psy-pricing-free-012` |
| 14. Post-choice evaluation | Expectations and episode evaluation are separated from retention. | `psy-post-choice-015`, `psy-transport-014` |
| 15. Social influence | Descriptive, normative, informational, and source effects keep source and outcome conditions. | `psy-descriptive-norm-011`, `psy-normative-informational-012`, `psy-social-evidence-source-013` |
| 16. Identity, autonomy, and vulnerability | Identity and reactance protect voluntary, non-exploitative choice. | `psy-identity-vulnerability-015`, `psy-freedom-threat-012` |
| 17. Truth and dark-pattern risk | Fabricated scarcity or proof is warned about while a truthful test remains available. | `psy-false-scarcity-005`, `psy-scarcity-source-014`, `psy-social-evidence-source-013` |
| 18. Catalog and execution boundary | Guardrails, research-only/unlisted positions, and production work remain outside ordinary diagnosis. | `psy-guardrail-framework-018`, `psy-guardrail-hick-016`, `psy-guardrail-routing-017`, `psy-guardrail-survivorship-019`, `psy-research-only-020`, `psy-unlisted-model-021`, `psy-execution-boundary-024` |
