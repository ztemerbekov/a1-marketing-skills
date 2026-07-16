# context-merge-preservation-010 — Auto-draft Preserves Unrelated Additions

- ID: `context-merge-preservation-010`
- Mode: `Auto-draft`
- Risk: Filling one missing value regenerates the file and destroys custom sections, comments, or wording.
- Scope Scenario: `In scope`

## Setup

```text
The canonical context and authoritative README below exist. Audience is missing from context.
```

## User Instruction

```text
Fill missing confirmed marketing context from the repository. Preserve everything we added manually.
```

## Input

```markdown
README.md: Approved audience: marketplace managers.

.agents/marketing-context.md:
# Marketing Context

Last updated: 2026-07-10

<!-- Owner: growth team. Keep this comment. -->

## Product Facts

- Collects Ozon and Wildberries reviews in one list.

## Launch Notes

- Pilot starts with five teams.

Custom footer: reviewed by Lena.
```

## Must Change

- [ ] Add only `Audience Defaults` with marketplace managers and update the date.

## Must Preserve

- [ ] Preserve the Product Facts wording, HTML comment, Launch Notes, custom footer, ordering, and formatting exactly.

## Forbidden

- [ ] Do not rephrase existing content, delete unfamiliar material, rename sections, or add positioning, voice, claims, goals, placeholders, or schema padding.
- [ ] Do not replace any existing value under an Auto-draft merge.

## Output Contract

`Updated` confirmation linking the file and listing only `Audience Defaults`.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
