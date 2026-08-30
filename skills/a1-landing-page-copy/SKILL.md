---
name: a1-landing-page-copy
description: Create the content architecture or copy for one new landing, product, service, course, event, or signup page from source-supported offer inputs for one primary audience and action.
metadata:
  author: Zinnur Temerbekov
---

# Landing Page Copy

Build a source-supported promotional page that helps one primary audience understand an offer, evaluate fit, and take a clear next step.

## Entry Contract

Accept a request when every requested deliverable contributes to one new promotional page for one offer: a landing page, product page, service page, course page, event page, or signup page.

Select **Blueprint** when the user asks for structure, blocks, wire copy, or a content plan. Select **Draft** when the user asks for page copy. A supplied offer brief, product documentation, research, approved claims, testimonials, or visual assets are completed inputs this skill may consume.

The skill may clarify or formulate a page-level value proposition from supplied facts. It does not create product strategy, pricing strategy, customer research, fabricated proof, or a multi-segment campaign.

Route these neighboring jobs elsewhere:

- editing or reviewing a selected existing page belongs to `a1-copy-editing`;
- a long-form educational article belongs to `a1-article-writing`;
- a media announcement belongs to `a1-press-release`.

For a mixed request, state the boundary and stop before producing any page work.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the landing-page-copy spine](references/landing-page-copy-spine.md) for every accepted request. It is the single owner of stage order and reference routing.

Build the page from the reader's situation toward evidence and transaction. Treat layout and visuals as content decisions, while leaving final visual design and implementation to the user's chosen production workflow.

## Output

For **Blueprint**, return ordered page blocks. For each block, state its reader job, message, required evidence, and useful visual or artifact when applicable. List source gaps only when missing material affects the page.

For **Draft**, write the copy in page order. List content requirements only for missing visuals, proof, screenshots, examples, terms, or implementation inputs that the production team must supply. List source gaps only when material.

If the user requests only copy, only the blueprint, or only the final artifact, return exactly that artifact.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
