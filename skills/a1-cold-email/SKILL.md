---
name: a1-cold-email
description: Draft one new personalized cold outreach email to one recipient from supplied recipient, relationship, and offer facts when no prior conversation exists and the user wants a low-friction reply rather than a sequence, campaign, or selected-draft edit.
metadata:
  author: Zinnur Temerbekov
---

# Cold Email

Write a concise first-contact email that gives one recipient a credible reason to care and an easy way to respond.

## Entry Contract

Accept a request when every requested deliverable contributes to one new cold email for one identifiable recipient and one purpose. A recipient dossier, completed prospect research, offer brief, approved proof, and sender background are completed inputs this skill may consume.

Route these neighboring jobs elsewhere:

- a multi-email sequence, bulk campaign, or merge-field template is outside this skill;
- prospect discovery or research is outside this skill;
- an email that continues an existing conversation is not cold outreach;
- editing or reviewing a selected existing email is outside this skill.

For a mixed request, state the boundary and stop before drafting any email.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the cold-email spine](references/cold-email-spine.md) for every accepted request. Use [the source policy](references/source-policy.md) to separate known recipient relevance from speculation.

## Output

Lead with one subject line and the finished email. Add a source gap only when missing recipient, relevance, offer, proof, sender, or next-step information materially limits the draft.

If the user requests only the email, only the body, or only the final artifact, return exactly that artifact.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
