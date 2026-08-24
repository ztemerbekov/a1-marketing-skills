---
name: a1-presentation-copy
description: Create the message architecture or slide-by-slide copy for one new presentation from supplied material for a defined audience, occasion, and next step; exclude slide-file production, visual design, and edits to a selected existing deck.
metadata:
  author: Zinnur Temerbekov
---

# Presentation Copy

Turn source material into a presentation whose slides each carry one useful point for a specific audience and occasion.

## Entry Contract

Accept a request when every requested deliverable contributes to one new presentation. Select **Outline** for message architecture, slide sequence, or an evidence plan. Select **Draft** for slide-by-slide copy. Supplied research, data, strategy, speaker notes, product material, and visual assets are completed inputs this skill may consume.

This skill creates presentation content, not a `.pptx` or Google Slides file. It does not conduct missing research, invent strategy, calculate unsupported data, design layouts, or edit a selected existing deck.

For a mixed request, state the boundary and stop before producing presentation content.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the presentation-copy spine](references/presentation-copy-spine.md) for every accepted request. Apply [the source policy](references/source-policy.md) before choosing the narrative path or slide claims.

## Output

For **Outline**, return the presentation job and an ordered slide sequence. For each slide, give the takeaway, evidence or visual required, and its role in the audience's path.

For **Draft**, return slide-by-slide copy with a takeaway headline, essential on-slide content, and an evidence-bearing visual instruction when useful. Include speaker notes only when requested.

If the user requests only the outline, only the slide copy, or only the final artifact, return exactly that artifact.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
