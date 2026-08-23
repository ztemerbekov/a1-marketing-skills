---
name: a1-copy-editing
description: Copy-edit or review an existing marketing or editorial draft when the user selects that draft as the target—by pasting, attaching, or explicitly naming it—and requests changes or feedback.
metadata:
  author: Zinnur Temerbekov
---

# Copy Editing

Improve or review a user-selected existing draft while preserving its source-supported meaning.

The user should be able to paste text, state an editing or review intent in ordinary language, and receive a source-faithful result without a setup interview.

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

Every accepted request must follow [the copy-editing spine](references/copy-editing-spine.md) in order. The spine owns stage order and routes each stage to its canonical behavior contract.

## Output

For an editing operation, unless the user requests edited text only, return:

1. Edited version: the rewritten text or two to three clearly different options.
2. Change summary: one to five concise explanations tied to changes actually made.
3. Assumptions: only when material or explicitly requested.

Keep options together with the edited version and state the meaningful difference between them.

For a **Text Review** operation, return:

1. Review: prioritized, source-grounded findings about what works and what needs attention.
2. Recommendations: specific next moves, without a rewritten version unless the user explicitly requests one.
3. Assumptions: only when material or explicitly requested.

For a compatible request that asks for both editing and substantive review, return:

1. Edited version: the rewritten text.
2. Review: prioritized findings that remain useful after the rewrite, including strengths or risks the user should understand.
3. Recommendations: only next moves not already completed by the rewrite.
4. Assumptions: only when material or explicitly requested.

For an edited-text-only request, return only the edited text. For a review-only request, do not silently turn recommendations into a full rewrite. Do not make a combined request repeat the same observation in both Review and Recommendations.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's declared user job. Do not append it to boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, or any response that does not fulfill the job. Omit it when the user requests edited text only, only the final artifact, or otherwise prohibits extra response material.
