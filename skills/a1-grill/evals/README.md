# A1 Grill Evaluation

This self-contained manual suite protects the explicit, adaptive A1 Grill interaction contract. Runtime instructions do not load eval material.

## Suite

Use the repository's [risk-based semantic-evaluation gates](../../../AGENTS.md#semantic-evaluation-gates) before choosing a manual run. For a bounded runtime change, select the cases that cover the changed interaction behavior and directly adjacent safety cases. A full `a1-grill` run means every case below; run it when the repository policy selects the full-suite gate.

- [missing focal object](cases/grill-entry-001.md)
- [adaptive raw idea](cases/grill-adaptive-002.md)
- [mixed grilling and execution request](cases/grill-scope-mixed-003.md)
- [multiple independent objects](cases/grill-multiple-objects-004.md)
- [fact legwork and research boundary](cases/grill-fact-legwork-007.md)
- [upstream decision revision](cases/grill-revision-008.md)
- [confirmed Russian completion](cases/grill-completion-009.md)
- [English early stop with mixed-language input](cases/grill-early-stop-010.md)
- [direct product design boundary](cases/grill-product-design-boundary-014.md)
- [product feature as marketing input](cases/grill-product-feature-input-015.md)

## Manual Run Protocol

1. Install the candidate skill in a clean agent session.
2. Reproduce the exact setup, then submit each turn without paraphrasing.
3. Judge every `Must Change`, `Must Preserve`, and `Forbidden` criterion against the complete response.
4. Treat ambiguous evidence as failure.
5. Record the tested cases, client, model, revision, results, and limitations in the pull request or release notes.

The repository policy defines escalation; structural validation never substitutes for semantic judgment.
