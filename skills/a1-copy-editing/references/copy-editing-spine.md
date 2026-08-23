# Copy Editing Spine

Every completed `a1-copy-editing` run follows these five stages in order. The process is invariant; the depth and detailed references are adaptive.

## 1. Determine Allowed Sources

Read [source-boundary.md](source-boundary.md). Build an internal source map from the supplied text, current instruction, available marketing context, and any clearly applicable user-provided facts from the conversation.

Apply the canonical [Significant Ambiguity rule](source-boundary.md#significant-ambiguity) before interpreting ambiguous source material. Ask one concise blocking question only when every safe edit or useful review would choose between materially different meanings; otherwise use the safest useful interpretation.

**Complete when:** every factual or marketing element allowed in the result has a traceable source, unsupported additions are excluded, and any significant ambiguity is either resolved by one question or preserved safely.

## 2. Select the Operation

Read [operations.md](operations.md). Select one primary operation from the user's intent, select any requested output modifiers, and record explicit constraints as overrides. Load [information-style.md](information-style.md) only if the explicit activation rule selects that branch.

**Complete when:** one primary operation, its completion criterion, every compatible output modifier, and every explicit user constraint are identified.

## 3. Execute

Execute the selected operation and output modifiers according to [operations.md](operations.md), inside the source map. Use [canon-core.md](canon-core.md) for the shared editorial principles. Load only the detailed level references selected by the operation router and actually needed by the source defects.

**Complete when:** the result satisfies the selected operation's completion criterion, all claims remain source-faithful, and no unrequested operation has taken over the result.

## 4. Run Final QA

Run [final-qa.md](final-qa.md) against the complete result and revise until it passes.

**Complete when:** every final QA group passes, or a source limitation that cannot be repaired safely is preserved and named without inventing a solution.

## 5. Return the Result

Use the output contract in `../SKILL.md` without redefining its branches here.

**Complete when:** the response follows the editing or review branch selected by the operation and obeys any explicit output-only request.
