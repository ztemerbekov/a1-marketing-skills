# A1 Editor in Chief Evaluation

This self-contained manual package protects the bounded chief-editor workflow. Runtime instructions do not load eval material.

## Case Format

Each case contains a stable ID, operation, risk, optional scope scenario, exact setup, exact user instruction, complete input, **Must change**, **Must preserve**, and **Forbidden**. Criteria describe observable behavior rather than golden wording.

For a changed scope boundary, cover `In scope`, `Out of scope`, `Mixed job`, and `Completed external input`. Out-of-scope and mixed-job cases name every forbidden partial output.

Use [the case template](case-template.md) for new cases. Filenames must match their declared IDs.

## Suite

Run this suite only when the maintainer explicitly requests semantic evaluation, for example before a release. A focused run uses the cases that answer the requested question; a full `a1-editor-in-chief` run means every case below.

- [missing Copy Editing dependency](cases/chief-dependency-001.md)
- [explicit invocation and adaptive gate](cases/chief-explicit-002.md)
- [complete assignment and minimal output](cases/chief-explicit-003.md)
- [mixed-job refusal before dependency](cases/chief-scope-mixed-004.md)
- [completed strategy as allowed input](cases/chief-scope-completed-input-005.md)
- [marketing context fills the gate](cases/chief-context-filled-006.md)
- [incomplete gate asks one decision question](cases/chief-context-incomplete-007.md)
- [chief selects the Copy Editing operation](cases/chief-operation-selection-008.md)
- [general marketing strategy stays out of scope](cases/chief-editorial-boundary-009.md)
- [current facts override marketing context](cases/chief-source-conflict-010.md)
- [one corrective Copy Editing pass](cases/chief-corrective-review-011.md)
- [global and previous-project context isolation](cases/chief-context-isolation-013.md)
- [Russian instruction localizes the complete Chief response](cases/chief-language-014.md)
- [English instruction keeps Russian copy and Chief labels](cases/chief-language-015.md)
- [final-text-only override remains wrapper-free](cases/chief-language-016.md)
- [third-language instruction localizes Chief delivery](cases/chief-language-017.md)
- [task-specific audience and voice override context defaults](cases/context-chief-default-override-019.md)
- [protected context conflict stops before the brief](cases/context-chief-protected-conflict-020.md)
- [canonical context wins over legacy fallbacks](cases/context-chief-precedence-021.md)

## Manual Run Protocol

1. Prefer a clean agent session with the exact Chief and Copy Editing candidates installed according to the case setup.
2. Submit the exact instruction and input without paraphrasing.
3. Record the complete output in temporary run notes and judge every criterion plus the applicable output contract.
4. Treat ambiguous evidence as failure.
5. Summarize the tested cases, client, model, revision, and limitations in the pull request or release notes.

The repository policy defines escalation; structural validation never substitutes for semantic judgment.
