# Final QA

This is the authoritative final acceptance check for `a1-copy-editing`. Run it after the complete result and before formatting the response.

## 1. Source Fidelity

- Every specific element in the result is traceable under [source-boundary.md](source-boundary.md).
- Facts, names, figures, links, product terms, and material qualifications remain accurate to the allowed sources.
- No source hedge or qualification was removed while retaining the same tentative outcome as a categorical claim; a related feature alone does not justify that change.
- The result contains no forbidden addition from the source boundary.

## 2. Operation Completion

- The primary operation's completion criterion in [operations.md](operations.md) passes.
- Secondary edits support the primary operation instead of replacing it.
- The selected operation remains the dominant task, and Information Style appears only after explicit activation.
- A **Text Review** result prioritizes source-grounded findings and does not include a full rewrite unless explicitly requested.

## 3. Meaning, Voice, and Constraints

- The intended meaning is preserved unless the user explicitly asked to change it.
- Explicit constraints on length, voice, structure, format, and wording are obeyed.
- Meaningful personality, firsthand experience, caution, and technical precision survive the edit.

## 4. Editorial Improvement

- For an editing operation, the result is observably clearer, tighter, stronger, or easier to follow according to the selected operation.
- For an editing operation, the shared language-correctness principle in [canon-core.md](canon-core.md) passes: grammar, grammatical government, collocation, and wording are natural in the edited copy's language.
- For **Text Review**, each criticism is actionable, proportionate, and tied to observable source material.
- Useful detail was not removed or dismissed merely to make the text shorter or smoother.
- The result does not become generic, manipulative, or falsely confident.

## 5. Response Integrity

- The response follows every language, labeling, order, and exception rule in the output contract in `../SKILL.md`.
- An editing result contains the localized change-summary section with one to five concise explanations of changes actually made, unless the user requested edited text only.
- A **Text Review** result contains localized review and recommendation sections without claiming changes were made.
- Assumptions or limitations appear only when they materially affect the result.

## Pass Rule

Revise before returning the result until every applicable check passes. If a limitation cannot be resolved without unsupported material, keep the safe source-faithful result and name the limitation. Ask a question only under the significant-ambiguity rule in [source-boundary.md](source-boundary.md).
