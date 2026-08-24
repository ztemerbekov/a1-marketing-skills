---
name: a1-company-profile
description: Draft or structure one new public company profile or About page from supplied company facts for a primary audience and context, including mission or values only when supported by confirmed decisions and practices.
metadata:
  author: Zinnur Temerbekov
---

# Company Profile

Explain what one company does, for whom, how it works, and what makes it credible without replacing facts with corporate ceremony.

## Entry Contract

Accept a request when every requested deliverable contributes to one new public company profile or About page. Select **Outline** for content architecture or a fact plan. Select **Draft** for finished copy. Supplied company facts, history, operating details, policies, customer evidence, approved mission, values, and brand material are completed inputs this skill may consume.

A page dedicated to selling one offer belongs to `a1-promo-page`. A routine media announcement belongs to `a1-press-release`. This skill does not invent corporate strategy, positioning, mission, values, history, credentials, social impact, or culture, and it does not edit a selected existing profile.

For a mixed request, state the boundary and stop before producing profile content.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the company-profile spine](references/company-profile-spine.md) for every accepted request. Apply [the source policy](references/source-policy.md) before selecting company claims, history, mission, or values.

## Output

For **Outline**, return the primary audience context and an ordered set of sections. For each section, state the reader question, supported answer, and evidence or fact still required.

For **Draft**, lead with the finished profile or About-page copy. Add source gaps only when missing material affects accuracy, credibility, or completion.

If the user requests only the outline, only the copy, or only the final artifact, return exactly that artifact.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
