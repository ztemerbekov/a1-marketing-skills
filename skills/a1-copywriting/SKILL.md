---
name: a1-copywriting
description: Turn a user's communication goal, facts, and source materials into finished written communication in the format the goal requires; use for broad copywriting requests or when the format is not yet clear.
metadata:
  author: Zinnur Temerbekov
---

# Copywriting

Route a request for one new written communication artifact to the A1 skill that owns that format. This skill classifies and hands off; it does not write copy.

## Entry Contract

Accept a request when the user explicitly invokes this skill for new written communication or asks for copywriting without naming one unambiguous supported deliverable.

Classify the complete request before invoking another skill:

- a landing, product, service, course, event, or signup page belongs to `a1-landing-page-copy`;
- a routine media announcement belongs to `a1-press-release`;
- an article, guide, case study, expert essay, or newsletter issue belongs to `a1-article-writing`;
- an internal document organized around a decision, response, or awareness update belongs to `a1-decision-memo`;
- one compact workplace message for a manager, colleague, employee, contractor, partner, or existing client belongs to `a1-business-message`;
- one personalized cold outreach email belongs to `a1-cold-email`;
- a presentation outline or slide-by-slide copy belongs to `a1-presentation-copy`;
- a public company profile or About page belongs to `a1-company-profile`.

Accept only new deliverables. When the request targets a selected existing draft, state that this router handles new artifacts and stop without editing, reviewing, or delegating the draft.

When one request contains deliverables owned by different skills, identify the owner of each deliverable and ask which one to start. Produce no partial artifact.

## Routing

Invoke the selected skill through its public name. Let that skill own scope classification, context resolution, questions, source policy, procedure, and final output. Do not read or reproduce its private references.

When the required owner is unavailable, name the required skill and stop. When no listed skill owns the requested format, state that the format has no supported A1 owner and stop instead of improvising a generic result.

This router fulfills its job through a successful handoff. It returns no parallel draft, annotations, alternatives, source analysis, or support footer.
