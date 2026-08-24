# A1 Humanize

**English** | [Русский](./a1-humanize.ru.md)

Use A1 Humanize when you want supplied prose to sound like its writer rather than a chatbot, without losing facts, meaning, or deliberate voice.

## The job

You have finished text with inflated claims, vague sources, repetitive structure, stock AI phrasing, filler, or chatbot residue. You want those patterns removed while the writer's real choices remain visible.

The skill looks for clusters of specific patterns rather than declaring a text “AI-written” because of one word or punctuation mark. It never invents a fact, name, number, date, quotation, or citation.

## When to use it

Paste the target text into the conversation and ask to humanize it or make it sound less AI-generated. You may also provide a sample of the writer's own prose. The skill can start from an unambiguous request or through `/a1-humanize`.

Use [A1 Copy Editing](./a1-copy-editing.md) when the main job is ordinary editing, shortening, clarification, restructuring, or review. Humanize does not read or overwrite project files and does not read Marketing Context.

## What you get

By default, the response contains a working rewrite, a short audit of patterns that still needed attention, and the final version. Ask for only the final rewrite when you do not need the audit.

A supplied writing sample guides sentence length, vocabulary, punctuation, recurring phrases, transitions, and deliberate quirks. Facts from the sample do not transfer into the target text.

## Common questions

**Does one watched word or an em dash prove AI authorship?**

No. The skill looks for several patterns in context and guards against false positives.

**Can it match my voice?**

Yes. Supply a representative writing sample together with the target text. The sample's habits take priority over general style defaults.

**Can it humanize a file in my project?**

Not by reading or overwriting it. Paste the completed prose into the conversation.

## How to recognize success

- Formulaic AI patterns disappear without flattening the writer's voice.
- Every supported claim and qualification survives.
- No new factual detail or citation appears.
- Genuine asides, uncertainty, useful objections, and deliberate repetition remain when they belong.
- The returned form matches the requested mode.

## Research and attribution

The pattern catalog is based on Wikipedia's [“Signs of AI writing”](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup. A1 Humanize is adapted from Humanizer by Siqi Chen; see the local [license and attribution](../../skills/a1-humanize/references/license-and-attribution.md).

## Related skills

[A1 Copy Editing](./a1-copy-editing.md) is the broader editing and review skill. Humanize has the narrower job of removing recognizable AI-writing patterns from supplied prose.
