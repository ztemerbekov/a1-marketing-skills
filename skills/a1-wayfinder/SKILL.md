---
name: a1-wayfinder
description: Chart a large, unclear marketing initiative as one shared decision map and resolve its decisions one at a time until the route to a brief, strategy, or plan is clear.
metadata:
  author: Zinnur Temerbekov
disable-model-invocation: true
---

# Wayfinder

Turn a marketing effort that is too large and foggy for one conversation into one shared decision map. Find the way to the **destination**; do not execute the destination itself.

Use two modes:

- **Chart** when the user brings a loose marketing initiative without a map.
- **Continue** when the user supplies or identifies an existing Wayfinder map.

Keep one map as the complete source of truth. Represent work as decision questions inside that document, not as tracker issues, project tasks, labels, assignments, or a separate backlog.

## Decision ownership

Distinguish facts, recommendations, and decisions:

- Establish discoverable facts from supplied material or reliable sources.
- Give a concrete recommendation when judgment is needed.
- Treat a consequential choice about audience, positioning, promise, budget, risk, or brand as resolved only when the user confirms it or supplied authority already settles it.

Record uncertainty and material disagreement. Never turn an assumption, recommendation, or plausible market convention into a confirmed decision.

## Plan, don't execute

Wayfinding ends when nothing material remains to decide before a downstream skill or team can create the destination. A cheap research pass, comparison, outline, message sketch, or other disposable prototype may support a decision; it is evidence, not the destination.

Resolve at most one decision in a Continue run. Charting creates the map and stops before resolving its first decision.

## Shared map

Read [the map format](references/map-format.md) whenever creating or updating a map. Keep the destination, decisions, frontier, blocked questions, fog, and out-of-scope boundary in one document.

Use the user's named writable document when provided. Otherwise, if a writable workspace is available, create `wayfinder-<short-topic>.md` at its root. Use a short lowercase hyphenated topic and avoid overwriting an existing file. If no writable workspace exists, return the complete map in the conversation so the user can save and supply it later.

When working inside a repository, this skill may read one existing Marketing Context as defaults in this order:

1. `.agents/marketing-context.md`;
2. `.claude/marketing-context.md` only when the first path is absent;
3. `marketing-context.md` at the repository root only when both earlier paths are absent.

Read only the first existing path. Do not write, migrate, merge, or infer confirmation from Marketing Context. A conflict with the current request remains open until the user resolves it.

## Chart

1. **Test the shape.** Confirm that the effort is a marketing initiative whose route is still unclear and materially larger than one focused conversation. If it is already clear or small, explain that a map would add overhead, make no file, and ask whether the user wants to proceed directly.
2. **Name the destination.** Establish the concrete brief, strategy, decision, or plan that should be ready when wayfinding ends. Ask only the questions required to make that destination observable in one or two sentences. The destination fixes the scope.
3. **Map breadth-first.** Read [the marketing lenses](references/marketing-lenses.md). Use only relevant lenses to surface independent decision questions across the initiative before drilling into any one branch.
4. **Separate the terrain.** Put sharp, currently answerable questions in **Frontier**; sharp questions with unresolved prerequisites in **Blocked**; in-scope areas that cannot yet be phrased as a precise question in **Fog**; and work beyond the destination in **Out of scope**.
5. **Create the map.** Fill every applicable section from the map format. Keep unsupported claims visibly open. Leave **Decisions** empty unless the user or an authoritative supplied source had already confirmed a decision before charting.
6. **Stop.** Report where the map lives and name the first frontier decision. Do not resolve it in the charting run.

Charting is complete when the destination is observable, every currently sharp decision is in Frontier or Blocked with its dependencies, the remaining in-scope uncertainty is in Fog, and the map contains no execution backlog.

## Continue

1. **Load one map.** Use the document the user supplies or names. If none is named, use the only `wayfinder-*.md` file in the writable workspace; when several exist, ask which map to continue and stop.
2. **Orient.** Read the destination, existing decisions, frontier, blocked questions, fog, and out-of-scope boundary. Do not preload unrelated supporting material.
3. **Choose the decision.** Use a user-named frontier question when supplied. Otherwise choose the unblocked question whose answer most reduces uncertainty or unlocks downstream decisions. State which question is being resolved.
4. **Resolve it.** Gather available evidence and discuss the trade-off at the fidelity the question needs. Carry out small in-scope research or a disposable prototype directly when available. When a required input can only come from the user or unavailable external work, record that input under the question and move it to Blocked; then choose another frontier question unless the user explicitly selected the blocked one.
5. **Record the resolution.** After the user confirms a consequential choice, move the question from Frontier to Decisions and record the decision, rationale, evidence, consequences, and material uncertainty once.
6. **Recompute the map.** Promote newly sharp fog into Frontier or Blocked, move newly unblocked questions to Frontier, revise dependencies affected by the decision, and move newly excluded work to Out of scope. Use [the marketing lenses](references/marketing-lenses.md) only when the answer exposes a new area of fog.
7. **Stop after one decision.** Report the resolved decision and the next frontier question. When Frontier, Blocked, and Fog are all empty, mark the map Clear and name the appropriate downstream handoff.

A Continue run is complete when exactly one decision has been recorded or the selected decision has been accurately blocked without pretending it was resolved.

## Fog and scope

Use one test throughout:

- **Frontier or Blocked:** the decision question can be stated precisely now.
- **Fog:** the area is relevant to the destination, but the decision question cannot yet be stated precisely.
- **Out of scope:** the area lies beyond the destination regardless of how clear it is.

Fog may graduate into several decisions or disappear after an earlier resolution. Out-of-scope work returns only if the user redraws the destination.

## Final response

After a successful Chart or Continue result, link the map when possible, state what changed, and name the next available decision or downstream handoff. Do not reproduce the whole map unless it exists only in the conversation or the user asks to see it.

Append one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a successful map creation, recorded decision, or Clear handoff. Omit it from small-effort boundary responses, clarification prompts, blocked runs, unsuccessful results, and responses where the user requests only the artifact.
