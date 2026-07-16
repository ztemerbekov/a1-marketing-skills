# A1 Scope Boundary Focused Run — 2026-07-16

This record checks the A1 Editor boundary changed by GitHub Issue #7. It does not replace the complete pilot certification tied to revision `fd10490204520b89e743d75d736eb8cb302a1c6e`.

## Verdict

- Focused semantic regressions: `PASS`
- Repository structure: `PASS`
- Semantic release gate: `PASS` — explicitly accepted constrained fallback with human criteria judgment

## Environment

- Client: Codex desktop, current implementation task
- Model: GPT-5
- Run date: `2026-07-16`
- Candidate source: current `skills/a1-editor/` worktree content
- Candidate directory digest: `02120432cf9cf1286c8ca8ac78b8313586e5eaf01e81f7498c2f640556dce27e`
- Isolation: exact candidate copied to `/tmp/codex-issue7-home/skills/a1-editor` and verified byte-for-byte with `diff -qr`
- Preliminary reviewer: Codex criteria review in the current task
- Human reviewer: `ztemerbekov`, all four focused cases confirmed `PASS` on `2026-07-16`
- Fallback approver: `ztemerbekov`, explicit product decision on `2026-07-16`
- Fallback mode: exact candidate instructions loaded in the current supported client after external clean-client execution was denied by tenant policy

Fresh `codex exec --ephemeral` runs were rejected before execution both before and after explicit user authorization because tenant policy forbids sending candidate files through local external authentication. The product owner then explicitly accepted the constrained fallback. The focused cases below use the exact candidate instructions loaded in the current task and record complete outputs and criteria evidence confirmed by the human reviewer; structural validation is reported separately and does not substitute for them.

## Domain Boundary Reassessment

- Root `CONTEXT.md`: absent
- ADRs under `docs/adr/`: absent
- Decision: the change remains inside the repository's existing single marketing-skills domain. Scope-boundary vocabulary governs the same A1 skill design context and does not introduce an independently evolving domain.
- `CONTEXT-MAP.md`: not needed and not created.

## Case Results

The exact **User Instruction** and **Input** from each linked canonical case were applied without paraphrasing.

### [`editor-strategy-boundary-006`](../skills/a1-editor/evals/cases/editor-strategy-boundary-006.md) — In scope

```markdown
## Сокращённая версия

Каждую пятницу команда открывает свежий отчёт, сверяет даты и убирает дубли.

## Что изменилось

- Убраны вводная фраза и повторы.
- Сохранены порядок действий и исходный смысл.
```

- Must change: `PASS` — the stock introduction and repeated sequence markers are gone.
- Must preserve: `PASS` — Friday, the team, the fresh report, date check, and duplicate removal remain in order.
- Forbidden: `PASS` — no strategy routing, invented context, benefit, tool, or CTA appears.
- Output contract: `PASS` — edited text and concise change notes are present.

### [`editor-strategy-route-001`](../skills/a1-editor/evals/cases/editor-strategy-route-001.md) — Out of scope

```markdown
A1 Editor редактирует существующий текст, но не выбирает позиционирование или отличие продукта от конкурентов. Явно запустите `a1-editor-in-chief` для стратегического процесса.
```

- Must change: `PASS` — the request is classified as positioning work and routed explicitly.
- Must preserve: `PASS` — the Ozon and Wildberries fact remains context rather than editable copy.
- Forbidden: `PASS` — no positioning, slogan, segment, chief-gate question, `Edited Version`, or `What Changed` is produced.
- Output contract: `PASS` — the concise strategy-boundary response stops after the explicit recommendation.

### [`editor-strategy-boundary-007`](../skills/a1-editor/evals/cases/editor-strategy-boundary-007.md) — Completed external input

```markdown
## Сокращённая версия

Мы позиционируем сервис как единое место, где команда видит отзывы из Ozon и Wildberries в одном списке.

## Что изменилось

- Убраны повторы «один» и «общий».
- Сохранено принятое позиционирование и все продуктовые факты.
```

- Must change: `PASS` — the supplied approved positioning is shortened instead of routed away.
- Must preserve: `PASS` — one place, the team, both marketplaces, and one list remain.
- Forbidden: `PASS` — no new differentiation, audience, offer, claim, or chief workflow appears.
- Output contract: `PASS` — edited text and two concrete change notes are present.

### [`editor-strategy-boundary-008`](../skills/a1-editor/evals/cases/editor-strategy-boundary-008.md) — Mixed job

```markdown
A1 Editor редактирует существующий текст, но не создаёт и не пересматривает позиционирование. Здесь запрос смешивает редактуру готового абзаца и разработку нового позиционирования, поэтому я не выполняю частичную редактуру. Явно запустите `a1-editor-in-chief` для стратегического процесса.
```

- Must change: `PASS` — the whole request is classified before the editor spine and both jobs are named.
- Must preserve: `PASS` — the source paragraph remains unused and the positioning decision remains unmade.
- Forbidden: `PASS` — there is no edited fragment, positioning, campaign concept, CTA, Editor Brief, or chief-gate question.
- Output contract: `PASS` — the response stops at the boundary and explicit invocation recommendation.

## Repository Evidence

- `bash -n scripts/validate-skills.sh`: `PASS`
- `./scripts/validate-skills.sh`: `PASS` — 3 skills, 45 contract artifacts, 0 warnings, 0 failures
- `git diff --check`: `PASS`
- Focused relative-link check: `PASS`

## Remaining Limitations

- A fresh clean-client run remains unavailable under tenant policy. The explicitly accepted constrained fallback makes that mode optional for Issue #7 but provides less isolation than an ephemeral installed run.
- The focused outputs received preliminary criteria review in the current Codex task and final human `PASS` confirmation from `ztemerbekov`.
- The complete 25-case A1 Editor certification remains historical evidence for revision `fd10490204520b89e743d75d736eb8cb302a1c6e`; this focused run covers only the four scope scenarios changed or reclassified by Issue #7.
