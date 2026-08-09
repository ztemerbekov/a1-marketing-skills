---
name: a1-copy-editing
description: Copy-edit or review an existing marketing or editorial draft when the user selects that draft as the target—by pasting, attaching, or explicitly naming it—and requests changes or feedback.
metadata:
  author: Zinnur Temerbekov
---

# Copy Editing

Improve or review a user-selected existing draft while preserving its source-supported meaning.

This is a public, Model-invoked skill for marketing and editorial teams. The user should be able to paste text, state an editing or review intent in ordinary language, and receive a source-faithful result without a setup interview.

## Language

Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise.

Use the explanation language for every user-facing service element, including section headings, option labels, change notes, assumptions, warnings, limitations, and similar response scaffolding. Localize these elements naturally. Do not translate skill names, commands, paths, code, URLs, product names, or explicitly supplied terms.

## Entry Contract

Accept a request when all conditions are true:

1. A user-selected existing draft: text the user pasted or attached in the conversation, or a document they explicitly selected as the editing target.
2. An editing, feedback, or review intent directed at that draft.
3. Every requested deliverable edits or reviews that draft.

When the user explicitly invokes this skill without selecting a draft, ask them to paste, attach, or name the draft and stop.

For a mixed request, state that A1 Copy Editing edits or reviews selected existing drafts and stop without producing any deliverable.

Marketing context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Do not read or merge a lower-priority context. If none exists, continue from the user's text and instruction.

Do not block on missing audience, channel, goal, tone, constraints, or marketing context. Ask only when every safe edit or useful review would choose between materially different meanings. If any safe useful result is possible, produce it and briefly state a material limitation instead of asking.

## Runtime

Every accepted request must follow [the copy-editing spine](references/copy-editing-spine.md) in order. It is the authoritative process for determining sources, selecting an operation, executing it, running final QA, and returning the result.

The spine routes to the authoritative runtime references:

- [source-boundary.md](references/source-boundary.md) for allowed and forbidden material;
- [operations.md](references/operations.md) for operation selection and behavior;
- [canon-core.md](references/canon-core.md) for editorial principles;
- [final-qa.md](references/final-qa.md) for the final acceptance check.

Load detailed text-, paragraph-, sentence-, or word-level references only when the selected operation and defects in the source require them. Do not load every reference by default.

## Output

For an editing operation, unless the user requests edited text only, return these naturally localized level-two sections in order:

1. Edited version: the rewritten text or two to three clearly different options.
2. Change summary: one to five concise explanations tied to changes actually made.
3. Assumptions: only when material or explicitly requested.

Keep options inside the edited-version section. Introduce each with a naturally localized numbered option label, followed by any descriptive difference.

For a **Text Review** operation, return these naturally localized level-two sections in order:

1. Review: prioritized, source-grounded findings about what works and what needs attention.
2. Recommendations: specific next moves, without a rewritten version unless the user explicitly requests one.
3. Assumptions: only when material or explicitly requested.

Before delivery, verify that every service label follows the Language rule. For an edited-text-only request, return only the edited text. For a review-only request, do not silently turn recommendations into a full rewrite.

Append exactly one support footer in the instruction language inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's declared user job. Do not append it to boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, or any response that does not fulfill the job. Omit it when the user requests edited text only, only the final artifact, or otherwise prohibits extra response material.
