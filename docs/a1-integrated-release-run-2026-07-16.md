# A1 Integrated Release Run — 2026-07-16

This record is the semantic release gate for GitHub Issue #10. It certifies `a1-editor-in-chief` and `a1-setup-marketing-context` together with the required `a1-editor` dependency.

## Verdict

- Chief complete suite: `PASS` — human criteria review
- Marketing Context complete suite: `PASS` — human criteria review
- Integrated context-consumption cases: `PASS` — human criteria review
- Repository verification: `PASS`
- Human semantic judgment: `PASS`
- Final release verdict: `PASS — READY FOR USERS`

## Environment and Candidate

- Client: Codex desktop, current implementation task
- Model: GPT-5
- Run date: `2026-07-16`
- Repository base commit: `a2a3442` (`refactor: make marketing context setup incremental (#9)`)
- Certification revision: the Issue #10 commit containing this record; its hash is reported in the release handoff, while the exact pre-commit candidate content is pinned by the digests below.
- Candidate sources: `skills/a1-editor-in-chief/`, `skills/a1-setup-marketing-context/`, and required dependency `skills/a1-editor/`
- Chief directory digest: `0c7c69e6d55f9471a574ad27b057040cd17b9c3808c6302bad0f8acdf640966c`
- Marketing Context directory digest: `839d036ddbfcfe10805e9c4ed441d377ffa4cf62986e1308b48cdd7e54249d24`
- Editor directory digest: `6ab1b723d8816991fdc3f93741df0b818f35da9600fa2ade2327ff4f230e68d2`
- Combined candidate digest: `3339cb0814836dee59d27aa7d86fec0c27f4297a98cb49210b47fa3b7c09005f`
- Digest method: SHA-256 over every sorted repository-relative candidate path, a NUL separator, and that file's SHA-256
- Preliminary reviewer: Codex criteria review in the current task
- Human reviewer: `ztemerbekov`, confirmed `PASS` on `2026-07-16`
- Required semantic inventory: 15 Chief cases, 18 Marketing Context cases, and 2 Editor-owned context-consumption cases; 35 total.

## Installation Mode

The intended installation source is each canonical direct GitHub skill directory. Tenant policy prevents a fresh external clean-client installation from an unmerged candidate revision. The product owner, `ztemerbekov`, explicitly accepted the completion checklist's constrained fallback on `2026-07-16`.

Under that fallback:

- the exact three candidate directories above were loaded in the current supported client;
- temporary direct directory copies were used for self-contained runtime and relative-link checks;
- no global profile, last-used pointer, previous-project context, adapter implementation, or generated file was loaded as runtime authority;
- semantic execution has less process isolation than a fresh external client, and this remains a disclosed limitation;
- case `chief-dependency-001` intentionally removed Editor from its case harness; every other Chief case loaded the required Editor dependency.

Structural validation alone is not used as semantic evidence. Every exact instruction and input came from its linked case without paraphrasing. The complete current Chief outputs are recorded below. Marketing Context's runtime directory is byte-identical to the candidate already recorded in the complete Issue #9 run, so its exact outputs and write traces remain single-sourced there and are linked case by case below; every case was replayed against the same runtime content.

## Domain Boundary Reassessment

- Root `CONTEXT.md`: absent
- ADRs under `docs/adr/`: absent
- Decision: integrated certification stays inside the repository's existing single A1 marketing-skills domain.
- `CONTEXT-MAP.md`: not needed and not created.

## Chief Complete Suite

### [`chief-dependency-001`](../skills/a1-editor-in-chief/evals/cases/chief-dependency-001.md)

```text
Для продолжения нужен `a1-editor`, установленный рядом с `a1-editor-in-chief`. Установите зависимость и повторите запрос.
```

- Must change: `PASS` — the in-scope request reaches the dependency response before context or gate work.
- Must preserve: `PASS` — the source remains untouched and the response is Russian.
- Forbidden: `PASS` — no question, brief, diagnosis, edit, emulation, or deep link appears.
- Completion: `PASS` — the declared missing-dependency stop condition ends the spine.
- Output contract: `PASS` — concise dependency response only.

### [`chief-explicit-002`](../skills/a1-editor-in-chief/evals/cases/chief-explicit-002.md)

```text
Какой результат должен дать этот текст: объяснить функцию уже заинтересованному читателю или убедить нового читателя рассмотреть сервис?
```

- Must change: `PASS` — one decisive editorial fork is asked.
- Must preserve: `PASS` — source material remains unchanged and missing context is not ritualized.
- Forbidden: `PASS` — no questionnaire, operation question, summary, brief, or handoff appears.
- Completion: `PASS` — the adaptive gate stops at one blocking decision.
- Output contract: `PASS` — one concise question only.

### [`chief-explicit-003`](../skills/a1-editor-in-chief/evals/cases/chief-explicit-003.md)

```markdown
## Final Text

По пятницам в 16:00 менеджер открывает список отзывов из Ozon и Wildberries, сверяет даты и убирает дубли.

## What Changed

- Убраны вводная фраза и повторы.
- Сохранены время и порядок трёх действий.
```

- Must change: `PASS` — clarify is selected, delegated, and reviewed without another question.
- Must preserve: `PASS` — Friday, 16:00, both marketplaces, and action order remain.
- Forbidden: `PASS` — no process sections, caveat, or invented marketing content appears.
- Completion: `PASS` — all nine Chief stages complete with Editor owning the rewrite.
- Output contract: `PASS` — final text plus two concise change notes.

### [`chief-scope-mixed-004`](../skills/a1-editor-in-chief/evals/cases/chief-scope-mixed-004.md)

```text
Запрос смешивает редактуру с выбором сегмента, цены и GTM — это работа вне границы `a1-editor-in-chief`. Шеф-редактор может использовать готовые решения как исходный материал, но не создаёт их. Поэтому я не выполняю ни стратегическую, ни редакторскую часть этого смешанного запроса.
```

- Must change: `PASS` — segment, pricing, GTM, and editing are named and the whole mixed job is refused.
- Must preserve: `PASS` — completed decisions remain allowed future inputs.
- Forbidden: `PASS` — no dependency response, question, strategy, or partial edit appears.
- Completion: `PASS` — scope classification stops before dependency or context work.
- Output contract: `PASS` — concise full refusal.

### [`chief-scope-completed-input-005`](../skills/a1-editor-in-chief/evals/cases/chief-scope-completed-input-005.md)

```markdown
## Final Text

По пятницам менеджер открывает единый список отзывов из Ozon и Wildberries и проверяет новые отзывы.

## What Changed

- Утверждённое позиционирование вынесено в формулировку «единый список».
- Пятничный сценарий поставлен в начало без новых обещаний.
```

- Must change: `PASS` — completed strategy is accepted and used as source material.
- Must preserve: `PASS` — segment, positioning, marketplaces, one list, and Friday remain; price and GTM are untouched.
- Forbidden: `PASS` — no strategy, fact, proof, benefit, or CTA is created.
- Completion: `PASS` — bounded direction, Editor delegation, and review complete.
- Output contract: `PASS` — minimal reviewed output.

### [`chief-context-filled-006`](../skills/a1-editor-in-chief/evals/cases/chief-context-filled-006.md)

```markdown
## Final Text

Каждую пятницу команда:

1. Открывает отзывы из Ozon и Wildberries.
2. Сверяет даты.
3. Убирает дубли.

## What Changed

- Последовательность оформлена как практическая инструкция.
- Все три действия и обе площадки сохранены.
```

- Must change: `PASS` — confirmed repository context fills reader, goal, format, constraints, and voice without questions.
- Must preserve: `PASS` — Friday, both marketplaces, action order, practical voice, and knowledge-base shape remain.
- Forbidden: `PASS` — no ritual context question, claim, benefit, metric, or CTA appears.
- Completion: `PASS` — context satisfies the gate and the delegated flow completes.
- Output contract: `PASS` — final text and concise notes only.

### [`chief-context-incomplete-007`](../skills/a1-editor-in-chief/evals/cases/chief-context-incomplete-007.md)

```text
Какой результат должен дать email: только объяснить новым клиентам функцию единого списка или привести их к конкретному следующему действию?
```

- Must change: `PASS` — one material goal fork is named.
- Must preserve: `PASS` — reader, email channel, and supplied function remain known.
- Forbidden: `PASS` — no repeated field questions, inferred CTA, brief, edit, or partial output appears.
- Completion: `PASS` — the adaptive gate stops at one unresolved decision rather than treating partial context as invalid.
- Output contract: `PASS` — one decision question only.

### [`chief-operation-selection-008`](../skills/a1-editor-in-chief/evals/cases/chief-operation-selection-008.md)

```markdown
## Editor Brief

**Source material:** В пятницу менеджер сначала открывает список, который содержит отзывы Ozon и Wildberries, после чего им сверяются даты, и уже затем выполняется удаление дублей.
**Source precedence and conflicts:** Current instruction and text; no conflicts.
**Reader:** Менеджер, который использует внутреннюю инструкцию.
**Goal:** Сделать порядок действий понятным.
**Channel or format:** Внутренняя инструкция.
**Constraints:** Сохранить все факты и порядок действий.
**Confirmed message:** Пятничная проверка состоит из трёх последовательных действий.
**Editorial angle:** Прямая пошаговая инструкция.
**Argument hierarchy:** Открыть список → сверить даты → удалить дубли.
**Structure:** Одно короткое предложение с последовательными действиями.
**Voice:** Прямой и рабочий.
**Primary Editor operation:** clarify
**Allowed moves:** Упростить синтаксис и назвать действующего лица.
**Forbidden moves:** Добавлять или менять факты, claims и маркетинговую стратегию.
**Acceptance criteria:** 1) Сохранить пятницу, менеджера и обе площадки. 2) Сохранить три действия и их порядок. 3) Сделать субъект и последовательность однозначными.
**Requested output:** Final text plus concise change notes.

## Final Text

В пятницу менеджер открывает список отзывов из Ozon и Wildberries, сверяет даты и удаляет дубли.

## What Changed

- Убраны пассивные конструкции.
- Порядок действий сделан однозначным.
```

- Must change: `PASS` — Chief selects clarify and exposes the brief only because it was requested.
- Must preserve: `PASS` — every required fact and action survives.
- Forbidden: `PASS` — no operation question, internal Editor reference, or copied Editor rule appears.
- Completion: `PASS` — Chief creates the assignment and delegates execution without bypassing Editor.
- Output contract: `PASS` — requested brief plus reviewed output.

### [`chief-editorial-boundary-009`](../skills/a1-editor-in-chief/evals/cases/chief-editorial-boundary-009.md)

```text
Исследование рынка, выбор сегмента, позиционирования, цены и GTM находятся вне границы `a1-editor-in-chief`. Шеф-редактор может использовать готовые решения как исходный материал редакционной задачи, но не создаёт их.
```

- Must change: `PASS` — research, segment, positioning, price, and GTM are refused.
- Must preserve: `PASS` — the bounded Chief role and completed-input direction remain explicit.
- Forbidden: `PASS` — no dependency work, context read, question, hypothesis, or partial artifact appears.
- Completion: `PASS` — scope refusal ends before other stages.
- Output contract: `PASS` — concise refusal only.

### [`chief-source-conflict-010`](../skills/a1-editor-in-chief/evals/cases/chief-source-conflict-010.md)

```markdown
## Final Text

В пятницу в 16:00 менеджер открывает список отзывов из Ozon и Wildberries, сверяет даты и убирает дубли.

## What Changed

- Добавлено актуальное расписание из текущей задачи.
- Три действия собраны в ясную последовательность.

## Warnings

- В маркетинговом контексте осталось старое расписание — понедельник, 09:00. Для текста использована текущая инструкция: пятница, 16:00.
```

- Must change: `PASS` — the explicit current schedule overrides the ordinary stored decision.
- Must preserve: `PASS` — reader, goal, channel, marketplaces, and action order remain.
- Forbidden: `PASS` — the old schedule does not enter final copy and no source is silently merged.
- Completion: `PASS` — the resolved non-protected conflict proceeds with a material warning.
- Output contract: `PASS` — warning appears only because the ignored conflict matters.

### [`chief-corrective-review-011`](../skills/a1-editor-in-chief/evals/cases/chief-corrective-review-011.md)

Harness trace: Editor result one said `10 магазинов`; Chief rejected it for dropping the qualification, sent one corrective note with the unchanged brief, and Editor result two restored `до 10 магазинов`. Editor calls: `2`.

```markdown
## Final Text

Тариф Start стоит 1 900 рублей в месяц. Команда может подключить до 10 магазинов.

## What Changed

- Условие тарифа разделено на цену и лимит.
- Квалификация «до 10 магазинов» сохранена.
```

- Must change: `PASS` — one corrective Editor pass repairs the first draft.
- Must preserve: `PASS` — price, tariff, and qualified limit remain; Editor owns both text passes.
- Forbidden: `PASS` — no local Chief patch, third call, hidden failure, discount, trial, or CTA occurs.
- Completion: `PASS` — review completes after the one allowed corrective pass.
- Output contract: `PASS` — only the corrected reviewed result is delivered.

### [`chief-language-012`](../skills/a1-editor-in-chief/evals/cases/chief-language-012.md)

```markdown
## Final Text

Каждую пятницу менеджер открывает список отзывов из Ozon и Wildberries, сверяет даты и убирает дубли.

## What Changed

- Removed the stock introduction and repeated sequence markers.
- Preserved Friday, both marketplaces, and all three actions.
```

- Must change: `PASS` — shorten is selected, Russian copy is concise, and explanations are English.
- Must preserve: `PASS` — Friday, manager, marketplaces, and action order remain in Russian.
- Forbidden: `PASS` — no English copy, Russian explanation, process section, or non-material caveat appears.
- Completion: `PASS` — delegated execution and review preserve the two-language contract.
- Output contract: `PASS` — final copy plus two English change notes.

### [`chief-context-isolation-013`](../skills/a1-editor-in-chief/evals/cases/chief-context-isolation-013.md)

Harness context-discovery access trace (installed candidate runtime reads and direct harness messages are excluded):

```text
STAT /tmp/chief-isolation/current-repo/.agents/marketing-context.md -> absent
STAT /tmp/chief-isolation/current-repo/.claude/marketing-context.md -> absent
STAT /tmp/chief-isolation/current-repo/marketing-context.md -> absent
OUTSIDE-CURRENT-REPOSITORY CONTEXT ACCESSES -> 0
```

```markdown
## Final Text

По пятницам менеджер маркетплейса:

1. Открывает отзывы Ozon и Wildberries.
2. Сверяет даты.
3. Убирает дубли.

## What Changed

- Порядок действий оформлен как короткая внутренняя инструкция.
- Сохранены пятница, обе площадки и три действия.
```

- Must change: `PASS` — the complete current assignment proceeds without a context question.
- Must preserve: `PASS` — current reader, schedule, marketplaces, and action order remain.
- Forbidden: `PASS` — the context-discovery trace contains zero home, sentinel, global-profile, or previous-repository lookup; unrelated procurement data, Monday, Amazon, and prohibitions are not mentioned, warned about, or used.
- Completion: `PASS` — current-repository-only source resolution, Editor delegation, and review complete.
- Output contract: `PASS` — normal final output with no leaked context or warning.

### [`context-chief-default-override-019`](../skills/a1-editor-in-chief/evals/cases/context-chief-default-override-019.md)

```markdown
## Final Text

**Тема:** Отзывы Ozon и Wildberries в одном списке

Review Hub собирает отзывы Ozon и Wildberries в одном списке.

## What Changed

- Текст оформлен как короткий onboarding email для владельца агентства.
- Тон сделан прямым; продуктовый факт сохранён без новых обещаний.
```

- Must change: `PASS` — explicit task reader and voice override ordinary context defaults without a question.
- Must preserve: `PASS` — Ozon, Wildberries, one-list fact, and stored file remain unchanged.
- Forbidden: `PASS` — no default leakage, context-update request, false protected conflict, or claim appears.
- Completion: `PASS` — resolved defaults proceed through the full delegated workflow.
- Output contract: `PASS` — normal reviewed result.

### [`context-chief-protected-conflict-020`](../skills/a1-editor-in-chief/evals/cases/context-chief-protected-conflict-020.md)

```text
В текущем тексте заявлена поддержка Amazon, а защищённый маркетинговый контекст говорит «только Ozon и Wildberries» и запрещает заявлять Amazon. Какой продуктовый факт верен для этой задачи?
```

- Must change: `PASS` — both concrete protected values reach one decision question.
- Must preserve: `PASS` — context, editable text, reader, and format remain available and unchanged.
- Forbidden: `PASS` — no brief, delegation, rewrite, Amazon choice, context update, or second question appears.
- Completion: `PASS` — protected conflict stops safely at the adaptive gate.
- Output contract: `PASS` — one concise Russian question only.

## Marketing Context Complete Suite

The setup runtime directory is unchanged from commit `a2a3442`. Every exact case was replayed; outputs, write traces, criteria judgments, and output-contract judgments matched the already human-approved [complete Issue #9 run](a1-marketing-context-run-2026-07-16.md). The links below are the non-duplicated exact evidence. This integrated pass adds an explicit completion judgment for every case.

| Case | Result | Completion and output | Exact evidence |
|---|---|---|---|
| `context-natural-invocation-001` | `PASS` | Auto-draft safely writes and confirms the supported partial context; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-natural-invocation-001) |
| `context-passive-noop-002` | `PASS` | Passive events complete as a true no-op; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-passive-noop-002) |
| `context-direct-update-003` | `PASS` | Field-bounded merge writes only the requested update; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-direct-update-003) |
| `context-interview-explicit-004` | `PASS` | Explicit natural-language Interview stops after notice plus one question; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-interview-explicit-004) |
| `context-interview-limit-005` | `PASS` | Seven ordered save passes complete, then final confirmation with no eighth question; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-interview-limit-005) |
| `context-interview-stop-006` | `PASS` | Saved partial state survives the no-write stop pass; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-interview-stop-006) |
| `context-sparse-repo-007` | `PASS` | Sparse source resolution stops at one concrete question with no write; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-sparse-repo-007) |
| `context-partial-file-008` | `PASS` | One populated section is a valid completed partial context; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-partial-file-008) |
| `context-no-hypotheses-009` | `PASS` | Out-of-scope hypothesis work stops before inspection or writes; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-no-hypotheses-009) |
| `context-merge-preservation-010` | `PASS` | Safe merge preserves unrelated custom material and completes; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-merge-preservation-010) |
| `context-conflict-011` | `PASS` | Material conflict stops with zero writes and one concrete question; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-conflict-011) |
| `context-repository-isolation-012` | `PASS` | Only the current repository receives one canonical context; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-repository-isolation-012) |
| `context-protected-facts-013` | `PASS` | Default update preserves protected facts, evidence, and prohibition; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-protected-facts-013) |
| `context-output-shape-014` | `PASS` | Concise link plus changed sections completes without full-file noise; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-output-shape-014) |
| `context-language-015` | `PASS` | Stored content and explanation languages follow policy; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-language-015) |
| `context-mixed-hypothesis-016` | `PASS` | Mixed job is fully refused before partial context or hypothesis work; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-mixed-hypothesis-016) |
| `context-legacy-migration-021` | `PASS` | Explicit lossless migration leaves one self-describing canonical context; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-legacy-migration-021) |
| `context-interview-empty-stop-022` | `PASS` | Empty-session stop completes through the zero-write close path; output `PASS`. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-interview-empty-stop-022) |

## Editor Source-Boundary Integration

These consumer-owned cases were replayed with the exact current Editor candidate. Their complete outputs and criteria evidence remain in the Issue #9 record.

| Case | Result | Integrated guarantee | Exact evidence |
|---|---|---|---|
| [`context-editor-default-override-017`](../skills/a1-editor/evals/cases/context-editor-default-override-017.md) | `PASS` | Explicit task audience and voice override defaults without changing protected facts or stored context. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-editor-default-override-017) |
| [`context-editor-protected-conflict-018`](../skills/a1-editor/evals/cases/context-editor-protected-conflict-018.md) | `PASS` | Protected facts and prohibitions stop an unsafe edit at one conflict question. | [Run evidence](a1-marketing-context-run-2026-07-16.md#context-editor-protected-conflict-018) |

The Chief suite additionally proves that Chief verifies the Editor dependency, delegates both initial and corrective text execution, never deep-links or duplicates Editor canon, refuses mixed research/GTM work, and accepts completed strategy only as source material.

## Documentation Verification

- `README.md` and `README.ru.md` contain aligned natural setup, point-update, and explicit Interview examples.
- Both READMEs state repository isolation, passive no-write behavior, partial validity, and hypothesis exclusion.
- Both READMEs describe explicit Chief invocation and the research, segmentation, positioning, pricing, offer, GTM, and architecture boundary.
- Platform adapters remain pointers to canonical skills and do not redefine runtime behavior.

## Repository Evidence

- Temporary direct-copy installation and self-contained link check: `PASS` — all three copies were byte-identical to their sources and every internal relative link resolved under `/tmp/a1-integrated-install.r6PTnI`.
- `./scripts/validate-skills.sh`: `PASS` — 3 skills, 98 contract artifacts, 0 warnings, 0 failures.
- `node scripts/sync-readme-and-plugin.js`: `PASS` — everything is in sync.
- Shell syntax, Markdown links, diff hygiene: `PASS`.
- Standards review: `PASS` — independent final review reported no findings.
- Spec review: `PASS` — independent final review reported no findings.

## Remaining Limitations

- Tenant policy prevents the preferred fresh external client and direct GitHub installation of the unmerged candidate. The explicitly accepted constrained fallback provides complete semantic evidence but less process isolation.
- Case `chief-corrective-review-011` uses its declared deterministic two-response Editor harness rather than depending on a stochastic first-pass failure.
- Semantic evidence is model- and run-sensitive and applies only to the recorded digests.
- No known required case has an unresolved semantic failure.

## Finalization Rule

Set the final release verdict to `PASS — READY FOR USERS` only after repository verification, independent Standards and Spec reviews, and human criteria judgment all pass. Any unresolved required case changes the verdict to `FAIL`; incomplete evidence leaves it `PENDING`.
