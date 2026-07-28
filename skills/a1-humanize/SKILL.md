---
name: a1-humanize
description: 'Remove recognizable AI-writing patterns from supplied copy while preserving its facts, meaning, language, and authorial voice. Use for explicit requests to humanize text or make it sound less AI-generated, including "очеловечь текст", "убери признаки AI", and "сделай менее AI-шным". Do not use for generic editing or for new marketing strategy, offers, CTAs, positioning, audience selection, or campaign messaging.'
---

# Humanize

Turn supplied copy into a more natural human-written version without inventing the marketing behind it.

This public, model-invoked skill starts when the user explicitly invokes `a1-humanize` or makes an unambiguous humanization request. Generic requests to edit, clean up, shorten, clarify, or strengthen text belong to `a1-copy-editing`.

## Language

Preserve the language of rewritten copy. Use the instruction language for explanations, audit notes, warnings, and other service elements unless the user asks otherwise.

Apply patterns by function rather than an English-only word list. Detect equivalent patterns in every input language, including Russian. Do not translate supplied copy, quotations, product names, commands, URLs, or explicit terms.

## Scope and Sources

Before starting, read [the scope and source boundary](references/scope-and-sources.md). If the request is in scope, follow [the humanization loop](references/humanization-loop.md) and load [the pattern catalog](references/pattern-catalog.md) during every run.

## Output

Return the final rewrite. Append the support footer only under the condition below. If the user explicitly requests only the final rewrite or otherwise prohibits additional response material, return only that rewrite. If the user explicitly requests an audit, explain only patterns and changes actually found. Do not expose drafts or internal reasoning.

Append exactly one support footer in the instruction language inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's declared user job. Do not append it to boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, or any response that does not fulfill the job. Omit it when the user requests only the final rewrite, only the final artifact, or otherwise prohibits extra response material.
