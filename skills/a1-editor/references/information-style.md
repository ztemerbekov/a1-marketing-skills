# Information Style / Информационный стиль

Use this operation only when the user explicitly requests information style. It is a deeper editorial rewrite than the standard editing mode, but it does not permit new facts or strategy.

The authoritative activation rule lives in [operations.md](operations.md). Load this file only after that router selects Information Style; do not infer activation inside this branch.

## Priority / Приоритет инструкций

Explicit user constraints override the operation defaults.

- `сохрани мой голос` means improve clarity without neutralizing the author's voice.
- `сохрани структуру` means edit inside the existing blocks without adding or moving sections.
- `не меняй форматирование` means preserve the supplied Markdown or plain-text shape.

## Allowed Moves / Что можно менять

- Replace a self-focused or emotional opening with the useful point already present in the source.
- Remove empty evaluations, introductions, intensifiers, cliches, bureaucratic wording, repetition, and template transitions.
- Put the main point earlier and regroup existing material around it.
- Split or combine paragraphs and sentences when this improves comprehension.
- Improve Markdown with headings, lists, emphasis, inline links, and code formatting.
- Neutralize author presence when it adds no fact, firsthand experience, or trust.
- Preserve meaningful personal experience and explicitly requested voice.

## Source-Fidelity Extension / Дополнение к границе источников

Apply the shared [source boundary](source-boundary.md) without exception. The deeper reorganization allowed by this branch is not permission to complete missing definitions, silently fact-check from model knowledge, or resolve a questionable claim with invented material.

If a questionable claim cannot be improved safely, keep a cautious source-faithful version and mention the limitation when useful. Fact-checking remains a separate task.

## Output / Формат результата

Use the single output contract in `../SKILL.md`. This branch does not change the response shape.
