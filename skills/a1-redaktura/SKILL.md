---
name: a1-redaktura
description: 'Russian-friendly command alias for a1-copy-editing. Use only when the user explicitly invokes a1-redaktura to edit or review existing marketing text.'
disable-model-invocation: true
---

# A1 Редактура

Route an explicit Russian-friendly command to the canonical
`a1-copy-editing` skill without duplicating its behavior.

This is a public, User-invoked alias. It does not own editing or review rules
and must not start from an inferred editing intent.

## Dependency

Verify that the sibling `../a1-copy-editing/SKILL.md` is available. Do not
inspect or copy its internal references.

If the dependency is missing, tell the user in the instruction language to
install `a1-copy-editing` alongside `a1-redaktura`, then stop without editing,
reviewing, or emulating the canonical skill.

## Handoff

Invoke `a1-copy-editing` through its public interface with the user's complete
current instruction and all supplied text, attachments, constraints, and
requested output conditions intact.

Do not summarize, reinterpret, or narrow the request before delegation. Do
not perform any editing, review, strategy classification, source resolution,
or output formatting inside this alias.

Return the canonical skill's result directly. Do not add an alias
acknowledgement, wrapper, explanation, or second support footer.

## Language

Preserve the user's instruction and source languages by passing them through
unchanged. Use the instruction language only for the missing-dependency
message.
