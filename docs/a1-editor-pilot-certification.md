# A1 Editor Pilot Certification

This record is the semantic release gate for the A1 Editor pilot. It tracks criteria-based results without defining one preferred rewrite. Any temporary LLM arbitration is explicitly identified below and remains subject to user override.

## Certification Status

- Status: `PASS`
- Candidate runtime revision: `fd10490204520b89e743d75d736eb8cb302a1c6e`
- Decision: all 25 cases produced real outputs on the recorded installed candidate and are recorded as `PASS`; cases 001–004 were human-reviewed, cases 005–012 used temporary LLM arbitration with one appeal, and cases 013–025 were pre-confirmed by the user before execution. Release checks remain the final commit gate.

## Environment

Populate these values from the installed client used for the complete run. One environment must apply to every row below; if a case needs a different installation setup, record the difference in its notes.

- Client: `codex-cli 0.144.4`
- Model: `gpt-5.6-sol`
- Run date: `2026-07-15`
- Skill revision: `fd10490204520b89e743d75d736eb8cb302a1c6e`
- Reviewer: `ztemerbekov` for cases 001–004 and pre-confirmed cases 013–025; separate `codex-cli 0.144.4` / `gpt-5.6-sol` LLM arbiter for cases 005–012, with one recorded appeal.
- Installation: candidate skill directories installed under `~/.codex/skills`; both directories verified byte-for-byte against the recorded revision before the run.

Complete outputs and human verdict evidence are stored in the [2026-07-15 run record](a1-editor-pilot-run-2026-07-15.md).

The installed skill must match the recorded revision. Run Editor cases with the current `a1-editor`; run chief cases with the setup declared in each case, including the missing-dependency setup where applicable.

## Judgment Rule

Submit each case's exact instruction and input without paraphrasing. Judge the complete output against the three canonical criterion groups, then verify the applicable output contract separately:

1. **Must change** — every required improvement is observable.
2. **Must preserve** — protected meaning, facts, voice, structure, and constraints survive.
3. **Forbidden** — no invention, unsupported claim, routing violation, or prohibited transformation appears.
**Output-contract check** — the response shape required by the selected skill and operation is present.

Do not compare against golden wording. Treat ambiguous evidence as failure. Record concise evidence for every group before assigning a case result.

## Temporary Arbitration Mode

- Toggle: `LLM_ARBITER=ON` for cases 005–012, then `OFF` before case 013 at the user's request.
- Isolation: each verdict comes from a fresh ephemeral read-only `codex exec`, separate from the candidate run.
- Input: exact instruction, original input, candidate output, and all four criterion groups.
- Authority while enabled: the arbiter verdict is recorded unless the user overrides it; any uncertainty must produce `FAIL`.
- Appeal: when the verdict rationale directly conflicts with a literal canonical criterion, a separate fresh session adjudicates only that conflict; the appeal and reason are recorded.

## Case Results

`PENDING` means the case has not been run and has no semantic verdict.

| Case | Client | Model | Date | Result | Concise notes |
|------|--------|-------|------|--------|---------------|
| [`editor-strategy-route-001`](../skills/a1-editor/evals/cases/editor-strategy-route-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Routed positioning and differentiation to explicit chief invocation without inventing strategy; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-route-002`](../skills/a1-editor/evals/cases/editor-strategy-route-002.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Left tariff composition, price logic, and CTA unchosen and routed offer creation to chief; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-route-003`](../skills/a1-editor/evals/cases/editor-strategy-route-003.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Left audience and primary reader unchosen and routed strategic selection to chief; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-route-004`](../skills/a1-editor/evals/cases/editor-strategy-route-004.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Routed campaign concept and message system to chief without inventing campaign elements; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-route-005`](../skills/a1-editor/evals/cases/editor-strategy-route-005.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Routed landing architecture to chief without inventing blocks or order; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-boundary-006`](../skills/a1-editor/evals/cases/editor-strategy-boundary-006.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened immediately without optional context or chief routing while preserving the action sequence; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-boundary-007`](../skills/a1-editor/evals/cases/editor-strategy-boundary-007.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened accepted positioning without inventing strategy or routing to chief; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strategy-boundary-008`](../skills/a1-editor/evals/cases/editor-strategy-boundary-008.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Completed the separable edit and routed only the unperformed positioning work; LLM-arbitrated `fd10490` full rerun. |
| [`editor-standard-001`](../skills/a1-editor/evals/cases/editor-standard-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Removed the tautology while preserving voice, Friday use, all marketplaces, and one report; LLM-arbitrated `fd10490` full rerun. |
| [`editor-shorten-001`](../skills/a1-editor/evals/cases/editor-shorten-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened materially while preserving price, up-to-10 limit, weekly Monday delivery, and cancellation terms; LLM-arbitrated `fd10490` full rerun. |
| [`editor-clarify-001`](../skills/a1-editor/evals/cases/editor-clarify-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Retained only the concrete one-window function and removed vague evaluations and process claims; LLM-arbitrated `fd10490` full rerun. |
| [`editor-strengthen-001`](../skills/a1-editor/evals/cases/editor-strengthen-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Centered the one-list function, preserved uncertainty with `может`, and removed unsupported superiority and sales growth; primary arbiter misread the hedge and a recorded appeal returned PASS. |
| [`editor-restructure-001`](../skills/a1-editor/evals/cases/editor-restructure-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Grouped tariff, trial, support, and report conditions without changing facts or numbers; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-ambiguity-001`](../skills/a1-editor/evals/cases/editor-ambiguity-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Asked one concise Basic-or-Pro blocking question and stopped before editing; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-001`](../skills/a1-editor/evals/cases/editor-information-style-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Put the three-step list before personal context while preserving the URL and manual-check fact; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-002`](../skills/a1-editor/evals/cases/editor-information-style-002.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Performed conservative standard editing, preserving paragraph order and prose sequence; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-003`](../skills/a1-editor/evals/cases/editor-information-style-003.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Produced scannable Markdown while preserving the URL, equation, technical material, and source boundary; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-004`](../skills/a1-editor/evals/cases/editor-information-style-004.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Preserved first person, the infinite-table joke, Friday ten-minute fact, and three checks; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-005`](../skills/a1-editor/evals/cases/editor-information-style-005.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Preserved the three headings, order, one-paragraph blocks, actions, and support limit; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-006`](../skills/a1-editor/evals/cases/editor-information-style-006.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Centered the one-list fact and replaced unsupported absolutes with cautious source-faithful wording; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-007`](../skills/a1-editor/evals/cases/editor-information-style-007.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Preserved the exact URL, formula, commands, code fence, blockquote, and action order in valid Markdown; user pre-confirmed `fd10490` full-rerun result. |
| [`editor-information-style-008`](../skills/a1-editor/evals/cases/editor-information-style-008.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Preserved every Markdown block, order, count, protected token, link, table value, and command; user pre-confirmed `fd10490` full-rerun result. |
| [`chief-dependency-001`](../skills/a1-editor-in-chief/evals/cases/chief-dependency-001.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Under verified chief-only setup, detected the missing editor, requested sibling installation, and stopped; user pre-confirmed result. |
| [`chief-explicit-002`](../skills/a1-editor-in-chief/evals/cases/chief-explicit-002.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | With both skills installed, summarized the assignment, collected the five required fields in three compact questions, and stopped; user pre-confirmed result. |
| [`chief-explicit-003`](../skills/a1-editor-in-chief/evals/cases/chief-explicit-003.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | With complete inputs, showed the brief, clarified the copy, preserved all constraints, and completed chief review; user pre-confirmed result. |

## Required Coverage

The final complete run must demonstrate:

- the one-shot standard path through standard, shorten, clarify, strengthen, restructure, and ambiguity cases;
- the isolated information-style path, including explicit activation and generic nonactivation;
- the source boundary through weak-source, unsupported-claim, strategy-routing, and Markdown-integrity cases;
- the explicit chief transition, dependency gate, hard gate, and handoff;
- user-constraint priority for voice, structure, and formatting.

## Failure Handling

A significant failure blocks certification. Fix the smallest runtime cause, add or strengthen a permanent criteria-based regression case, then restart the full suite from the recorded installed revision. Do not keep a partial pass after runtime behavior changes.

## Release Evidence

- Structural validation: `PASS` — 3 skills, 43 contract artifacts, 0 warnings, 0 failures.
- README and plugin synchronization: `PASS` — everything is already in sync.
- Shell syntax and diff hygiene: `PASS` — `bash -n scripts/validate-skills.sh` and `git diff --check` completed successfully.
- Relative-link integrity: `PASS` — all checked repository Markdown links resolve.

## Remaining Limitations

- The first installed run stopped after two significant failures; its evidence is historical and does not count toward the final verdict.
- Temporary LLM arbitration covered only cases 005–012 and used the same model family as the candidate runner; one literal-criterion conflict required a recorded appeal.
- Cases 013–025 were pre-confirmed by the user before their outputs were generated, so they do not have post-run semantic review; their complete outputs and setup evidence remain auditable in the run record.
- Semantic evaluation is model- and run-sensitive; this certification records `codex-cli 0.144.4`, `gpt-5.6-sol`, `fd10490`, and `2026-07-15`, not a guarantee for future clients or models.

## Finalization Rule

Change the status to `PASS` only when all 25 case rows contain real client, model, date, result, and concise evidence; every case passes the three criterion groups and the output-contract check; every significant failure has a permanent regression and a complete rerun; and every Release Evidence item passes. Any unresolved case failure makes the certification status `FAIL`, not a qualified pass.
