---
name: a1-press-release
description: Draft a new routine press release or event announcement from supplied facts, returning distribution-ready copy when critical inputs are confirmed or a marked working draft when they are not; exclude crisis, emergency, legal-response, regulatory, earnings, securities, and investor-relations statements.
metadata:
  author: Zinnur Temerbekov
---

# Press Release

Turn routine announcement inputs into a distribution-ready release or a clearly marked working draft that makes the event, relevance, facts, action, and press contact easy to extract.

## Entry Contract

Accept a request when the user supplies a concrete routine news event or change and wants one new press release or media announcement. Suitable inputs include a launch, opening, partnership, program, event, application period, research publication, operational milestone, or customer-relevant change.

The skill consumes supplied facts and background; it does not verify confidential facts or grant internal approval. Crisis communications, accidents, emergencies, allegations, litigation responses, regulatory disclosures, earnings releases, securities communications, and other investor-relations statements are outside scope. State that boundary and stop without drafting.

Generic editing or review of a selected finished release belongs to `a1-copy-editing`. A promotional product page belongs to `a1-promo-page`; a reported or educational long-form story belongs to `a1-article-writing`.

For a mixed request, state the boundary and stop before producing any deliverable.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the press-release spine](references/press-release-spine.md) for every accepted request. It is the single owner of stage order and reference routing. [The source policy](references/source-policy.md) owns readiness classification.

Write for extraction: a journalist or partner should be able to identify the news and reuse verified facts without decoding corporate ceremony.

## Output

Use the readiness classification from [the source policy](references/source-policy.md) and make that state unmistakable in the result. A working draft keeps unresolved material out of authoritative prose and separately names what must be confirmed before distribution.

Any proposed spokesperson wording remains unmistakably proposed and approval-pending.

An artifact-only request suppresses service commentary but never changes readiness. Return the classified result without presenting unresolved claims as facts.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
