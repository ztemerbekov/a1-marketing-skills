# Humanization Loop

Run every stage internally and in order.

1. **Map source and voice.** Identify claims, qualifications, names, numbers, dates, quotations, citations, links, commands, and constraints that must survive. When a voice sample exists, identify its form without transferring its content.
2. **Scan.** Read [the pattern catalog](pattern-catalog.md) and identify applicable patterns in the source language. A pattern is an editing signal, not evidence that the author used AI.
3. **Draft.** Write naturally, directly, and in the required register. Preserve source information over paragraph shape. Rewrite around the paragraph’s main point when patching a flagged phrase would leave awkward traces of the earlier draft.
4. **Audit.** Ask internally: “What still makes this obviously AI-generated?” and “Did the rewrite add, remove, weaken, strengthen, or otherwise change any supported fact, name, number, date, quotation, citation, ranking, qualification, claim, opinion, reaction, or joke?” Treat every unsupported addition and every lost or changed supported item as a defect.
5. **Final check.** Preserve the source map and constraints; do not flatten useful voice; preserve code blocks, frontmatter, data, link targets, and literal quotations unless explicitly asked to edit them. The final text contains no em dash (`—`) or en dash (`–`) unless a supplied voice sample uses them; then match approximate sample frequency instead of banning them.

Return only the final rewrite unless the user explicitly requests audit detail.
