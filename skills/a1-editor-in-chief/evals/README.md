# A1 Editor in Chief Evaluation

This self-contained manual package protects the bounded chief-editor workflow. Runtime instructions do not load eval material.

## Case Format

Each case contains a stable ID, operation, risk, optional scope scenario, exact setup, exact user instruction, complete input, **Must change**, **Must preserve**, **Forbidden**, and a manual run record. Criteria describe observable behavior rather than golden wording.

For a changed scope boundary, cover `In scope`, `Out of scope`, `Mixed job`, and `Completed external input`. Out-of-scope and mixed-job cases name every forbidden partial output.

Use [the case template](case-template.md) for new cases. Filenames must match their declared IDs.

## Suite

- [missing Editor dependency](cases/chief-dependency-001.md)
- [explicit invocation and adaptive gate](cases/chief-explicit-002.md)
- [complete assignment and minimal output](cases/chief-explicit-003.md)
- [mixed-job refusal before dependency](cases/chief-scope-mixed-004.md)
- [completed strategy as allowed input](cases/chief-scope-completed-input-005.md)
- [marketing context fills the gate](cases/chief-context-filled-006.md)
- [incomplete gate asks one decision question](cases/chief-context-incomplete-007.md)
- [chief selects the Editor operation](cases/chief-operation-selection-008.md)
- [general marketing strategy stays out of scope](cases/chief-editorial-boundary-009.md)
- [current facts override marketing context](cases/chief-source-conflict-010.md)
- [one corrective Editor pass](cases/chief-corrective-review-011.md)
- [copy and explanation language behavior](cases/chief-language-012.md)
- [global and previous-project context isolation](cases/chief-context-isolation-013.md)
- [task-specific audience and voice override context defaults](cases/context-chief-default-override-019.md)
- [protected context conflict stops before the brief](cases/context-chief-protected-conflict-020.md)

## Manual Run Protocol

1. Prefer a clean agent session with the exact chief and Editor candidate installed according to the case setup.
2. If security policy blocks it, use the explicitly accepted constrained fallback and record the policy block, candidate digest, isolation difference, and fallback approver.
3. Submit the exact instruction and input without paraphrasing.
4. Record the complete output and judge every criterion plus the applicable output contract.
5. Treat ambiguous evidence as failure. Record the client, model, date, revision, reviewer, and fallback mode.

Structural validation never substitutes for semantic judgment.
