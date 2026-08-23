# A1 Marketing Context

**English** | [Русский](./a1-marketing-context.ru.md)

## What it does

A1 Marketing Context maintains confirmed reusable marketing inputs in `.agents/marketing-context.md`: product facts, audience, positioning, brand voice, messaging, proof, vocabulary, examples, prohibitions, and business-goal defaults.

The defining constraint is confirmation. The skill records authoritative inputs and approved decisions; it does not invent strategy, turn hypotheses into facts, or infer marketing claims from source code and filenames.

## When to use it

Use an explicit context-maintenance request such as “set up marketing context,” “remember our tone of voice,” or “update the audience.” An ordinary request starts Auto-draft. Ask for an interview only when you deliberately want guided questions one at a time.

The skill is model-invoked for matching explicit maintenance intent, but passive events do nothing. Installing the skill, opening a repository, mentioning marketing, or discovering a missing context file never authorizes a write.

## What it stores

The skill writes only `.agents/marketing-context.md` in the current repository. It applies the smallest confirmed patch, preserves unrelated content, and allows a partial file with only the sections that have real inputs.

Audience, voice, and business goals may act as overridable defaults. Product facts, claims and evidence, and explicit prohibitions are protected inputs that downstream work must preserve or surface as conflicts.

## Common questions

**Does installation create a context file?**

No. A file is created or updated only after an explicit request to maintain reusable marketing context.

**What is the difference between Auto-draft and Interview?**

Auto-draft is the default: it extracts confirmed material from the sources you identify. Interview is a separate explicit branch that asks one question at a time and saves confirmed progress incrementally.

**Can it create positioning or strategy for me?**

No. It can store completed, approved positioning or strategy inputs, but it does not create, compare, test, or evaluate them.

**Does every A1 skill automatically read Marketing Context?**

No. Each skill must explicitly permit context consumption. For example, [A1 Copy Editing](./a1-copy-editing.md) may use the first eligible repository context, while other skills may intentionally work only from the current request.

## It's working if

- Every stored value is traceable to a confirmed source.
- Tentative ideas and hypotheses stay out of the file.
- Only `.agents/marketing-context.md` is written.
- Existing unrelated content survives a targeted update.
- The confirmation names only the sections changed in the current run.

## Where it fits

A1 Marketing Context is the reusable-input skill in A1 Core. It prepares confirmed defaults and constraints for context-aware work; it does not replace [A1 Grill](./a1-grill.md), consumer research, campaign strategy, or copy production.
