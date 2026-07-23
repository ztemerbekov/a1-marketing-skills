---
name: a1-humanize
description: 'Remove recognizable AI-writing patterns from supplied copy while preserving its facts, meaning, language, and authorial voice. Use for explicit requests to humanize text or make it sound less AI-generated, including "очеловечь текст", "убери признаки AI", and "сделай менее AI-шным". Do not use for generic editing or for new marketing strategy, offers, CTAs, positioning, audience selection, or campaign messaging.'
---

# Humanize

Turn supplied copy into a more natural human-written version without inventing the marketing behind it.

This public, model-invoked skill starts when the user explicitly invokes `a1-humanize` or makes an unambiguous humanization request. Generic requests to edit, clean up, shorten, clarify, or strengthen text belong to `a1-editor`.

## Language

Preserve the language of rewritten copy. Use the instruction language for explanations, audit notes, warnings, and other service elements unless the user asks otherwise.

Apply patterns by function rather than an English-only word list. Detect equivalent patterns in every input language, including Russian. Do not translate supplied copy, quotations, product names, commands, URLs, or explicit terms.

## Scope and Sources

Before starting, read [the scope and source boundary](references/scope-and-sources.md). If the request is in scope, follow [the humanization loop](references/humanization-loop.md) and load [the pattern catalog](references/pattern-catalog.md) during every run. [The upstream notice](references/upstream.md) is provenance only.

## Output

Return only the final rewrite by default. If the user explicitly requests an audit, explain only patterns and changes actually found. Do not expose drafts or internal reasoning.
