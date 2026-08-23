# Merge and Conflict Rules

Apply the smallest patch that satisfies the explicit request.

## Direct Field Update

When the user explicitly updates named fields, change only those fields and `Last updated`. A direct instruction such as `replace the audience with agencies` is authorization to replace that field and resolves the old-versus-new value for this write.

Do not opportunistically fill other sections during a direct field update.

## Auto-draft Merge

For a new file, write every confirmed value found within the selected source depth. For an existing file, add confirmed missing information without replacing or rephrasing existing content.

Preserve unrelated sections, custom headings, comments, ordering, formatting, examples, and user additions. Patch the affected section rather than regenerating the whole file. Do not delete an unfamiliar element merely because it is outside the canonical schema.

Update `Last updated` only when content is actually written.

## Material Conflict

A conflict is material when two allowed sources provide incompatible values for the same protected input, confirmed decision, or requested field and the current user instruction does not choose the winner.

On a material conflict:

1. make no file or directory change;
2. name the two concrete values and their sources;
3. ask one concrete question that selects the value to store;
4. stop.

Do not ask a generic `which is correct?` when the values can be named. Do not merge, average, preserve both as if compatible, or choose by source recency unless the user explicitly established that precedence.

## Legacy Migration

If `.agents/marketing-context.md` is absent and exactly one legacy path exists, do not strand or silently supersede its values. The eligible legacy path is `.claude/marketing-context.md` when present; otherwise it is root `marketing-context.md`.

- If the user has not explicitly authorized migration, make no change. Name the legacy path and ask one concrete question: whether to migrate its complete content into `.agents/marketing-context.md`, apply the requested patch, and remove the legacy source after the canonical write succeeds.
- After explicit authorization, preserve the complete legacy content, including custom headings, comments, ordering, and formatting. Add a self-describing schema semantics note when it is missing; name the legacy headings actually retained, rather than referring only to absent canonical headings. Apply only the requested or confirmed missing values, write the canonical file first, then remove the authorized legacy source. The only file written is `.agents/marketing-context.md`.
- If both legacy paths exist, do not let path precedence authorize a migration. Make no change and ask one concrete question naming both paths and the migration choice required. Do not read, merge, choose for migration, or delete either one without explicit direction. If migration would require choosing between incompatible values, use the same no-write question.

A migration is complete only when the canonical write succeeds and the explicitly authorized legacy source is removed, leaving one public marketing context in the repository. If the canonical file already exists, it is authoritative; do not import or mutate a leftover fallback during an unrelated update.

## Write Target

When the patch is safe, create `.agents/` if needed and write only `.agents/marketing-context.md` in the current repository. Never write a global file, another repository, a private variant, fallback context, profile pointer, or `CONTEXT-MAP.md`. A user-confirmed legacy migration may remove its repository-local source only after the canonical write succeeds; it must never modify that fallback in place.

An explicit request already authorizes the safe write; do not add a mandatory preview or confirmation step.

**Complete when:** the targeted patch is written with unrelated content preserved, the confirmed migration leaves one canonical context, or one material conflict or migration question has stopped the run with zero writes.
