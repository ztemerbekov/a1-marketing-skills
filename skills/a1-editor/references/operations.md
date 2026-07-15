# Editor Operations

This is the authoritative operation router and behavior contract for `a1-editor`. Every operation obeys [source-boundary.md](source-boundary.md); operation choice never expands the allowed sources.

## Selection Order

Select by meaning, not rigid keyword matching:

1. Select **Information Style** only for an explicit activation listed below.
2. Otherwise select the most specific requested standard operation: **Shorten**, **Clarify**, **Strengthen**, or **Restructure**.
3. Select **Standard Edit** for generic requests to edit, clean up, rewrite, improve, or remove fluff.
4. Treat **Explain Edits** and **Variants** as output modifiers, not replacements for the primary operation.
5. When several compatible operations are requested, choose the dominant intent as primary and apply the others only where they do not conflict with explicit constraints.

If no specific intent dominates, use **Standard Edit**. Never ask the user to select an internal operation name.

## Standard Edit

Use for `edit`, `rewrite`, `clean up`, `improve`, `отредактируй`, `перепиши`, `почисти`, `убери воду`, and equivalent generic editing intent.

Improve clarity, flow, density, and correctness while preserving facts, qualifications, meaningful voice, structure that already works, and user constraints.

**Complete when:** the text is observably clearer or tighter, and no deeper change was made without a specific reason in the source or instruction.

## Shorten

Use for `shorten`, `make shorter`, `cut`, `сократи`, `сделай короче`, `убери лишнее`, and equivalent intent.

Remove repetition, empty setup, and wording that carries no meaning. Compress long constructions without dropping facts, proof, qualifications, product terms, or voice that does useful work.

**Complete when:** the result is materially shorter because expendable material was removed, not because meaning or constraints were lost.

## Clarify

Use for `clarify`, `make clearer`, `simplify`, `проясни`, `сделай понятнее`, `упрости`, and equivalent intent.

Move the main point earlier, untangle overloaded syntax, name known actors or objects, and simplify jargon when the allowed sources support the change. Preserve necessary technical terms and uncertainty.

**Complete when:** the same source-supported meaning requires less interpretation from the reader.

## Strengthen

Use for `strengthen`, `make persuasive`, `make it sell`, `усиль`, `сделай убедительнее`, `сделай продающе`, `докрути`, and equivalent intent.

Foreground existing reader value, proof, useful action, or supported feature-to-outcome connections. Replace unsupported evaluations with observable material already present or make them more cautious. Do not create missing persuasion assets.

**Complete when:** the existing case is easier to see and believe without a stronger claim than the sources support.

## Restructure

Use for `restructure`, `improve structure`, `make it flow`, `перестрой`, `улучши структуру`, `собери логичнее`, and equivalent intent.

Group related ideas, put context before conclusions when useful, move the strongest existing point earlier, and use headings or lists only to represent material already present. Respect explicit instructions to preserve order or formatting.

**Complete when:** the reader can follow the existing material more easily and no new marketing block or architecture has been introduced.

## Information Style

Select this branch only when the user explicitly asks for information style with wording such as:

- `в информационном стиле`;
- `в инфостиле`;
- `по Ильяхову`;
- `по «Пиши, сокращай»`;
- an equivalent unambiguous request in another language.

Generic requests such as `отредактируй`, `почисти`, `убери воду`, `сократи`, or `сделай понятнее` do not activate Information Style. Follow [information-style.md](information-style.md) only after explicit activation. Explicit constraints on voice, structure, and formatting override that branch's defaults.

**Complete when:** the dedicated information-style contract passes without exceeding the shared source boundary.

## Output Modifiers

### Explain Edits

Tie one to five concise explanations to changes actually made. Do not provide a line-by-line critique unless requested.

### Variants

Provide two or three variants only when requested. Label the meaningful difference and keep every variant inside the same source boundary.

## Conditional References

After selecting the operation, load detailed references only for defects that operation must address:

| Need in this source | Reference |
|---------------------|-----------|
| Main point, reader value, global order, or tone | [text-level.md](text-level.md) |
| Mixed paragraph topics, weak openings, sequence, or lists | [paragraph-level.md](paragraph-level.md) |
| Overload, hidden actors, word order, or hedging | [sentence-level.md](sentence-level.md) |
| Filler, jargon, intensifiers, vague words, or cliches | [word-level.md](word-level.md) |

Do not load all four level references by default. **Restructure** usually needs text and paragraph levels; **Clarify** usually needs sentence and paragraph levels; other operations select only the levels evidenced by the source.
