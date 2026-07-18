# A1 Update Certification

This record is the semantic release gate for `a1-update`. Structural and isolated integration checks do not substitute for the criteria-based installed run.

## Certification Status

- Status: `PASS`
- Candidate runtime revision: Issue #17 candidate digest `34453ecf9e1caf195a2c4bafd3189549331b95621ef2a3a556c90b73378bc76f`
- Decision: the full updater certification passes. Issue #16 managed-set behavior and all Issue #17 recovery outputs pass human judgment under explicitly accepted constrained fallbacks; repository verification and both independent final reviews also pass.

## Domain Boundary Decision

The updater belongs to the existing single marketing-skills repository context. It manages the lifecycle of the same public skill collection and introduces no independently evolving marketing vocabulary, so no `CONTEXT-MAP.md` is needed.

## Environment

The managed-set evidence is recorded in the [Issue #16 run](a1-update-managed-set-run-2026-07-18.md). The current candidate environment, installation mode, complete recovery outputs, criteria evidence, human reviewer, and accepted isolation difference are recorded in the [Issue #17 run](a1-update-recovery-run-2026-07-18.md).

## Judgment Rule

Submit each case's exact instruction and complete fixture without paraphrasing. Judge Must Change, Must Preserve, Forbidden, and Output Contract separately. Treat ambiguity as failure. Do not permit fixture commands to reach real user installations.

## Case Results

Every case below has the complete installed or explicitly accepted constrained-fallback evidence required for release certification.

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
| [`update-preflight-failure-006`](../skills/a1-update/evals/cases/update-preflight-failure-006.md) | `PASS` | Complete all-scope preflight-failure trace and concise unchanged-state output passed human judgment. |
| [`update-unknown-client-recovery-007`](../skills/a1-update/evals/cases/update-unknown-client-recovery-007.md) | `PASS` | Automatic refresh, reload, restarted preflight, complete managed-set synchronization, and concise success output passed human judgment. |
| [`update-prerequisite-001`](../skills/a1-update/evals/cases/update-prerequisite-001.md) | `PASS` | Exact approval question, trusted runtime installation trace, and resumed update passed human judgment. |
| [`update-prerequisite-refusal-008`](../skills/a1-update/evals/cases/update-prerequisite-refusal-008.md) | `PASS` | Exact question, refusal, unchanged state, and concise output passed human judgment. |
| [`update-mid-write-failure-009`](../skills/a1-update/evals/cases/update-mid-write-failure-009.md) | `PASS` | Completed, uncertain, and pending operation trace plus partial-completion output passed human judgment. |
| [`update-first-write-failure-010`](../skills/a1-update/evals/cases/update-first-write-failure-010.md) | `PASS` | First-write uncertainty and partial-completion output passed human judgment. |
| [`update-upstream-failure-001`](../skills/a1-update/evals/cases/update-upstream-failure-001.md) | `PASS` | Fail-closed upstream trace and concise unchanged-state output passed human judgment. |
| [`update-unrelated-project-lock-011`](../skills/a1-update/evals/cases/update-unrelated-project-lock-011.md) | `PASS` | Unrelated project lock remained untouched and invisible in the concise success output. |
| [`update-bootstrap-failure-012`](../skills/a1-update/evals/cases/update-bootstrap-failure-012.md) | `PASS` | Failed automatic refresh stopped later work and produced the accepted partial-completion output. |
| [`update-reload-failure-013`](../skills/a1-update/evals/cases/update-reload-failure-013.md) | `PASS` | Failed refreshed-instruction reload stopped stale execution and produced the accepted partial-completion output. |
| [`update-restarted-preflight-failure-014`](../skills/a1-update/evals/cases/update-restarted-preflight-failure-014.md) | `PASS` | Restarted-preflight failure discarded stale state and produced the accepted partial-completion output. |
| [`update-still-unknown-client-015`](../skills/a1-update/evals/cases/update-still-unknown-client-015.md) | `PASS` | Still-unresolved mapping stopped without a loop, omission, or key question and produced the accepted partial-completion output. |

## Release Evidence

- Skill Creator validation: `PASS` — candidate frontmatter and layout are valid.
- Isolated `npx skills` discovery and installation: `PASS` — the current CLI discovered exactly `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update`, then copied both renamed skill directories into a temporary project.
- Issue #16 focused semantic run: `PASS` — eight final-digest outputs pass human judgment under the explicitly accepted constrained fallback, and both independent rereviews pass.
- Issue #17 focused semantic run: `PASS` — twelve final-digest outputs pass human judgment under the explicitly accepted constrained fallback, and both independent final rereviews pass.
- Lock helper syntax and fixtures: `PASS` — a source-owned project entry was removed atomically while unrelated data remained; a same-named entry from another source was rejected unchanged.
- Repository validation: `PASS` — 4 skills and 139 contract artifacts passed with 0 warnings and 0 failures.
- README synchronization: `PASS` — both generated skill inventories are in sync.
- Shell and Node syntax: `PASS` — validator, README synchronizer, and lock helper parse successfully.
- Relative-link integrity: `PASS` — all 78 relative Markdown links in the changed updater and evidence surface resolve.
- Diff hygiene: `PASS` — `git diff --check` completed without errors.

## Remaining Limitations

- Security policy blocked fresh external sessions from receiving the private candidate and fixture prompts. The product owner explicitly accepted the documented less-isolated constrained fallback for both Issue #16 and Issue #17.
- Mutating action cases use intercepted complete command traces rather than a real user installation.
- Prerequisite and failure cases use accepted intercepted fixture evidence rather than real user-system mutation.
- Automatic unknown-client recovery is fixture-intercepted; a future upstream updater copy is simulated rather than installed from a real later release.

## Finalization Rule

The full certification status is `PASS`: every listed case has complete installed or explicitly accepted constrained-fallback evidence, every significant failure has a permanent regression and full rerun, and all release evidence passes.
