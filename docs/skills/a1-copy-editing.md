# A1 Copy Editing

**English** | [Русский](./a1-copy-editing.ru.md)

## What it does

A1 Copy Editing improves or reviews an existing marketing or editorial draft selected by the user. It can perform a standard edit, shorten, clarify, strengthen, restructure, apply information-style editing when explicitly requested, or provide review-only feedback.

The defining constraint is source fidelity. Facts, qualifications, names, numbers, supported meaning, useful voice, and explicit constraints remain intact. The skill improves the case already present in the sources; it does not invent missing claims, proof, positioning, offers, or strategy.

## When to use it

Select an existing draft by pasting it, attaching it, or explicitly naming a document, then ask for editing or feedback in ordinary language. The skill is model-invoked when that complete intent is clear; you may also invoke `/a1-copy-editing` explicitly.

Use [Humanize](./a1-humanize.md) when the narrow job is to remove recognizable AI-writing patterns from supplied finished copy. Russian-speaking users who prefer an explicit command can install and invoke the [A1 Редактура alias](./a1-redaktura.md).

## Editing and review

An editing request returns the edited version and a concise change summary unless you ask for the text alone. A review-only request returns prioritized findings and recommendations without silently rewriting the draft.

Marketing Context is optional. When the repository contains an eligible context file, the skill may use its confirmed defaults and protected inputs; without one, it continues from the selected draft and current instruction.

## Common questions

**Can it write a campaign, offer, or positioning from scratch?**

No. Every deliverable must edit or review the selected existing draft. A mixed request that also asks for new strategy or unrelated copy is outside this skill's contract.

**Do I have to provide audience, channel, goal, and Marketing Context first?**

No. Missing optional context must not block a safe useful edit. The skill asks only when every reasonable edit would choose between materially different meanings.

**Can I ask for feedback without a rewrite?**

Yes. Ask for a review, critique, or prioritized feedback and state that you do not want a rewrite. The result should contain findings and next moves rather than a silently edited version.

**Does “make it persuasive” allow stronger claims?**

No. Strengthening can foreground existing value, proof, and supported feature-to-outcome connections, but it cannot remove uncertainty or add evidence that the sources do not contain.

## It's working if

- The result is observably clearer, tighter, better structured, or more correct for a reason visible in the source or instruction.
- Facts, qualifications, names, numbers, and protected inputs are preserved.
- Review-only requests return prioritized feedback without an unsolicited rewrite.
- Optional context improves the edit without becoming a prerequisite.
- Output labels and explanations use the instruction language while edited copy keeps its source language.

## Where it fits

A1 Copy Editing is the main editing capability in A1 Editorial. [Humanize](./a1-humanize.md) has the narrower job of removing AI-writing patterns, while [A1 Редактура](./a1-redaktura.md) is an explicit Russian command that routes to this same capability. [Marketing Context](./a1-marketing-context.md) can supply confirmed reusable inputs but is not required.
