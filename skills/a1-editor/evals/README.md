# A1 Editor Evaluation

This directory is the self-contained manual evaluation package for `a1-editor`. It protects important operations and safety boundaries without requiring one golden rewrite or an automated LLM judge.

Evaluation files are maintainer material. Runtime instructions do not need to load them during ordinary editing requests.

## Case Format

Store one Markdown file per realistic behavior or regression. A case must be runnable on its own: embed the complete user instruction, input text, and any allowed marketing context. Write `None` when no marketing context is part of the case; do not rely on external fixtures or undocumented setup.

Every case contains:

1. A stable ID, operation, risk statement, and applicable scope scenario when the case protects a boundary.
2. Optional setup and the exact marketing context, if any.
3. The exact user instruction.
4. The complete input text.
5. **Must change** criteria for observable problems the result must correct.
6. **Must preserve** criteria for meaning, facts, voice, structure, and explicit constraints that must survive.
7. **Forbidden** criteria for inventions, unsupported claims, operation-boundary violations, or partial outputs that must not appear.
8. A manual run record with evidence and a pass/fail result.

Name every case file exactly `<ID>.md`, using the stable ID declared inside the file. The repository validator enforces this mapping so a reported case ID always resolves directly to its filename.

Criteria must describe observable behavior, not preferred wording. Use the [case template](case-template.md) as the starting point for every new case.

Every materially changed scope boundary must have coverage for four scenarios across its suite: `In scope`, `Out of scope`, `Mixed job`, and `Completed external input`. In out-of-scope and mixed-job cases, list the specific partial artifacts or operations that are forbidden; a generic instruction to "stay in scope" is not sufficient.

## Starter Suite

### Strategy Boundary and Bounded Chief Handoff

- [positioning request stops at the Editor boundary](cases/editor-strategy-route-001.md)
- [offer request stops at the Editor boundary](cases/editor-strategy-route-002.md)
- [audience request stops at the Editor boundary](cases/editor-strategy-route-003.md)
- [campaign request stops at the Editor boundary](cases/editor-strategy-route-004.md)
- [landing-structure request stops at the Editor boundary](cases/editor-strategy-route-005.md)
- [strategy keywords do not route an ordinary edit](cases/editor-strategy-boundary-007.md)
- [mixed editing and strategy request stops before partial execution](cases/editor-strategy-boundary-008.md)
- [completed strategy plus editorial direction routes to explicit bounded Chief invocation](cases/editor-chief-handoff-009.md)

### Standard Editor

- [ordinary editing stays in Editor without optional context](cases/editor-strategy-boundary-006.md)
- [standard edit and voice preservation](cases/editor-standard-001.md)
- [shortening](cases/editor-shorten-001.md)
- [clarifying weak source material](cases/editor-clarify-001.md)
- [strengthening without unsupported claims](cases/editor-strengthen-001.md)
- [restructuring](cases/editor-restructure-001.md)
- [significant ambiguity](cases/editor-ambiguity-001.md)

### Information Style

- [explicit information-style activation](cases/editor-information-style-001.md)
- [generic editing that must not activate information style](cases/editor-information-style-002.md)
- [legacy information-style LLM post regression](cases/editor-information-style-003.md)
- [voice preservation override](cases/editor-information-style-004.md)
- [structure preservation override](cases/editor-information-style-005.md)
- [formatting preservation override](cases/editor-information-style-008.md)
- [unsupported claims](cases/editor-information-style-006.md)
- [Markdown integrity](cases/editor-information-style-007.md)

## Manual Run Protocol

1. Prefer a clean agent session with the current `skills/a1-editor/` directory installed. If security policy blocks it, use the explicitly accepted constrained fallback: load the exact candidate in the current supported client and record the policy block, candidate digest, isolation difference, and fallback approver.
2. Reproduce only the setup written in the case. If marketing context is `None`, do not add one.
3. Submit the exact user instruction and input without paraphrasing.
4. Save the complete output in the case's temporary run notes or another review artifact. Do not rewrite the criteria after seeing the result.
5. Review every **Must change**, **Must preserve**, and **Forbidden** item manually. Record a short output excerpt or concrete observation as evidence.
6. Mark an item pass only when the evidence is clear. Treat ambiguous evidence as a failure and explain why.
7. Mark the case pass only when every criterion passes. Record the client, model, skill revision, date, reviewer, and fallback mode when used so later runs are comparable.

Run relevant cases after changes to the editor's routing, gates, source boundary, operations, output contract, or canon. Run the full manual suite before a release that changes editor behavior.

Automated repository validation checks only that this evaluation contract and template have the required structure. Semantic quality remains a human judgment during the pilot.
