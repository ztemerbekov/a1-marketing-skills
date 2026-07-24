---
name: a1-marketing-context
description: 'Create or incrementally update one public marketing context for the current repository from confirmed information. Use when the user explicitly asks to set up marketing context, remember a tone of voice, save approved product or audience facts, update positioning, or maintain reusable marketing inputs. Ordinary explicit requests use Auto-draft; an interview starts only when explicitly requested. Never write after installation, project opening, a generic marketing mention, or another skill finding no context, and never create or evaluate hypotheses.'
---

# Marketing Context

Create or update the current repository's shared marketing context from confirmed information without turning setup into strategy work.

This is a public, Model-invoked skill for explicit context-maintenance intent. Its one user job is to maintain `.agents/marketing-context.md` safely and incrementally.

## Invocation Contract

An ordinary explicit request such as `set up marketing context`, `remember our tone of voice`, or `update the audience` starts Auto-draft. Do not require the user to know the schema.

An interview is a separate, deliberate branch. Start it only when the user explicitly asks to be interviewed or to answer setup questions. Natural language is sufficient; do not depend on client-specific slash commands or command syntax.

Installation, opening a project, mentioning marketing, finding an existing context, or another skill reporting missing context is not write intent. In those situations, do not invoke this workflow, ask setup questions, create directories, or write files.

## Language

Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise.

## Runtime

Follow [the context spine](references/context-spine.md) in order. It is the single authority for stage order and completion criteria.

Load only the reference selected by the active stage. Evaluation cases are maintainer material and are never runtime dependencies.

## Storage Contract

Write only `.agents/marketing-context.md` inside the current repository. Create `.agents/` only after explicit write intent and only when a write will occur.

Do not create or maintain global state, last-used profiles, private variants, additional repository contexts, or `CONTEXT-MAP.md`. Do not write fallback context files.

## Output Contract

After a successful write, respond in this shape:

```markdown
Created [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- [section]
- [section]
```

Use `Updated` instead of `Created` for an existing file. List only sections changed in this run. Show the full file only when the user explicitly asks for it.

For an Interview session, the final stop or seven-question-limit confirmation may list all sections safely saved across that current session even when the final pass itself is a no-write pass. If the user stops before confirming any answer, use the zero-write close response from `references/interview.md` instead of linking a nonexistent file or listing sections.

Conflict responses and interview questions use the shorter response defined by the stage that stops the run.

After every successful final result, append exactly one support footer in the instruction language inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills). Omit it from interim and unsuccessful responses.
