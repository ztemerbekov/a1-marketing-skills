# A1 Update Certification

This record is the semantic release gate for `a1-update`. Structural and isolated integration checks do not substitute for the criteria-based installed run.

## Certification Status

- Status: `PENDING`
- Candidate runtime revision: Issue #16 candidate digest `6f74da570031300431cc1bec40d03dac93052b3a22efb8b87eaf4cf0c8eedef4`
- Decision: the Issue #16 managed-set success paths pass the explicitly accepted constrained semantic gate. Full updater release certification remains pending for prerequisite and failure branches, which are redesigned by Issue #17.

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
| [`update-existing-001`](../skills/a1-update/evals/cases/update-existing-001.md) | `PASS` | Complete constrained-fallback trace synchronizes the full collection in both active scopes without a question. |
| [`update-managed-set-002`](../skills/a1-update/evals/cases/update-managed-set-002.md) | `PASS` | Complete trace normalizes all four skills across the exact seven-client source-owned union and ignores global selection history. |
| [`update-deleted-001`](../skills/a1-update/evals/cases/update-deleted-001.md) | `PASS` | Complete deletion trace removes and prunes only the upstream-deleted source-owned entry in both active scopes. |
| [`update-new-001`](../skills/a1-update/evals/cases/update-new-001.md) | `PASS` | Both new skills install automatically into the existing managed client set and only their names reach the user. |
| [`update-explain-001`](../skills/a1-update/evals/cases/update-explain-001.md) | `PASS` | The final-digest rerun explains automatic membership and explicitly discloses overwrite without backup. |
| [`update-prerequisite-001`](../skills/a1-update/evals/cases/update-prerequisite-001.md) | `PENDING` | Runtime policy is structurally covered; no system-package fixture run yet. |
| [`update-upstream-failure-001`](../skills/a1-update/evals/cases/update-upstream-failure-001.md) | `PENDING` | Fail-closed contract is present; installed failure fixture pending. |

## Release Evidence

- Skill Creator validation: `PASS` — candidate frontmatter and layout are valid.
- Isolated `npx skills` discovery and installation: `PASS` — the current CLI discovered exactly `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update`, then copied both renamed skill directories into a temporary project.
- Issue #16 focused semantic run: `PASS` — five changed success-path cases pass on the exact candidate digest under the explicitly accepted constrained fallback.
- Lock helper syntax and fixtures: `PASS` — a source-owned project entry was removed atomically while unrelated data remained; a same-named entry from another source was rejected unchanged.
- Repository validation: `PENDING` — final Issue #16 run pending after review.
- README synchronization: `PASS` — both generated skill inventories are in sync.
- Shell and Node syntax: `PASS` — validator, README synchronizer, and lock helper parse successfully.
- Relative-link integrity: `PASS` — all relative links across 71 Markdown files resolve.
- Diff hygiene: `PASS` — `git diff --check` completed without errors.

## Remaining Limitations

- Security policy blocked fresh external sessions from receiving the private candidate and fixture prompts. The product owner explicitly accepted the documented constrained fallback, which has less isolation.
- Mutating action cases use intercepted complete command traces rather than a real user installation.
- Prerequisite and failure cases remain pending and are redesigned by Issue #17.
- Unknown future client labels still fail closed until Issue #17 adds the agreed recovery path.

## Finalization Rule

Change the full certification status to `PASS` only after every listed case has complete installed evidence under an allowed mode, every significant failure has a permanent regression and full rerun, and all release evidence passes. The Issue #16 focused gate may pass independently while Issue #17 branches remain pending.
