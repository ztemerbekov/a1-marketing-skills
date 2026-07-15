# Final QA

This is the authoritative final acceptance check for `a1-editor`. Run it after the complete draft and before formatting the response.

## 1. Source Fidelity

- Every specific element in the draft is traceable under [source-boundary.md](source-boundary.md).
- Facts, names, figures, links, product terms, and material qualifications remain accurate to the allowed sources.
- The draft contains no forbidden addition from the source boundary.

## 2. Operation Completion

- The primary operation's completion criterion in [operations.md](operations.md) passes.
- Secondary edits support the primary operation instead of replacing it.
- No unrequested deep rewrite, strategy work, or information-style behavior took over the result.

## 3. Meaning, Voice, and Constraints

- The intended meaning is preserved unless the user explicitly asked to change it.
- Explicit constraints on length, voice, structure, format, and wording are obeyed.
- Meaningful personality, firsthand experience, caution, and technical precision survive the edit.

## 4. Editorial Improvement

- The result is observably clearer, tighter, stronger, or easier to follow according to the selected operation.
- Useful detail was not removed merely to make the text shorter or smoother.
- The result does not become choppy, generic, or falsely confident.

## 5. Response Integrity

- The response follows the output contract in `../SKILL.md`.
- `What Changed` contains one to five concise explanations of changes actually made.
- If the user requested edited text only, no explanations or process notes are added.
- Assumptions or limitations appear only when they materially affect the rewrite.

## Pass Rule

Revise before returning the result until every applicable check passes. If a limitation cannot be fixed without unsupported material, keep the safe source-faithful edit and name the limitation. Ask a question only under the significant-ambiguity rule in [source-boundary.md](source-boundary.md).
