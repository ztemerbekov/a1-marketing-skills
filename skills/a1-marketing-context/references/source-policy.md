# Confirmed Source Policy

Record only information traceable to one of these sources:

1. A direct current user confirmation.
2. Material the user explicitly identifies as authoritative.
3. Direct factual statements in authoritative project artifacts such as the repository README, product documentation, approved landing copy, or package metadata.
4. The existing `.agents/marketing-context.md`.
5. The first eligible repository-local legacy context: `.claude/marketing-context.md` when canonical context is absent, otherwise root `marketing-context.md` only when both earlier paths are absent. Use it only when the migration rule in [merge-and-conflicts.md](merge-and-conflicts.md) is followed. When both legacy paths exist without canonical context, use neither as content until the migration gate resolves.

Repository inspection is evidence collection, not research. Do not derive audience, positioning, benefits, claims, market alternatives, business goals, or product behavior from source code, filenames, dependencies, common practice, model knowledge, or what seems likely.

Normalization may shorten labels, remove duplication, and place a confirmed statement in the right section. It must not strengthen certainty, change scope, add a benefit, turn an aspiration into proof, or convert an observation into a decision.

## Hypothesis Exclusion

Do not create, propose, save, compare, score, or evaluate hypotheses. Text marked as `hypothesis`, `idea`, `maybe`, `we think`, `to validate`, or an equivalent tentative label is not a confirmed context value even when it appears in an authoritative file.

An explicit request to store a completed, approved decision is allowed. An explicit request to store or evaluate a hypothesis is outside scope.

## Auto-draft Source Depth

Inspect only enough authoritative material to satisfy the explicit request. For a new context, collect all directly confirmed values that are readily available. For an existing context, collect only missing confirmed values unless the user explicitly requests a field update.

If an explicit Auto-draft request finds no confirmed information at all, do not create an empty file. Ask one concrete question for the first reusable fact and stop.

Legacy fallback content is a migration source, not a second active profile. Never copy it silently into a new canonical file or combine two legacy files by inference.

**Complete when:** every candidate value has a direct source, every tentative or inferred value is excluded, and a sparse repository either yields a partial confirmed patch or one concrete question.
