# A1 Editor Pilot Certification

This record is the semantic release gate for the A1 Editor pilot. It tracks criteria-based results without defining one preferred rewrite or using an automated LLM judge.

## Certification Status

- Status: `FAIL`
- Candidate runtime revision: `0da7a9fc548da0f1ea87f6aba27854dbde9d0874`
- Decision: the restarted suite found a human-confirmed significant failure in Information Style ordering: `editor-information-style-001` left personal context before the actionable list. The suite stopped; concurrent results for cases 002–004 are diagnostic only. Fix the runtime, install the new candidate, and restart all 25 cases from case one.

## Environment

Populate these values from the installed client used for the complete run. One environment must apply to every row below; if a case needs a different installation setup, record the difference in its notes.

- Client: `codex-cli 0.144.4`
- Model: `gpt-5.6-sol`
- Run date: `2026-07-15`
- Skill revision: `0da7a9fc548da0f1ea87f6aba27854dbde9d0874`
- Reviewer: `ztemerbekov`
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

## Case Results

`PENDING` means the case has not been run and has no semantic verdict.

| Case | Client | Model | Date | Result | Concise notes |
|------|--------|-------|------|--------|---------------|
| [`editor-strategy-route-001`](../skills/a1-editor/evals/cases/strategy-positioning-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified positioning as strategic, named differentiation and the product's main thought, recommended explicit chief invocation, and invented no positioning; human-confirmed final rerun. |
| [`editor-strategy-route-002`](../skills/a1-editor/evals/cases/strategy-offer-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified offer architecture as strategic, named tariff composition, price logic, and target action, recommended explicit chief invocation, and invented no offer; human-confirmed final rerun. |
| [`editor-strategy-route-003`](../skills/a1-editor/evals/cases/strategy-audience-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified audience selection as strategic, left segment and reader unchosen, recommended explicit chief invocation, and invented no audience; human-confirmed final rerun. |
| [`editor-strategy-route-004`](../skills/a1-editor/evals/cases/strategy-campaign-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified campaign concept and message system as strategic, supplied only an explicit chief command, and invented no campaign, channel, audience, or CTA; human-confirmed final rerun. |
| [`editor-strategy-route-005`](../skills/a1-editor/evals/cases/strategy-landing-structure-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified blank-page landing architecture and proof logic as strategic, recommended explicit chief invocation, and invented no blocks or order; human-confirmed final rerun. |
| [`editor-strategy-boundary-006`](../skills/a1-editor/evals/cases/ordinary-edit-stays-editor.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened immediately without optional context, preserved Friday, team, and action order, and did not route to chief; human-confirmed final rerun. |
| [`editor-strategy-boundary-007`](../skills/a1-editor/evals/cases/strategy-keyword-edit-stays-editor.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened the approved positioning while preserving both sources, the shared list, and team use; invented no new strategy and did not route to chief; human-confirmed final rerun. |
| [`editor-strategy-boundary-008`](../skills/a1-editor/evals/cases/mixed-edit-and-strategy-boundary.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Completed the separable edit, preserved all product facts, and routed only the unperformed positioning work to explicit chief invocation; human-confirmed final rerun. |
| [`editor-standard-001`](../skills/a1-editor/evals/cases/standard-edit-voice.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Removed the tautology while preserving the conversational first-person voice, Friday use, all three marketplaces, and one report; human-confirmed final rerun. |
| [`editor-shorten-001`](../skills/a1-editor/evals/cases/shorten.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Materially shortened the tariff copy while preserving price, the up-to-10 limit, Monday reports, and cancellation at any time without a manager call; human-confirmed final rerun. |
| [`editor-clarify-001`](../skills/a1-editor/evals/cases/clarify-weak-source.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Foregrounded questions visible in one window, removed empty evaluations, and invented no channel, integration, speed, analytics, audience, or business result; human-confirmed final rerun. |
| [`editor-strengthen-001`](../skills/a1-editor/evals/cases/strengthen-unsupported-claims.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Centered the supported one-list function, preserved uncertainty with `может помочь`, and removed unsupported leadership and sales-growth claims; human-confirmed final rerun. |
| [`editor-restructure-001`](../skills/a1-editor/evals/cases/restructure.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Grouped tariff, trial, delivery, and support conditions into a scannable order while preserving every number and export restriction; human-confirmed final rerun. |
| [`editor-ambiguity-001`](../skills/a1-editor/evals/cases/significant-ambiguity.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Asked one concise Basic-or-Pro blocking question, preserved both interpretations, and stopped before editing or assigning features; human-confirmed final rerun. |
| [`editor-information-style-001`](../skills/a1-editor/evals/cases/information-style-explicit.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `FAIL` | Removed the empty opening and created the required list, but left personal experience before it instead of moving the actionable sequence first; human-confirmed significant failure. |
| [`editor-information-style-002`](../skills/a1-editor/evals/cases/information-style-not-inferred.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Concurrent diagnostic output passed human review but cannot be carried past the runtime fix. |
| [`editor-information-style-003`](../skills/a1-editor/evals/cases/information-style-llm-post.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Concurrent diagnostic output passed human review but cannot be carried past the runtime fix. |
| [`editor-information-style-004`](../skills/a1-editor/evals/cases/information-style-preserve-voice.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Concurrent diagnostic output passed human review but cannot be carried past the runtime fix. |
| [`editor-information-style-005`](../skills/a1-editor/evals/cases/information-style-preserve-structure.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; no semantic verdict. |
| [`editor-information-style-006`](../skills/a1-editor/evals/cases/information-style-unsupported-claims.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; no semantic verdict. |
| [`editor-information-style-007`](../skills/a1-editor/evals/cases/information-style-markdown-integrity.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; no semantic verdict. |
| [`editor-information-style-008`](../skills/a1-editor/evals/cases/information-style-preserve-formatting.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; no semantic verdict. |
| [`chief-dependency-001`](../skills/a1-editor-in-chief/evals/cases/missing-editor-dependency.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; requires chief-only installation. |
| [`chief-explicit-002`](../skills/a1-editor-in-chief/evals/cases/explicit-chief-hard-gate.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; requires both installed skills. |
| [`chief-explicit-003`](../skills/a1-editor-in-chief/evals/cases/explicit-chief-handoff.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run; requires both installed skills. |

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
- The first two corrected regressions pass, but the restarted suite exposed a third significant failure in Information Style ordering.
- The active installed candidate is now known to fail and cannot be certified; a new revision must be installed after the runtime fix.
- Final-run evidence and results remain unknown for every row still marked `PENDING`; concurrent diagnostic passes after the failure do not count.
- No automated LLM judge is used; semantic judgment remains a human review responsibility.

## Finalization Rule

Change the status to `PASS` only when all 25 case rows contain real client, model, date, result, and concise evidence; every case passes the three criterion groups and the output-contract check; every significant failure has a permanent regression and a complete rerun; and every Release Evidence item passes. Any unresolved case failure makes the certification status `FAIL`, not a qualified pass.
