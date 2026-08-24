---
name: a1-copywriting
description: Route a broad or explicitly invoked request for new marketing copy to the specialized A1 skill that owns the requested deliverable; use when the user asks for copywriting without already selecting one clear supported format.
metadata:
  author: Zinnur Temerbekov
---

# Copywriting

Route a request for one new marketing artifact to the A1 skill that owns that format. This skill classifies and hands off; it does not write copy.

## Entry Contract

Accept a request when the user explicitly invokes this skill for new marketing copy or asks for copywriting without naming one unambiguous supported deliverable.

Classify the complete request before invoking another skill:

- a landing, product, service, course, event, or signup page belongs to `a1-promo-page`;
- a routine media announcement belongs to `a1-press-release`;
- an article, guide, case study, expert essay, or newsletter issue belongs to `a1-article-writing`;
- an internal document organized around a decision, response, or awareness update belongs to `a1-decision-memo`;
- one personalized cold outreach email belongs to `a1-cold-email`;
- a presentation outline or slide-by-slide copy belongs to `a1-presentation-copy`;
- a public company profile or About page belongs to `a1-company-profile`.

Accept only new deliverables. When the request targets a selected existing draft, state that this router handles new artifacts and stop without editing, reviewing, or delegating the draft.

When one request contains deliverables owned by different skills, identify the owner of each deliverable and ask which one to start. Produce no partial artifact.

## Routing

Invoke the selected skill through its public name. Let that skill own scope classification, context resolution, questions, source policy, procedure, and final output. Do not read or reproduce its private references.

When the required owner is unavailable, name the required skill and stop. When no listed skill owns the requested format, state that the format has no supported A1 owner and stop instead of improvising a generic result.

This router fulfills its job through a successful handoff. It returns no parallel draft, annotations, alternatives, source analysis, or support footer.
