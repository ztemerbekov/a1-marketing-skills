# A1 Editor Evaluation

This directory is the self-contained manual evaluation package for `a1-editor`. It protects important operations and safety boundaries without requiring one golden rewrite or an automated LLM judge.

Evaluation files are maintainer material. Runtime instructions do not need to load them during ordinary editing requests.

## Case Format

Store one Markdown file per realistic behavior or regression. A case must be runnable on its own: embed the complete user instruction, input text, and any allowed marketing context. Write `None` when no marketing context is part of the case; do not rely on external fixtures or undocumented setup.

Every case contains:

1. A stable ID, operation, and risk statement.
2. Optional setup and the exact marketing context, if any.
3. The exact user instruction.
4. The complete input text.
5. **Must change** criteria for observable problems the result must correct.
6. **Must preserve** criteria for meaning, facts, voice, structure, and explicit constraints that must survive.
7. **Forbidden** criteria for inventions, unsupported claims, or operation-boundary violations that must not appear.
8. A manual run record with evidence and a pass/fail result.

Criteria must describe observable behavior, not preferred wording. Use the [case template](case-template.md) as the starting point for every new case.

## Starter Suite

The starter suite maps directly to the standard editor contract:

- [standard edit and voice preservation](cases/standard-edit-voice.md)
- [shortening](cases/shorten.md)
- [clarifying weak source material](cases/clarify-weak-source.md)
- [strengthening without unsupported claims](cases/strengthen-unsupported-claims.md)
- [restructuring](cases/restructure.md)
- [significant ambiguity](cases/significant-ambiguity.md)
- [explicit information-style activation](cases/information-style-explicit.md)
- [generic editing that must not activate information style](cases/information-style-not-inferred.md)
- [legacy information-style LLM post regression](cases/information-style-llm-post.md)

## Manual Run Protocol

1. Start a clean agent session with the current `skills/a1-editor/` directory installed.
2. Reproduce only the setup written in the case. If marketing context is `None`, do not add one.
3. Submit the exact user instruction and input without paraphrasing.
4. Save the complete output in the case's temporary run notes or another review artifact. Do not rewrite the criteria after seeing the result.
5. Review every **Must change**, **Must preserve**, and **Forbidden** item manually. Record a short output excerpt or concrete observation as evidence.
6. Mark an item pass only when the evidence is clear. Treat ambiguous evidence as a failure and explain why.
7. Mark the case pass only when every criterion passes. Record the client, model, skill revision, date, and reviewer so later runs are comparable.

Run relevant cases after changes to the editor's routing, gates, source boundary, operations, output contract, or canon. Run the full manual suite before a release that changes editor behavior.

Automated repository validation checks only that this evaluation contract and template have the required structure. Semantic quality remains a human judgment during the pilot.
