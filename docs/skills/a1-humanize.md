# A1 Humanize

**English** | [Русский](./a1-humanize.ru.md)

## What it does

A1 Humanize rewrites text that sounds AI-generated while keeping the writer's facts, meaning, and voice. Its runtime follows Humanizer 2.11.0: the same 35 patterns, examples, voice calibration, false-positive guard, and rewrite process.

The defining constraint is source fidelity. The rewrite must not invent facts, names, numbers, dates, quotations, or citations. It may change structure and rhythm, and it may add an opinion or reaction only when the text and writer's voice call for one.

## When to use it

Ask explicitly to humanize supplied prose or make it sound less AI-generated. The skill is model-invoked for an unambiguous humanization request and can also be invoked directly with `/a1-humanize`.

Use [A1 Copy Editing](./a1-copy-editing.md) when the main job is generic editing, shortening, clarification, restructuring, or review rather than removing AI-writing patterns.

## Input and file boundary

The skill uses text supplied in the conversation, current instructions, and an explicitly supplied writing sample. It does not read or overwrite project files and does not read Marketing Context. Paste the target text into the conversation.

A writing sample guides sentence length, word choice, punctuation, recurring phrases, transitions, and deliberate quirks. Its factual content does not transfer into the rewrite.

## What it returns

For pasted text, the default response contains a draft, a short list of patterns that still sounded AI-generated, and the final rewrite. A request for only the final rewrite suppresses the draft, audit, and support footer.

When another task invokes A1 Humanize as one embedded step, it returns only the rewritten text.

## Common questions

**Does one watched word or an em dash prove that text is AI-generated?**

No. The skill looks for clusters and context. It preserves deliberate repetition, real alternatives, useful disclaimers, quotations, proper names, unusual details, and other signs of a writer's actual choices.

**Can it match my own voice?**

Yes. Supply a sample of your writing with the target text. The sample's habits take priority over general style rules, including the usual rule against em and en dashes.

**Can it humanize a file in my project?**

Not by reading or overwriting the file. Paste the completed prose into the conversation.

## It's working if

- The rewrite removes real AI-writing patterns without flattening deliberate voice.
- Every source claim and qualification survives unless it was unsupported filler.
- No new fact, name, number, date, quotation, or citation appears.
- Legitimate caveats, objections, alternatives, and repeated openings stay intact.
- The output matches the requested mode.

## Where it fits

A1 Humanize is the AI-pattern removal skill in A1 Editorial. It is adapted from Humanizer by Siqi Chen with file mode removed for A1's source boundary; see the local [license and attribution](../../skills/a1-humanize/references/license-and-attribution.md).
