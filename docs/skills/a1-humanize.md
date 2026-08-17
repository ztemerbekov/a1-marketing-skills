# A1 Humanize

**English** | [Русский](./a1-humanize.ru.md)

## What it does

A1 Humanize removes recognizable AI-writing patterns from supplied finished copy while preserving its facts, meaning, language, and authorial voice. It looks for patterns by function rather than relying on an English-only list of suspicious words.

Its 35-pattern catalog also catches repetitive sentence openings, casual announcements that merely introduce the next point, staged defenses against objections no one raised, and discarded alternatives left behind by the drafting process.

The defining constraint is transformation without invention. The skill can change rhythm, structure, transitions, vocabulary, and phrasing, but it cannot add marketing strategy, claims, proof, offers, calls to action, audiences, opinions, jokes, anecdotes, or emotions that are absent from the allowed source material.

## When to use it

Ask explicitly to humanize supplied copy or make it sound less AI-generated. The skill is model-invoked for an unambiguous humanization request and can also be invoked directly with `/a1-humanize`.

Use [A1 Copy Editing](./a1-copy-editing.md) for generic editing, shortening, clarification, restructuring, or review. Humanize is for finished copy whose recognizable AI patterns are the specific problem.

## Source boundary

The skill uses only the supplied target text, current explicit instructions, and an explicitly supplied personal voice sample. It does not read or overwrite project files and does not read Marketing Context.

A voice sample may guide rhythm, vocabulary, punctuation, paragraph openings, transitions, and deliberate quirks. It never supplies factual or marketing content.

## Common questions

**How is this different from ordinary copy editing?**

Copy editing improves clarity, structure, correctness, density, or persuasion within the sources. Humanize targets recognizable AI-writing patterns while preserving the finished copy's supported content and voice.

**Can it humanize a file in my project?**

Not by reading or overwriting the file itself. Supply the completed copy in the conversation and select it as the target.

**Can it add personality through jokes, anecdotes, or stronger opinions?**

Only when those elements already exist in the allowed material. Humanize may restore natural expression, but it cannot fabricate personality or marketing substance.

**Will it remove every disclaimer, objection, or rejected alternative?**

No. It preserves useful scope, safety and legal notices, named or fully engaged objections, and alternatives a reader could reasonably consider. It removes only defensive or discarded drafting material that adds no real content.

**What happens when the request also asks for a new offer or CTA?**

That is a mixed request. The skill stops before a partial rewrite because creating the missing marketing strategy is outside its job.

## It's working if

- Recognizable AI rhythm and phrasing are reduced without flattening distinctive voice.
- Repetitive openings, defenses against unraised objections, and discarded drafting alternatives are changed only when they do no useful rhetorical or factual work.
- Facts, names, numbers, qualifications, quotations, citations, links, and commands remain supported and intact.
- The rewritten copy keeps its original language unless translation was requested.
- No new marketing claim, proof, offer, audience, or CTA appears.
- A request for only the final rewrite returns only that rewrite.

## Where it fits

A1 Humanize is the AI-pattern removal skill in A1 Editorial. It is narrower than [A1 Copy Editing](./a1-copy-editing.md) and intentionally independent of [Marketing Context](./a1-marketing-context.md). It is adapted from Humanizer by Siqi Chen; see the local [license and attribution](../../skills/a1-humanize/references/license-and-attribution.md).
