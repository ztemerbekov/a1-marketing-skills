# Information Style / Информационный стиль

This is an isolated deep-editing branch on top of the shared editor spine. Load it only after the explicit activation rule in [operations.md](operations.md) selects **Information Style**. Generic editing intent never enters this branch.

Information Style may reorganize existing material more deeply than standard editing. It does not expand the shared [source boundary](source-boundary.md), replace the normal output contract, or authorize strategy.

## Constraint Overrides / Приоритет ограничений

Explicit user constraints override every branch default. Apply all compatible constraints together.

- **Preserve voice / `сохрани мой голос`:** keep meaningful first person, humor, rhythm, characteristic wording, emotion, and firsthand experience. Remove only material that is empty and not protected by the constraint.
- **Preserve structure / `сохрани структуру`:** keep the existing blocks, headings, paragraph order, and sequence of ideas. Edit inside them; do not move, merge, split, add, or remove structural units unless the user separately permits it.
- **Preserve formatting / `не меняй форматирование`:** keep the supplied plain-text or Markdown shape, including headings, lists, emphasis, links, blockquotes, tables, code spans, and code fences. Edit wording inside that shape only.

A length or clarity request alongside explicit Information Style is an additional constraint, not a reason to switch back to a standard operation.

## Deep Editing Moves / Глубокая редактура

Within the source boundary and any overrides, this branch may:

- remove empty author-focused setup while preserving author details that carry fact, firsthand experience, voice, or trust;
- remove or soften unsupported evaluations, intensifiers, cliches, bureaucratic wording, repetition, and template transitions;
- move the useful point earlier and regroup existing material around it;
- when the source contains a self-contained actionable sequence and separate supporting firsthand context, put the actionable sequence before supporting personal context unless an explicit preserve-structure, preserve-formatting, or order instruction forbids reordering; keep protected firsthand facts after the sequence;
- split or combine paragraphs and sentences when the structure constraint allows;
- turn existing parallel material into headings or lists when the formatting constraint allows;
- neutralize author presence only when it adds no protected voice, fact, experience, or trust.

Do not apply a deep move merely to make the result look different. Every move must solve an observable problem in the supplied material.

## Markdown Integrity / Целостность Markdown

When Markdown improvement is allowed:

- create headings or lists only from distinctions and parallel items already present;
- preserve link text when it carries meaning and always preserve link targets exactly;
- preserve URLs, code spans, code fences, commands, formulas, equations, table values, and blockquote meaning without corruption;
- keep list nesting and code-fence boundaries valid;
- do not add a heading that implies a missing marketing block or new conclusion.

When formatting must be preserved, do not add, remove, reorder, or convert Markdown structures. The constraint override is stricter than the branch's permission to improve formatting.

## Source-Fidelity Extension / Дополнение к границе источников

Apply [source-boundary.md](source-boundary.md) without exception. Deeper reorganization is not permission to add or silently supply:

- definitions or explanations missing from the allowed sources;
- facts, conclusions, proof, claims, or examples from model knowledge;
- factual corrections based on what the model believes is true.

Neutralize an unsupported evaluation by removing it, making it appropriately cautious, or foregrounding source-supported material already present. Never replace it with invented proof.

Preserve facts, names, figures, links, formulas, equations, technical terms, and material qualifications. If a questionable claim cannot be improved safely, keep a cautious source-faithful version and mention the limitation when useful. Fact-checking remains a separate task.

## Completion Criterion

The branch is complete only when all applicable checks pass:

1. The operation was explicitly selected; no generic request was treated as Information Style.
2. Every deep move edits existing material and solves an observable source problem.
3. Voice, structure, formatting, and other explicit constraints are obeyed.
4. No definition, fact, conclusion, proof, claim, example, or correction came from model knowledge.
5. Protected literal tokens remain exact and the resulting Markdown syntax is valid; when formatting preservation is explicit, its structure remains exact as well.
6. The shared [final QA](final-qa.md) passes.

## Output / Формат результата

Use the single output contract in `../SKILL.md`. This branch does not change the response shape.
