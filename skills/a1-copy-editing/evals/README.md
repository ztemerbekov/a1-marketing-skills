# A1 Copy Editing Evaluation

This directory is the self-contained manual evaluation package for `a1-copy-editing`. It protects important operations and safety boundaries without requiring one golden rewrite or an automated LLM judge.

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

Name every case file exactly `<ID>.md`, using the stable ID declared inside the file. The repository validator enforces this mapping so a reported case ID always resolves directly to its filename.

Criteria must describe observable behavior, not preferred wording. Use the [case template](case-template.md) as the starting point for every new case.

Every materially changed scope boundary must have coverage for four scenarios across its suite: `In scope`, `Out of scope`, `Mixed job`, and `Completed external input`. In out-of-scope and mixed-job cases, list the specific partial artifacts or operations that are forbidden; a generic instruction to "stay in scope" is not sufficient.

## Cases

### Invocation Boundary

- [a conversational documentation complaint does not select an editable draft](cases/editor-invocation-boundary-020.md)
- [an explicit invocation without a selected draft requests one](cases/editor-missing-draft-001.md)
- [an explicitly selected draft activates text review](cases/editor-invocation-boundary-021.md)
- [pasted copy with ordinary editing intent activates editing](cases/editor-invocation-boundary-022.md)

### Entry Contract

- [a completed user-supplied draft remains editable](cases/editor-completed-input-007.md)
- [mixed editing and new-copy request stops before partial execution](cases/editor-mixed-job-008.md)

### Standard Copy Editing

- [ordinary editing continues without optional context](cases/editor-optional-context-006.md)
- [standard edit and voice preservation](cases/editor-standard-001.md)
- [standard edit repairs unnatural verb government and collocation](cases/editor-standard-002.md)
- [a colloquial Russian edit request starts a standard edit](cases/editor-standard-003.md)
- [shortening](cases/editor-shorten-001.md)
- [clarifying weak source material](cases/editor-clarify-001.md)
- [strengthening without unsupported claims](cases/editor-strengthen-001.md)
- [restructuring](cases/editor-restructure-001.md)
- [significant ambiguity](cases/editor-ambiguity-001.md)

### Text Review

- [feedback request diagnoses the text without silently rewriting it](cases/editor-review-001.md)
- [combined rewrite and substantive review remain non-duplicative](cases/editor-combined-review-023.md)

### Response and Source Preservation

- [variant request preserves supplied terms and facts](cases/editor-variants-010.md)
- [edited-text-only override remains wrapper-free](cases/editor-artifact-only-012.md)

### Information Style

- [explicit information-style activation](cases/editor-information-style-001.md)
- [generic editing that must not activate information style](cases/editor-information-style-002.md)
- [technical content and Markdown integrity](cases/editor-information-style-003.md)
- [voice preservation override](cases/editor-information-style-004.md)
- [formatting preservation override](cases/editor-information-style-008.md)
- [unsupported claims](cases/editor-information-style-006.md)

### Marketing Context Consumption

- [task-specific audience and voice override context defaults](cases/context-editor-default-override-017.md)
- [protected context conflict stops before editing](cases/context-editor-protected-conflict-018.md)
- [canonical context wins over legacy fallbacks](cases/context-editor-precedence-019.md)
