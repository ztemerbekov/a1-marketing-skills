---
name: a1-copywriting
description: Use when a user asks for broad copywriting help or one new ordinary marketing-copy artifact without naming a listed A1 format owner, and the request is not an edit of a selected draft.
metadata:
  author: Zinnur Temerbekov
---

# Copywriting

Handle one new written communication request through the right A1 format owner or, when no listed owner fits, write one ordinary marketing-copy artifact directly. Classify the complete request before producing any artifact.

## Entry Contract

Accept a request when the user explicitly invokes this skill for new written communication, asks broadly for copywriting, or asks in ordinary language for one new ordinary marketing-copy artifact with no listed owner—even without naming this skill or saying “copywriting”.

Classify the complete request before invoking another skill:

- a landing, product, service, course, event, or signup page belongs to `a1-landing-page-copy`;
- a routine media announcement belongs to `a1-press-release`;
- an article, guide, case study, expert essay, or newsletter issue belongs to `a1-article-writing`;
- an internal document organized around a decision, response, or awareness update belongs to `a1-decision-memo`;
- one compact workplace message for a manager, colleague, employee, contractor, partner, or existing client belongs to `a1-business-message`;
- one personalized cold outreach email belongs to `a1-cold-email`;
- a presentation outline or slide-by-slide copy belongs to `a1-presentation-copy`;
- a public company profile or About page belongs to `a1-company-profile`.

When no listed owner fits, use the **direct fallback** only for one new ordinary marketing-copy artifact such as ad copy, a social post, a tagline, a product blurb, or campaign copy. A specialist or high-stakes format—such as legal, regulatory, financial, medical, safety-critical, investor-relations, or crisis communication—stays outside this fallback; state the boundary and stop without drafting it.

Accept only new deliverables. When the request targets a selected existing draft, state that this skill handles new artifacts and stop without editing, reviewing, or delegating the draft.

When one request contains two or more deliverables—route+route, route+direct, direct+direct, or any mix containing a boundary item—classify every item first and identify each listed owner, direct fallback, or boundary. If at least one item is eligible, ask which eligible deliverable to start; if none is eligible, state the boundary and stop. Produce no partial artifact.

## Routing

Invoke the selected skill through its public name. Let that skill own scope classification, context resolution, questions, source policy, procedure, and final output. Do not read or reproduce its private references.

When the required owner is unavailable, name the required skill and stop. For a direct fallback, read [`direct-copywriting.md`](references/direct-copywriting.md) and let it own the writing procedure, source handling, and output QA.

Routing fulfills this skill's job through a successful handoff and returns no parallel draft, annotations, alternatives, source analysis, or support footer. Direct fallback fulfills the job with the finished artifact and follows its reference's output and support-footer rules.
