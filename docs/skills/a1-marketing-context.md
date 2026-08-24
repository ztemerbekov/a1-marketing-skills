# A1 Marketing Context

**English** | [Русский](./a1-marketing-context.ru.md)

Use A1 Marketing Context when you want future marketing work to reuse confirmed facts, decisions, and voice without rebuilding the same brief each time.

## The job

You have product facts, an audience definition, positioning, brand voice, approved messages, proof, vocabulary, examples, prohibitions, or business-goal defaults. You want one shared source that compatible skills can reuse.

The skill stores only confirmed information. It does not invent strategy, promote a hypothesis to fact, or infer marketing claims from source code, filenames, or passive repository context.

## When to use it

Make an explicit request such as “set up marketing context,” “remember our tone of voice,” or “update the audience.” A normal request starts Auto-draft. Ask for an interview only when you want guided questions one at a time.

Installing the skill, opening a repository, mentioning marketing, or discovering that context is missing never authorizes a write.

## What you get

The skill creates or updates only `.agents/marketing-context.md` in the current repository. It applies the smallest confirmed change, preserves unrelated content, and leaves unknown sections empty rather than completing them by inference.

Audience, voice, and business goals may work as overridable defaults. Product facts, claims and evidence, and explicit prohibitions are protected inputs that downstream work must preserve or surface as conflicts.

## Common questions

**Does installation create the file?**

No. A write occurs only after an explicit request to maintain reusable marketing context.

**What is the difference between Auto-draft and Interview?**

Auto-draft extracts confirmed material from the sources you identify. Interview asks one question at a time and saves only answers you confirm.

**Can it create positioning or strategy?**

No. It stores completed and approved inputs; it does not create, compare, test, or approve them.

**Does every A1 skill read the file?**

No. Each skill must explicitly support Marketing Context. Context consumption is optional and governed by that skill's own boundary.

## How to recognize success

- Every stored value is traceable to a confirmed source.
- Hypotheses and tentative ideas remain marked as such or stay out of the file.
- Only `.agents/marketing-context.md` is written.
- A targeted update preserves unrelated content.
- The confirmation names only the sections changed in that run.

## Related skills

[A1 Grill](./a1-grill.md) works through an open decision. [A1 Wayfinder](./a1-wayfinder.md) maps a large uncertain initiative. Marketing Context stores decisions and inputs only after they are confirmed.
