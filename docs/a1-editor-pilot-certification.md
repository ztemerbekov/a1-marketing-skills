# A1 Editor Pilot Certification

This record is the semantic release gate for the A1 Editor pilot. It tracks criteria-based results without defining one preferred rewrite. Any temporary LLM arbitration is explicitly identified below and remains subject to user override.

## Certification Status

- Status: `FAIL`
- Candidate runtime revision: `684a5411ed87942e2af2241d7b378cd36723df58`
- Decision: the LLM-arbitrated full rerun stopped at `editor-clarify-001`: the candidate broadened a weak source into the categorical capability `объединяет общение с клиентами`. The Clarify source boundary requires a runtime fix, permanent regression, new installation, and another complete rerun.

## Environment

Populate these values from the installed client used for the complete run. One environment must apply to every row below; if a case needs a different installation setup, record the difference in its notes.

- Client: `codex-cli 0.144.4`
- Model: `gpt-5.6-sol`
- Run date: `2026-07-15`
- Skill revision: `684a5411ed87942e2af2241d7b378cd36723df58`
- Reviewer: `ztemerbekov` for cases 001–004; separate `codex-cli 0.144.4` / `gpt-5.6-sol` LLM arbiter from case 005 while arbitration is enabled; user override available.
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

- Toggle: `LLM_ARBITER=ON` from `editor-strategy-route-005`; the user can disable it or override any verdict.
- Isolation: each verdict comes from a fresh ephemeral read-only `codex exec`, separate from the candidate run.
- Input: exact instruction, original input, candidate output, and all four criterion groups.
- Authority while enabled: the arbiter verdict is recorded unless the user overrides it; any uncertainty must produce `FAIL`.

## Case Results

`PENDING` means the case has not been run and has no semantic verdict.

| Case | Client | Model | Date | Result | Concise notes |
|------|--------|-------|------|--------|---------------|
| [`editor-strategy-route-001`](../skills/a1-editor/evals/cases/strategy-positioning-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified positioning and differentiation as strategic, recommended explicit chief invocation, and invented no positioning; human-confirmed `684a541` full rerun. |
| [`editor-strategy-route-002`](../skills/a1-editor/evals/cases/strategy-offer-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified tariff composition, price rationale, and CTA as strategic, recommended explicit chief invocation, and invented no offer; human-confirmed `684a541` full rerun. |
| [`editor-strategy-route-003`](../skills/a1-editor/evals/cases/strategy-audience-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Left audience and primary reader unchosen, noted insufficient evidence, and recommended explicit chief invocation; human-confirmed `684a541` full rerun. |
| [`editor-strategy-route-004`](../skills/a1-editor/evals/cases/strategy-campaign-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Identified campaign concept and message-system creation as strategic, recommended explicit chief invocation, and invented no campaign; human-confirmed `684a541` full rerun. |
| [`editor-strategy-route-005`](../skills/a1-editor/evals/cases/strategy-landing-structure-route.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Routed blank-page landing architecture to explicit chief invocation without inventing blocks or order; independent LLM-arbitrated `684a541` full rerun. |
| [`editor-strategy-boundary-006`](../skills/a1-editor/evals/cases/ordinary-edit-stays-editor.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened immediately without optional context or chief routing while preserving Friday, team, and action order; independent LLM-arbitrated `684a541` full rerun. |
| [`editor-strategy-boundary-007`](../skills/a1-editor/evals/cases/strategy-keyword-edit-stays-editor.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened the accepted positioning without inventing strategy or routing to chief; independent LLM-arbitrated `684a541` full rerun. |
| [`editor-strategy-boundary-008`](../skills/a1-editor/evals/cases/mixed-edit-and-strategy-boundary.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Completed the separable edit and routed only the unperformed positioning task to chief; independent LLM-arbitrated `684a541` full rerun. |
| [`editor-standard-001`](../skills/a1-editor/evals/cases/standard-edit-voice.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Removed the tautology while preserving first-person voice, Friday use, three marketplaces, and one report; independent LLM-arbitrated `684a541` full rerun. |
| [`editor-shorten-001`](../skills/a1-editor/evals/cases/shorten.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `PASS` | Shortened materially while preserving price, up-to-10 limit, weekly Monday reports, and cancellation terms; independent LLM-arbitrated `684a541` full rerun. |
| [`editor-clarify-001`](../skills/a1-editor/evals/cases/clarify-weak-source.md) | `codex-cli 0.144.4` | `gpt-5.6-sol` | `2026-07-15` | `FAIL` | Added the broader categorical capability `объединяет общение с клиентами` instead of limiting the rewrite to questions visible in one window; independent LLM-arbitrated significant failure. |
| [`editor-strengthen-001`](../skills/a1-editor/evals/cases/strengthen-unsupported-claims.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Concurrent diagnostic output received arbiter PASS but cannot be carried past the runtime fix. |
| [`editor-restructure-001`](../skills/a1-editor/evals/cases/restructure.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run on `684a541`; no semantic verdict. |
| [`editor-ambiguity-001`](../skills/a1-editor/evals/cases/significant-ambiguity.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run on `684a541`; no semantic verdict. |
| [`editor-information-style-001`](../skills/a1-editor/evals/cases/information-style-explicit.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Focused post-fix PASS retained only in run evidence; full rerun pending. |
| [`editor-information-style-002`](../skills/a1-editor/evals/cases/information-style-not-inferred.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run on `684a541`; no semantic verdict. |
| [`editor-information-style-003`](../skills/a1-editor/evals/cases/information-style-llm-post.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run on `684a541`; no semantic verdict. |
| [`editor-information-style-004`](../skills/a1-editor/evals/cases/information-style-preserve-voice.md) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | Not run on `684a541`; no semantic verdict. |
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
- The first three known regressions pass focused review, but the `684a541` full rerun exposed a fourth significant failure in Clarify source fidelity.
- The active `684a541` candidate is installed and verified but is known to fail and cannot be certified.
- Final-run evidence and results remain unknown for every row still marked `PENDING`; concurrent diagnostic passes do not count after the runtime changes.
- Temporary LLM arbitration is enabled from case 005 and is auditable but uses the same model family as the candidate runner; the user can override or disable it.

## Finalization Rule

Change the status to `PASS` only when all 25 case rows contain real client, model, date, result, and concise evidence; every case passes the three criterion groups and the output-contract check; every significant failure has a permanent regression and a complete rerun; and every Release Evidence item passes. Any unresolved case failure makes the certification status `FAIL`, not a qualified pass.
