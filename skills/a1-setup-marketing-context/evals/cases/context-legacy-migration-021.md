# context-legacy-migration-021 — Legacy Migration Is Explicit and Lossless

- ID: `context-legacy-migration-021`
- Mode: `Auto-draft`
- Risk: Setup silently strands approved fallback content by creating a new canonical file or leaves two active contexts.
- Scope Scenario: `In scope`

## Setup

```text
The canonical file is absent. `.claude/marketing-context.md` is the only legacy context. No other authoritative product material exists.
```

## User Instruction

```text
Set up the marketing context for this repository.
```

## Input

```markdown
.claude/marketing-context.md:

# Marketing Context

<!-- owner: marketing -->

## Product
- Review Hub collects Ozon and Wildberries reviews in one list.

## Audience
- Marketplace managers.

## Launch Notes
- Preserve this custom section exactly.

Harness reply after the first response:
Yes. Migrate this complete file to the canonical path and remove the legacy source after the canonical write succeeds.
```

## Must Change

- [ ] Before authorization, make zero changes and ask one concrete question naming `.claude/marketing-context.md`, canonical migration, and source removal.
- [ ] After authorization, create `.agents/marketing-context.md`, add a self-describing semantics note that names the retained legacy headings, preserve the complete legacy content, and remove `.claude/marketing-context.md` only after the canonical write succeeds.

## Must Preserve

- [ ] Preserve both marketplace facts, audience, owner comment, custom Launch Notes, ordering, and formatting.
- [ ] End with exactly one public context in the repository and no fallback modification before removal.

## Forbidden

- [ ] Do not silently create a competing canonical file, discard or rephrase legacy values, leave two contexts, or infer new content.
- [ ] Do not write a fallback, global or private profile, last-used pointer, or `CONTEXT-MAP.md`.

## Output Contract

`First turn: one migration question and no write. Second turn: concise Created confirmation linking the canonical file and listing the migrated populated sections.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
