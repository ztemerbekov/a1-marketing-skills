# A1 Update Certification

This record is the semantic release gate for `a1-update`. Structural and isolated integration checks do not substitute for the criteria-based installed run.

## Certification Status

- Status: `PENDING`
- Candidate runtime revision: Issue #17 candidate digest `34453ecf9e1caf195a2c4bafd3189549331b95621ef2a3a556c90b73378bc76f`
- Decision: the Issue #16 managed-set gate passes. Issue #17 recovery outputs have preliminary evidence on the exact current candidate and await explicit constrained-fallback acceptance, human semantic judgment, repository verification, and independent Standards and Spec reviews.

## Domain Boundary Decision

The updater belongs to the existing single marketing-skills repository context. It manages the lifecycle of the same public skill collection and introduces no independently evolving marketing vocabulary, so no `CONTEXT-MAP.md` is needed.

## Environment

The managed-set evidence is recorded in the [Issue #16 run](a1-update-managed-set-run-2026-07-18.md). The current candidate environment, installation mode, complete recovery outputs, criteria evidence, pending reviewer, and isolation difference are recorded in the [Issue #17 run](a1-update-recovery-run-2026-07-18.md).

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
| [`update-preflight-failure-006`](../skills/a1-update/evals/cases/update-preflight-failure-006.md) | `PENDING` | Issue #17 runtime contract is implemented; installed semantic evidence is pending. |
| [`update-unknown-client-recovery-007`](../skills/a1-update/evals/cases/update-unknown-client-recovery-007.md) | `PENDING` | Issue #17 recovery contract is implemented; installed semantic evidence is pending. |
| [`update-prerequisite-001`](../skills/a1-update/evals/cases/update-prerequisite-001.md) | `PENDING` | Runtime policy is structurally covered; no system-package fixture run yet. |
| [`update-prerequisite-refusal-008`](../skills/a1-update/evals/cases/update-prerequisite-refusal-008.md) | `PENDING` | Issue #17 refusal contract is implemented; installed semantic evidence is pending. |
| [`update-mid-write-failure-009`](../skills/a1-update/evals/cases/update-mid-write-failure-009.md) | `PENDING` | Issue #17 partial-completion contract is implemented; installed semantic evidence is pending. |
| [`update-first-write-failure-010`](../skills/a1-update/evals/cases/update-first-write-failure-010.md) | `PENDING` | Issue #17 first-write uncertainty contract is implemented; installed semantic evidence is pending. |
| [`update-upstream-failure-001`](../skills/a1-update/evals/cases/update-upstream-failure-001.md) | `PENDING` | Fail-closed contract is present; installed failure fixture pending. |
| [`update-unrelated-project-lock-011`](../skills/a1-update/evals/cases/update-unrelated-project-lock-011.md) | `PENDING` | Exact unrelated-project-lock isolation trace is recorded; human semantic judgment is pending. |
| [`update-bootstrap-failure-012`](../skills/a1-update/evals/cases/update-bootstrap-failure-012.md) | `PENDING` | Automatic updater-refresh failure trace is pending human semantic judgment. |
| [`update-reload-failure-013`](../skills/a1-update/evals/cases/update-reload-failure-013.md) | `PENDING` | Refreshed-instruction reload failure trace is pending human semantic judgment. |
| [`update-restarted-preflight-failure-014`](../skills/a1-update/evals/cases/update-restarted-preflight-failure-014.md) | `PENDING` | Restarted-preflight failure trace is pending human semantic judgment. |
| [`update-still-unknown-client-015`](../skills/a1-update/evals/cases/update-still-unknown-client-015.md) | `PENDING` | Still-unresolved client trace is pending human semantic judgment. |

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
- Prerequisite and failure cases have preliminary fixture evidence under Issue #17 and await the remaining semantic and repository gates.
- Automatic unknown-client recovery is fixture-intercepted; a future upstream updater copy is simulated rather than installed from a real later release.

## Finalization Rule

Change the full certification status to `PASS` only after every listed case has complete installed evidence under an allowed mode, every significant failure has a permanent regression and full rerun, and all release evidence passes. The Issue #16 focused gate may pass independently while Issue #17 branches remain pending.
