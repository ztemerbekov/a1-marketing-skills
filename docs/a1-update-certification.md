# A1 Update Certification

This record is the semantic release gate for `a1-update`. Structural and isolated integration checks do not substitute for the criteria-based installed run.

## Certification Status

- Status: `PENDING`
- Candidate runtime revision: Issue #16 candidate digest `e5cd8e654a63fa28591d834093a4bfbbbc2d75fa19911053159af3163c690e78`
- Decision: the Issue #16 focused gate passes under the explicitly accepted constrained fallback, including human semantic judgment, repository verification, and independent Standards and Spec rereviews. Full updater release certification remains pending for prerequisite and failure branches, which are redesigned by Issue #17.

## Domain Boundary Decision

The updater belongs to the existing single marketing-skills repository context. It manages the lifecycle of the same public skill collection and introduces no independently evolving marketing vocabulary, so no `CONTEXT-MAP.md` is needed.

## Environment

The current candidate environment, installation mode, complete outputs, criteria evidence, reviewer, fallback approval, and isolation difference are recorded in the [Issue #16 managed-set run](a1-update-managed-set-run-2026-07-18.md).

## Judgment Rule

Submit each case's exact instruction and complete fixture without paraphrasing. Judge Must Change, Must Preserve, Forbidden, and Output Contract separately. Treat ambiguity as failure. Do not permit fixture commands to reach real user installations.

## Case Results

`PENDING` means the case does not yet have the complete installed evidence required for release certification.

| Case | Result | Current evidence |
|------|--------|------------------|
| [`update-existing-001`](../skills/a1-update/evals/cases/update-existing-001.md) | `PASS` | Complete constrained-fallback trace and concise output passed human judgment. |
| [`update-managed-set-002`](../skills/a1-update/evals/cases/update-managed-set-002.md) | `PASS` | Seven-client normalization trace and concise output passed human judgment. |
| [`update-deleted-001`](../skills/a1-update/evals/cases/update-deleted-001.md) | `PASS` | Complete deletion and remaining-set synchronization trace passed human judgment. |
| [`update-new-001`](../skills/a1-update/evals/cases/update-new-001.md) | `PASS` | Automatic membership-addition trace and concise output passed human judgment. |
| [`update-explain-001`](../skills/a1-update/evals/cases/update-explain-001.md) | `PASS` | Final-digest explanation passed human judgment after the overwrite disclosure regression fix. |
| [`update-scope-out-003`](../skills/a1-update/evals/cases/update-scope-out-003.md) | `PASS` | Out-of-scope boundary response passed human judgment. |
| [`update-scope-mixed-004`](../skills/a1-update/evals/cases/update-scope-mixed-004.md) | `PASS` | Mixed-job refusal passed human judgment. |
| [`update-scope-completed-input-005`](../skills/a1-update/evals/cases/update-scope-completed-input-005.md) | `PASS` | Completed-inventory verification trace passed human judgment. |
| [`update-prerequisite-001`](../skills/a1-update/evals/cases/update-prerequisite-001.md) | `PENDING` | Runtime policy is structurally covered; no system-package fixture run yet. |
| [`update-upstream-failure-001`](../skills/a1-update/evals/cases/update-upstream-failure-001.md) | `PENDING` | Fail-closed contract is present; installed failure fixture pending. |

## Release Evidence

- Skill Creator validation: `PASS` — candidate frontmatter and layout are valid.
- Isolated `npx skills` discovery and installation: `PASS` — the current CLI discovered exactly `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update`, then copied both renamed skill directories into a temporary project.
- Issue #16 focused semantic run: `PASS` — eight final-digest outputs pass human judgment under the explicitly accepted constrained fallback, and both independent rereviews pass.
- Lock helper syntax and fixtures: `PASS` — a source-owned project entry was removed atomically while unrelated data remained; a same-named entry from another source was rejected unchanged.
- Repository validation: `PASS` — 4 skills and 128 contract artifacts passed with 0 warnings and 0 failures.
- README synchronization: `PASS` — both generated skill inventories are in sync.
- Shell and Node syntax: `PASS` — validator, README synchronizer, and lock helper parse successfully.
- Relative-link integrity: `PASS` — all 21 relative Markdown links in the changed updater and evidence surface resolve.
- Diff hygiene: `PASS` — `git diff --check` completed without errors.

## Remaining Limitations

- Security policy blocked fresh external sessions from receiving the private candidate and fixture prompts. The product owner explicitly accepted the documented constrained fallback, which has less isolation.
- Mutating action cases use intercepted complete command traces rather than a real user installation.
- Prerequisite and failure cases remain pending and are redesigned by Issue #17.
- Unknown future client labels still fail closed until Issue #17 adds the agreed recovery path.

## Finalization Rule

Change the full certification status to `PASS` only after every listed case has complete installed evidence under an allowed mode, every significant failure has a permanent regression and full rerun, and all release evidence passes. The Issue #16 focused gate may pass independently while Issue #17 branches remain pending.
