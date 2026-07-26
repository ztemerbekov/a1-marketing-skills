# A1 Grill Evaluation

This self-contained manual suite protects the explicit, adaptive A1 Grill interaction contract. Runtime instructions do not load eval material.

## Suite

Use the repository's [risk-based semantic-evaluation gates](../../../AGENTS.md#semantic-evaluation-gates) before choosing a manual run. For a bounded runtime change, select the cases that cover the changed interaction behavior and directly adjacent safety cases. A full `a1-grill` run means every case below; run it when the repository policy selects the full-suite gate.

- [missing focal object](cases/grill-entry-001.md)
- [adaptive raw idea](cases/grill-adaptive-002.md)
- [mixed grilling and execution request](cases/grill-scope-mixed-003.md)
- [multiple independent objects](cases/grill-multiple-objects-004.md)
- [marketing-context consent](cases/grill-context-consent-005.md)
- [marketing-context refusal](cases/grill-context-refusal-006.md)
- [fact legwork and research boundary](cases/grill-fact-legwork-007.md)
- [upstream decision revision](cases/grill-revision-008.md)
- [confirmed Russian completion](cases/grill-completion-009.md)
- [English early stop with mixed-language input](cases/grill-early-stop-010.md)
- [Claude-local fallback consent](cases/grill-context-fallback-consent-011.md)
- [root fallback refusal](cases/grill-context-root-refusal-012.md)
- [canonical context wins over fallbacks](cases/grill-context-precedence-013.md)

## Manual Run Protocol

1. Install the candidate skill in a clean agent session.
2. Reproduce the exact setup, then submit each turn without paraphrasing.
3. Judge every `Must Change`, `Must Preserve`, and `Forbidden` criterion against the complete response.
4. Treat ambiguous evidence as failure.
5. Record the tested cases, client, model, revision, results, and limitations in the pull request or release notes.

The repository policy defines escalation; structural validation never substitutes for semantic judgment.
