---
name: a1-editor-in-chief
description: 'Bounded chief-editor workflow for editorial direction, internal brief creation, A1 Editor delegation, and reviewed delivery. Use only when explicitly invoked.'
disable-model-invocation: true
metadata:
  version: "0.1.0"
---

# Editor in Chief

Turn a confirmed editorial assignment into a reviewed edit without becoming a general marketing strategist or rewriting the text yourself.

This is a public, User-invoked skill. Its one user job is to make bounded editorial-strategy decisions, create an internal Editor Brief, delegate text execution to `a1-editor`, review the result, and deliver the final answer.

## Invocation Contract

Run only after the user explicitly invokes `a1-editor-in-chief` by name or an equivalent deliberate chief-editor command. A strategic request, an inferred need for diagnosis, or another skill's recommendation is not an invocation.

Do not auto-start an interview. After explicit invocation, begin the invariant spine with scope classification.

## Language

Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise.

## Runtime

Follow [the chief spine](references/chief-spine.md) in order. It is the single authority for every stage, its order, and its completion criterion.

Load only the local reference selected by the active stage. Do not inspect or copy Editor's internal references: `a1-editor` owns text execution and its canon.

## Output Contract

By default, return:

```markdown
## Final Text

[reviewed text]

## What Changed

- [one to five concise editorial changes]

## Assumptions

- [only when material]

## Warnings

- [only when material or when review remains unresolved]
```

Omit `Assumptions` and `Warnings` when they are not material. Keep the Editor Brief internal unless the user explicitly asks to inspect it. Do not expose an input summary, diagnosis, handoff mechanics, review rubric, or `Chief Review` section by default.

Boundary refusals, missing-dependency responses, and blocking questions use the shorter response defined by the stage that stops the run.
