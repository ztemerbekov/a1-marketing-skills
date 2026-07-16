# A1 Update Marketing Skills Certification

This record is the semantic release gate for `a1-update-marketing-skills`. Structural and isolated integration checks do not substitute for the criteria-based installed run.

## Certification Status

- Status: `PENDING`
- Candidate runtime revision: the candidate tree introduced by this change
- Decision: the skill is structurally valid and installs through the current `skills` CLI, but the complete installed semantic suite has not been run against the published `main`.

## Domain Boundary Decision

The updater belongs to the existing single marketing-skills repository context. It manages the lifecycle of the same public skill collection and introduces no independently evolving marketing vocabulary, so no `CONTEXT-MAP.md` is needed.

## Environment

- Client target: Codex through `skills` CLI `1.5.18`
- Run date: `2026-07-16`
- Installation: candidate directory installed into an isolated temporary global home with `npx skills@latest`; all runtime references, the lock helper, UI metadata, and eval files were present.
- Semantic runner: a fresh Codex sub-agent was used only for the non-mutating explanation case; its exact model identifier was not exposed.
- Reviewer: automated implementation review only; human semantic review remains pending.

## Judgment Rule

Submit each case's exact instruction and complete fixture without paraphrasing. Judge Must Change, Must Preserve, Forbidden, and Output Contract separately. Treat ambiguity as failure. Do not permit fixture commands to reach real user installations.

## Case Results

`PENDING` means the case does not yet have the complete installed evidence required for release certification.

| Case | Result | Current evidence |
|------|--------|------------------|
| [`update-existing-001`](../skills/a1-update-marketing-skills/evals/cases/update-existing-001.md) | `PENDING` | Criteria and source-scoped commands are structurally covered; installed fixture run pending. |
| [`update-deleted-001`](../skills/a1-update-marketing-skills/evals/cases/update-deleted-001.md) | `PENDING` | Bundled lock-pruning helper passed isolated positive and source-rejection tests; full agent run pending. |
| [`update-new-001`](../skills/a1-update-marketing-skills/evals/cases/update-new-001.md) | `PENDING` | Grouped confirmation contract is present; interactive installed run pending. |
| [`update-explain-001`](../skills/a1-update-marketing-skills/evals/cases/update-explain-001.md) | `PENDING` | Fresh non-mutating forward-test satisfied the case after the overwrite-without-backup explanation was made explicit; human verdict pending. |
| [`update-prerequisite-001`](../skills/a1-update-marketing-skills/evals/cases/update-prerequisite-001.md) | `PENDING` | Runtime policy is structurally covered; no system-package fixture run yet. |
| [`update-upstream-failure-001`](../skills/a1-update-marketing-skills/evals/cases/update-upstream-failure-001.md) | `PENDING` | Fail-closed contract is present; installed failure fixture pending. |

## Release Evidence

- Skill Creator validation: `PASS` — candidate frontmatter and layout are valid.
- Isolated `npx skills` discovery and installation: `PASS` — the current CLI discovered and installed the complete self-contained skill directory.
- Lock helper syntax and fixtures: `PASS` — a source-owned project entry was removed atomically while unrelated data remained; a same-named entry from another source was rejected unchanged.
- Repository validation: `PASS` — 4 skills, 59 contract artifacts, 0 warnings, 0 failures.
- README synchronization: `PASS` — both generated skill inventories are in sync.
- Shell and Node syntax: `PASS` — validator, README synchronizer, and lock helper parse successfully.
- Relative-link integrity: `PASS` — all relative links across 71 Markdown files resolve.
- Diff hygiene: `PASS` — `git diff --check` completed without errors.

## Remaining Limitations

- The candidate cannot safely execute its real `main` update against itself until this change is published to `main`; the currently published repository does not contain the updater and would correctly classify it as deleted upstream.
- Action cases can delete or overwrite installed skills by design, so they require an isolated fixture or explicit user authorization before a complete semantic run.
- The updater has explicit label mappings for Codex, Claude Code, Cursor, and Antigravity. An unknown client label fails closed instead of silently changing the client set.

## Finalization Rule

Change the status to `PASS` only after the exact published candidate is installed in an isolated supported client, all six cases have complete outputs and human criteria-based verdicts, every significant failure has a permanent regression and full rerun, and all release evidence passes. Any unresolved case failure makes the status `FAIL`.
