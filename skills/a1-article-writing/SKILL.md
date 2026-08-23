---
name: a1-article-writing
description: Draft or structure a new article, guide, case study, or newsletter from a topic, supplied material, or verified research when the user wants new publishable long-form work rather than edits to a selected finished draft.
metadata:
  author: Zinnur Temerbekov
---

# Article Writing

Turn a topic or source material into credible, useful long-form work whose structure follows the reader's job and the available evidence.

## Entry Contract

Accept a request when every requested deliverable contributes to a new long-form article, guide, case study, expert essay, or newsletter issue. Valid inputs include a topic, brief, outline, notes, interview, transcript, source pack, completed research, or an earlier draft produced in the same article-writing session.

Select **Outline** when the user asks for a plan, structure, angle, or evidence brief without a full draft. Select **Draft** when the user asks to write, assemble, or complete the article.

Route these neighboring jobs elsewhere:

- editing or reviewing a user-selected finished draft belongs to `a1-copy-editing`;
- a promotional page belongs to `a1-promo-page`;
- a routine media announcement belongs to `a1-press-release`;
- an internal document organized around a decision belongs to `a1-decision-memo`.

For a mixed request, state the boundary and stop before producing either deliverable.

Marketing Context is optional. Read only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` when the canonical path is absent, then root `marketing-context.md` when both earlier paths are absent. Read no lower-priority context after selecting one. Continue without context when none exists.

## Runtime

Follow [the article-writing spine](references/article-writing-spine.md) for every accepted request. It is the single owner of stage order and reference routing.

Use adaptive depth. A short source-supported guide may need only a compact brief and draft; a research-heavy or narrative article needs a fuller source map and structure pass.

## Output

For **Outline**, return:

1. Editorial brief: reader, reader outcome, format, angle, and evidence basis.
2. Outline: informative section headings with one concise note about what each section must establish.
3. Evidence gaps: only when missing material affects credibility or completion.

For **Draft**, lead with the finished article. Add one to five editorial notes only when they help the user review the work, and list evidence gaps only for unresolved factual support, verification, or attribution.

If the user requests only the article, only the outline, or only the final artifact, return exactly that artifact without extra commentary.

Append exactly one support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills) only after a final user-facing result that fulfills this skill's job. Omit it for boundary responses, clarification prompts, unsuccessful results, or artifact-only requests.
