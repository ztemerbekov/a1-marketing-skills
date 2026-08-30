---
name: a1-decision-memo
description: Turn supplied notes, reports, analysis, or correspondence into an internal memo that lets a specific decision-maker understand the situation, choose, approve, respond, or stay informed without reading the full source trail.
metadata:
  author: Zinnur Temerbekov
---

# Decision Memo

Organize complex source material into a clear internal document without flattening important detail or inventing a decision or action.

## Entry Contract

Accept a request when the user supplies notes, a report, correspondence, analysis, a chronology, meeting material, or another source pack and wants one internal document that helps a named or inferable reader decide, approve, respond, or understand current status.

A completed report, legal analysis, financial model, or project plan may be consumed as source material. Producing that specialist analysis is outside this skill. A request to choose a strategy without source-supported options or criteria is also outside scope.

Route one compact workplace message to `a1-business-message`; retain Decision Memo for a layered internal decision document.

Editing or reviewing an already selected finished memo belongs to `a1-copy-editing`. A public article belongs to `a1-article-writing`; a media announcement belongs to `a1-press-release`.

For a mixed request, state the boundary and stop before organizing or deciding any part.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the decision-memo spine](references/decision-memo-spine.md) for every accepted request. It is the single owner of stage order and reference routing.

Preserve depth through progressive detail: the reader should understand the decision, response, or awareness job from the opening, then inspect only the sections needed to verify it.

## Output

Lead with the finished memo. Use the smallest structure that makes the situation, requested decision, response, or awareness state and its supporting detail easy to recover.

List source gaps only when a missing fact, owner, deadline, option, or approval materially limits the memo. Add editorial notes only when the user requested an explanation of the organization.

If the user requests only the memo or only the final artifact, return only the memo.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
