# Editor Spine

Every completed `a1-editor` run follows these five stages in order. The process is invariant; the depth and detailed references are adaptive.

## Soft Gate

If editable text is missing, ask for it and stop before starting a run.

When text and an editing intent are present, start immediately. Do not ask for marketing context, audience, channel, goal, tone, or constraints. If every safe edit would choose between materially different meanings, ask one concise blocking question and resume the same run after the answer. Otherwise use the safest useful interpretation and continue.

Before using the safest useful interpretation, apply the canonical [Significant Ambiguity rule](source-boundary.md#significant-ambiguity--существенная-неоднозначность); that section owns concrete-name replacement and inference boundaries.

## 1. Determine Allowed Sources

Read [source-boundary.md](source-boundary.md). Build an internal source map from the supplied text, current instruction, available marketing context, and any clearly applicable user-provided facts from the conversation.

**Complete when:** every factual or marketing element allowed in the rewrite has a traceable source, and unsupported additions are excluded.

## 2. Select the Operation

Read [operations.md](operations.md). Select one primary operation from the user's intent and record explicit constraints as overrides. Load [information-style.md](information-style.md) only if the explicit activation rule selects that branch.

**Complete when:** one primary operation, its completion criterion, and every explicit user constraint are identified.

## 3. Edit

Apply the selected operation inside the source map. Use [canon-core.md](canon-core.md) for the shared editorial principles. Load only the detailed level references selected by [operations.md](operations.md) and actually needed by the source defects.

**Complete when:** the draft satisfies the selected operation's completion criterion, all retained claims remain source-faithful, and no unrequested operation has taken over the rewrite.

## 4. Run Final QA

Run [final-qa.md](final-qa.md) against the complete draft and revise until it passes.

**Complete when:** every final QA group passes, or a source limitation that cannot be repaired safely is preserved and named without inventing a solution.

## 5. Return the Result

Use the output contract in `../SKILL.md`. Explain only changes actually made. Include assumptions or a source limitation only when they materially affect the result.

**Complete when:** the response contains the edited text and one to five concise explanations, unless the user explicitly requested edited text only.
