# A1 Update Certification

This record is the semantic release gate for `a1-update`. Structural and isolated integration checks do not substitute for the criteria-based installed run.

## Certification Status

- Status: `PENDING`
- Candidate runtime revision: the candidate tree introduced by this change
- Decision: the renamed skill is structurally valid, installs through the current `skills` CLI, and passes an explicit non-mutating invocation smoke run. The complete installed semantic suite has not been run against the published `main`.

## Domain Boundary Decision

The updater belongs to the existing single marketing-skills repository context. It manages the lifecycle of the same public skill collection and introduces no independently evolving marketing vocabulary, so no `CONTEXT-MAP.md` is needed.

## Environment

- Client target: Codex CLI `0.144.5` through `skills` CLI `1.5.18`
- Run date: `2026-07-16`
- Installation: `a1-marketing-context` and `a1-update` were copied from the local candidate into an isolated temporary project with `npx skills@latest`; the installed directories matched the candidate directories.
- Semantic runner: fresh ephemeral Codex CLI session, model `gpt-5.6-sol`, read-only sandbox. The explicit `$a1-update` informational request completed without commands or file changes.
- Reviewer: automated implementation review only; human semantic review remains pending.

## Judgment Rule

Submit each case's exact instruction and complete fixture without paraphrasing. Judge Must Change, Must Preserve, Forbidden, and Output Contract separately. Treat ambiguity as failure. Do not permit fixture commands to reach real user installations.

## Case Results

`PENDING` means the case does not yet have the complete installed evidence required for release certification.

| Case | Result | Current evidence |
|------|--------|------------------|
| [`update-existing-001`](../skills/a1-update/evals/cases/update-existing-001.md) | `PENDING` | Criteria and source-scoped commands are structurally covered; installed fixture run pending. |
| [`update-deleted-001`](../skills/a1-update/evals/cases/update-deleted-001.md) | `PENDING` | Bundled lock-pruning helper passed isolated positive and source-rejection tests; full agent run pending. |
| [`update-new-001`](../skills/a1-update/evals/cases/update-new-001.md) | `PENDING` | Grouped confirmation contract is present; interactive installed run pending. |
| [`update-explain-001`](../skills/a1-update/evals/cases/update-explain-001.md) | `PENDING` | Fresh non-mutating forward-test satisfied the case after the overwrite-without-backup explanation was made explicit; human verdict pending. |
| [`update-prerequisite-001`](../skills/a1-update/evals/cases/update-prerequisite-001.md) | `PENDING` | Runtime policy is structurally covered; no system-package fixture run yet. |
| [`update-upstream-failure-001`](../skills/a1-update/evals/cases/update-upstream-failure-001.md) | `PENDING` | Fail-closed contract is present; installed failure fixture pending. |

## Release Evidence

- Skill Creator validation: `PASS` — candidate frontmatter and layout are valid.
- Isolated `npx skills` discovery and installation: `PASS` — the current CLI discovered exactly `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update`, then copied both renamed skill directories into a temporary project.
- Explicit renamed invocation: `PASS` — `$a1-update` entered informational mode, preserved the exact source boundary, explained refresh/deletion/new-skill behavior, and performed no mutation.
- Lock helper syntax and fixtures: `PASS` — a source-owned project entry was removed atomically while unrelated data remained; a same-named entry from another source was rejected unchanged.
- Repository validation: `PASS` — 4 skills, 60 contract artifacts, 0 warnings, 0 failures.
- README synchronization: `PASS` — both generated skill inventories are in sync.
- Shell and Node syntax: `PASS` — validator, README synchronizer, and lock helper parse successfully.
- Relative-link integrity: `PASS` — all relative links across 71 Markdown files resolve.
- Diff hygiene: `PASS` — `git diff --check` completed without errors.

## Remaining Limitations

- The renamed candidate cannot safely execute its real `main` update against itself until this change is published; the currently published repository still exposes the previous identifiers.
- The identifier change is intentionally breaking. Existing installations require the permanent manual transition documented in both READMEs; no alias or automatic migration is provided.
- Action cases can delete or overwrite installed skills by design, so they require an isolated fixture or explicit user authorization before a complete semantic run.
- The updater has explicit label mappings for Codex, Claude Code, Cursor, and Antigravity. An unknown client label fails closed instead of silently changing the client set.

## Finalization Rule

Change the status to `PASS` only after the exact published candidate is installed in an isolated supported client, all six cases have complete outputs and human criteria-based verdicts, every significant failure has a permanent regression and full rerun, and all release evidence passes. Any unresolved case failure makes the status `FAIL`.
