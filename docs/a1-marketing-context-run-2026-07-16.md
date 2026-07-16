# A1 Marketing Context Incremental Workflow Run — 2026-07-16

This record is the semantic release gate for the safe incremental context workflow implemented in GitHub Issue #9.

## Verdict

- Focused semantic regressions: `PASS` — human criteria review
- Repository verification: `PASS`
- Semantic release gate: `PASS`

## Environment

- Client: Codex desktop, current implementation task
- Model: GPT-5
- Run date: `2026-07-16`
- Candidate source: current `skills/a1-setup-marketing-context/`, `skills/a1-editor/`, and `skills/a1-editor-in-chief/`
- Combined candidate directory digest: `097ba2356f52b84a47ade45e5e511112e45ae6695f8936696dead96d2a14b2cc`
- Digest method: SHA-256 over every sorted repository-relative path in all three candidate directories, a NUL separator, and that file's SHA-256.
- Fallback mode: exact candidate skill set loaded in the current supported client because tenant policy blocks external clean-client execution
- Fallback approver: `ztemerbekov`, explicit product decision on `2026-07-16`
- Preliminary reviewer: Codex criteria review in the current task
- Human reviewer: `ztemerbekov`, confirmed `PASS` on `2026-07-16`

The exact **User Instruction**, **Input**, setup, and multi-turn harness from every linked case were applied without paraphrasing. Every simulated repository write and complete user-facing output is recorded below. Structural checks are separate and do not substitute for semantic evidence.

## Domain Boundary Reassessment

- Root `CONTEXT.md`: absent
- ADRs under `docs/adr/`: absent
- Decision: the refactor remains inside the existing single marketing-skills domain and sharpens the existing shared marketing-context vocabulary.
- `CONTEXT-MAP.md`: not needed and not created.

## Case Results

### [`context-natural-invocation-001`](../skills/a1-setup-marketing-context/evals/cases/context-natural-invocation-001.md)

Write: created `.agents/marketing-context.md` with the fixed schema note and these populated sections only:

```markdown
## Product Facts

- Review Hub collects Ozon and Wildberries reviews in one list.

## Audience Defaults

- Marketplace managers.

## Brand Voice Defaults

- Practical and direct.
```

Complete output:

```markdown
Created [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Product Facts
- Audience Defaults
- Brand Voice Defaults
```

- Must change: `PASS` — natural explicit intent selected Auto-draft and wrote only three supported sections without preview or questions.
- Must preserve: `PASS` — both marketplaces, function, audience, voice, and default/protected semantics remain.
- Forbidden: `PASS` — no invented field, placeholder, or mode choice appears.
- Output contract: `PASS` — concise creation link and changed sections only.

### [`context-passive-noop-002`](../skills/a1-setup-marketing-context/evals/cases/context-passive-noop-002.md)

Write trace: no `.agents/` directory or context file was created during installation, project opening, the marketing mention, or Editor's optional-context observation.

Complete context-skill output: `<no invocation and no output>`

- Must change: `PASS` — every passive event remained outside invocation.
- Must preserve: `PASS` — repository state stayed unchanged and the separate editing job remained unblocked.
- Forbidden: `PASS` — no context, profile, map, offer, question, or confirmation appeared.
- Output contract: `PASS` — true no-op.

### [`context-direct-update-003`](../skills/a1-setup-marketing-context/evals/cases/context-direct-update-003.md)

Write: changed `Last updated` to `2026-07-16` and replaced only the existing audience bullet with `Руководители команд маркетплейсов.` Product Facts, the HTML comment, Launch Notes, ordering, and formatting were byte-preserved.

```markdown
Обновлён [`.agents/marketing-context.md`](.agents/marketing-context.md).

Изменено:
- Audience Defaults
```

- Must change: `PASS` — only the explicitly named field and date changed.
- Must preserve: `PASS` — all unrelated manual content survived.
- Forbidden: `PASS` — no repository fill, rename, rewrite, or preview occurred.
- Output contract: `PASS` — one changed-section bullet.

### [`context-interview-explicit-004`](../skills/a1-setup-marketing-context/evals/cases/context-interview-explicit-004.md)

Write trace: no file was created before a confirmed answer.

```text
Я буду задавать вопросы по одному и сохранять каждый подтверждённый ответ. Можно остановиться в любой момент и сохранить уже собранный частичный контекст.

Какой первый подтверждённый факт о продукте нужно записать?
```

- Must change: `PASS` — natural language selected Interview; notice preceded one question.
- Must preserve: `PASS` — Russian response and zero pre-answer writes.
- Forbidden: `PASS` — no command requirement, batch, schema dump, Auto-draft, or proposed answer.
- Output contract: `PASS` — notice plus one question.

### [`context-interview-limit-005`](../skills/a1-setup-marketing-context/evals/cases/context-interview-limit-005.md)

Assistant turn 1, before any write:

```text
Questions will come one at a time. I will save each confirmed answer before asking the next question. You can stop at any point and keep a valid partial context.

What confirmed product fact should I record?
```

After Answer 1, write: created the canonical file with the self-describing note and `Product Facts` only. Assistant turn 2:

```markdown
Saved Product Facts in [`.agents/marketing-context.md`](.agents/marketing-context.md).

What audience has been approved?
```

After Answer 2, write: added `Audience Defaults`; Product Facts remained unchanged. Assistant turn 3:

```markdown
Saved Audience Defaults in [`.agents/marketing-context.md`](.agents/marketing-context.md).

Has positioning already been approved? If yes, what exact wording should I record?
```

After Answer 3, write: added `Positioning`; earlier sections remained unchanged. Assistant turn 4:

```markdown
Saved Positioning in [`.agents/marketing-context.md`](.agents/marketing-context.md).

What brand voice has been approved?
```

After Answer 4, write: added `Brand Voice Defaults`; earlier sections remained unchanged. Assistant turn 5:

```markdown
Saved Brand Voice Defaults in [`.agents/marketing-context.md`](.agents/marketing-context.md).

What claim and supporting evidence have been approved?
```

After Answer 5, write: added `Claims and Evidence` with the qualification `up to 1,200`; earlier sections remained unchanged. Assistant turn 6:

```markdown
Saved Claims and Evidence in [`.agents/marketing-context.md`](.agents/marketing-context.md).

What approved vocabulary or explicit prohibition should I record?
```

After Answer 6, write: added `Explicit Prohibitions` with `never claim Amazon support`; earlier sections remained unchanged. Assistant turn 7:

```markdown
Saved Explicit Prohibitions in [`.agents/marketing-context.md`](.agents/marketing-context.md).

What current business goal should be the default?
```

After Answer 7, write: added `Business Goal Defaults`; all six earlier sections remained unchanged. No eighth question appeared. Complete assistant turn 8:

```markdown
Updated [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Product Facts
- Audience Defaults
- Positioning
- Brand Voice Defaults
- Claims and Evidence
- Explicit Prohibitions
- Business Goal Defaults
```

- Must change: `PASS` — seven one-at-a-time questions, seven incremental saves, then stop.
- Must preserve: `PASS` — all confirmed qualifications and semantics survived.
- Forbidden: `PASS` — no eighth question, batching, proposal, extra section, or lost seventh answer.
- Output contract: `PASS` — final confirmation and no further question.

### [`context-interview-stop-006`](../skills/a1-setup-marketing-context/evals/cases/context-interview-stop-006.md)

Assistant turn 1, before any write:

```text
Я буду задавать вопросы по одному и сохранять каждый подтверждённый ответ перед следующим вопросом. Можно остановиться в любой момент и сохранить валидный частичный контекст.

Какой первый подтверждённый факт о продукте нужно записать?
```

After Answer 1, write: created the canonical file with `Product Facts` only. Assistant turn 2:

```markdown
Сохранён раздел Product Facts в [`.agents/marketing-context.md`](.agents/marketing-context.md).

Какая аудитория утверждена?
```

After Answer 2, write: added `Audience Defaults` and preserved Product Facts. Assistant turn 3:

```markdown
Сохранён раздел Audience Defaults в [`.agents/marketing-context.md`](.agents/marketing-context.md).

Утверждено ли позиционирование? Если да, какую точную формулировку записать?
```

The next exact user message was `Стоп, на этом закончим.` The stop pass traversed the explicit empty patch, made no write, and asked no further question. Complete assistant turn 4:

```markdown
Обновлён [`.agents/marketing-context.md`](.agents/marketing-context.md).

Изменено:
- Product Facts
- Audience Defaults
```

- Must change: `PASS` — both answers were saved and early stop ended the pass.
- Must preserve: `PASS` — marketplaces, one-list function, and audience remained exact.
- Forbidden: `PASS` — no question after the stop message, padding, deletion, or unusable warning.
- Output contract: `PASS` — partial context confirmed normally.

### [`context-sparse-repo-007`](../skills/a1-setup-marketing-context/evals/cases/context-sparse-repo-007.md)

Write trace: no directory or file change.

```text
What confirmed product fact should I record first—what does this product do?
```

- Must change: `PASS` — zero confirmed facts produced one concrete first-fact question.
- Must preserve: `PASS` — repository stayed unchanged and dependencies stayed out of context.
- Forbidden: `PASS` — no inferred category, product, audience, feature, empty file, placeholder, or questionnaire.
- Output contract: `PASS` — one question and no write.

### [`context-partial-file-008`](../skills/a1-setup-marketing-context/evals/cases/context-partial-file-008.md)

Write: created the fixed schema note plus one populated section:

```markdown
## Brand Voice Defaults

- Практично, спокойно, без суперлативов.
```

```markdown
Создан [`.agents/marketing-context.md`](.agents/marketing-context.md).

Изменено:
- Brand Voice Defaults
```

- Must change: `PASS` — one-section context was created directly.
- Must preserve: `PASS` — exact voice meaning and default semantics remain.
- Forbidden: `PASS` — no question, empty section, filler, example, or incompleteness warning.
- Output contract: `PASS` — one linked creation and one section.

### [`context-no-hypotheses-009`](../skills/a1-setup-marketing-context/evals/cases/context-no-hypotheses-009.md)

Write trace: no repository inspection, directory creation, or file write.

```text
Оценка и сохранение гипотезы о готовности агентств платить на 20% больше находится вне границы Marketing Context. Навык записывает готовые подтверждённые факты и решения, но не создаёт и не оценивает их.
```

- Must change: `PASS` — pure hypothesis work was refused before side effects.
- Must preserve: `PASS` — 20% remained explicitly unconfirmed and response stayed Russian.
- Forbidden: `PASS` — no evaluation, save, test plan, context, research, or strategy artifact.
- Output contract: `PASS` — concise refusal.

### [`context-merge-preservation-010`](../skills/a1-setup-marketing-context/evals/cases/context-merge-preservation-010.md)

Write: inserted `Audience Defaults` with `Marketplace managers.` and updated the date. Product wording, the owner comment, Launch Notes, custom footer, order, and formatting were byte-preserved.

```markdown
Updated [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Audience Defaults
```

- Must change: `PASS` — only missing confirmed audience was added.
- Must preserve: `PASS` — every unrelated custom element survived unchanged.
- Forbidden: `PASS` — no regeneration, rename, replacement, padding, or added field.
- Output contract: `PASS` — one changed-section bullet.

### [`context-conflict-011`](../skills/a1-setup-marketing-context/evals/cases/context-conflict-011.md)

Write trace: context remained byte-identical, including date and `4 900 ₽`.

```text
В текущем marketing context тариф Start стоит 4 900 ₽ в месяц, а в README — 5 900 ₽. Какую цену сохранить?
```

- Must change: `PASS` — one question names both values and sources before a write.
- Must preserve: `PASS` — original file stayed byte-identical.
- Forbidden: `PASS` — no precedence guess, merge, average, date change, warning-only update, or second question.
- Output contract: `PASS` — one concrete conflict question.

### [`context-repository-isolation-012`](../skills/a1-setup-marketing-context/evals/cases/context-repository-isolation-012.md)

Write trace: only `repo-a/.agents/marketing-context.md` was created; repo-b and the harness home directory remained unchanged. The new file contained only the fixed schema note and `Audience Defaults: Marketplace managers.`

```markdown
Created [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Audience Defaults
```

- Must change: `PASS` — write targeted only the current repository.
- Must preserve: `PASS` — repo-b and home state remained untouched.
- Forbidden: `PASS` — no global, last-used, private, fallback, domain-map, or second-repository write.
- Output contract: `PASS` — current-repository relative link only.

### [`context-protected-facts-013`](../skills/a1-setup-marketing-context/evals/cases/context-protected-facts-013.md)

Write: replaced only `Audience Defaults` with `Агентства, которые ведут магазины на маркетплейсах.` and updated the date. The schema note, `Ozon and Wildberries only`, `up to 1,200`, and `Never claim Amazon support` were byte-preserved.

```markdown
Обновлён [`.agents/marketing-context.md`](.agents/marketing-context.md).

Изменено:
- Audience Defaults
```

- Must change: `PASS` — only the approved default changed.
- Must preserve: `PASS` — product facts, evidence, prohibition, and their protected semantics remained exact.
- Forbidden: `PASS` — no weakening, Amazon addition, evidence rewrite, or unrelated field edit.
- Output contract: `PASS` — one changed default section.

### [`context-output-shape-014`](../skills/a1-setup-marketing-context/evals/cases/context-output-shape-014.md)

Write: added `Words to Use` with `review workspace`; all existing sections remained unchanged.

```markdown
Updated [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Words to Use
```

- Must change: `PASS` — requested term and date were added with concise confirmation.
- Must preserve: `PASS` — existing context and English response remained.
- Forbidden: `PASS` — no full file, schema, source map, diff, assumption, preview, or extra term.
- Output contract: `PASS` — one line, link, and one bullet group only.

### [`context-language-015`](../skills/a1-setup-marketing-context/evals/cases/context-language-015.md)

Write: created the fixed schema note plus `Brand Voice Defaults` containing exactly `Пишем спокойно, конкретно и без превосходных степеней.`

```markdown
Created [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Brand Voice Defaults
```

- Must change: `PASS` — Russian content was stored and English explanation returned.
- Must preserve: `PASS` — exact Russian wording and meaning remained.
- Forbidden: `PASS` — no translation, Russian explanation, bilingual duplication, extra section, or question.
- Output contract: `PASS` — English creation confirmation and one section.

### [`context-mixed-hypothesis-016`](../skills/a1-setup-marketing-context/evals/cases/context-mixed-hypothesis-016.md)

Write trace: no repository inspection, directory creation, fact save, or hypothesis artifact.

```text
Запрос смешивает сохранение подтверждённого факта и создание гипотезы позиционирования. Marketing Context записывает готовые подтверждённые входы, но не создаёт гипотезы, поэтому я не выполняю ни одну часть. Подтверждённый факт можно сохранить отдельным запросом, когда он не смешан со стратегической работой.
```

- Must change: `PASS` — the whole mixed job was refused before a partial save.
- Must preserve: `PASS` — product fact remained unchanged and positioning unresolved.
- Forbidden: `PASS` — no hypothesis, strategy artifact, context, partial fact, repository read, or question.
- Output contract: `PASS` — concise full refusal.

### [`context-editor-default-override-017`](../skills/a1-editor/evals/cases/context-editor-default-override-017.md)

Write trace: `.agents/marketing-context.md` remained byte-identical.

Complete Editor output:

```markdown
## Edited Version

### For agency owners

Review Hub collects Ozon and Wildberries reviews in one list. Review both marketplaces in one place.

## What Changed

- Addressed the copy to agency owners instead of the stored default audience.
- Used a firmer task-specific voice without changing product facts.
```

- Must change: `PASS` — the explicit agency audience and firmer task voice overrode stored defaults without context maintenance.
- Must preserve: `PASS` — both marketplaces and the one-list product fact survived; the context was unchanged.
- Forbidden: `PASS` — no warning, question, context update, marketplace, capability, metric, or unsupported claim appeared.
- Output contract: `PASS` — a normal bounded Editor result only.

### [`context-editor-protected-conflict-018`](../skills/a1-editor/evals/cases/context-editor-protected-conflict-018.md)

Write trace: the context and editable text remained byte-identical.

Complete Editor output:

```text
В исходном тексте названа Amazon, но защищённый маркетинговый контекст разрешает только Ozon и Wildberries и запрещает заявлять поддержку Amazon. Amazon действительно поддерживается, или её нужно убрать из текста?
```

- Must change: `PASS` — one question surfaced both concrete protected conflicts before editing.
- Must preserve: `PASS` — no source or context change occurred; the response stayed Russian.
- Forbidden: `PASS` — no rewrite, silent Amazon choice, weakened qualification, setup invocation, or second question appeared.
- Output contract: `PASS` — one conflict question and no edited copy.

### [`context-chief-default-override-019`](../skills/a1-editor-in-chief/evals/cases/context-chief-default-override-019.md)

Write trace: `.agents/marketing-context.md` remained byte-identical. The internal assignment used `agency owner`, `direct`, `onboarding email`, and the stated explanation goal.

Complete Chief output:

```markdown
## Final Text

**Тема:** Отзывы Ozon и Wildberries в одном списке

Review Hub собирает отзывы Ozon и Wildberries в одном списке.

## What Changed

- Текст оформлен как короткий onboarding email для владельца агентства.
- Тон сделан прямым; продуктовый факт сохранён без новых обещаний.
```

- Must change: `PASS` — current task reader and voice overrode defaults and the bounded Chief-to-Editor workflow completed without a gate question.
- Must preserve: `PASS` — Ozon, Wildberries, and the one-list fact survived; the context was unchanged.
- Forbidden: `PASS` — no stored default, context-update request, false protected conflict, or new claim appeared.
- Output contract: `PASS` — reviewed text plus concise changes only.

### [`context-chief-protected-conflict-020`](../skills/a1-editor-in-chief/evals/cases/context-chief-protected-conflict-020.md)

Write trace: no Editor Brief, delegation, edit, or file change occurred.

Complete Chief output:

```text
В текущем тексте заявлена поддержка Amazon, а защищённый маркетинговый контекст говорит «только Ozon и Wildberries» и запрещает заявлять Amazon. Какой продуктовый факт верен для этой задачи?
```

- Must change: `PASS` — source resolution left the protected discrepancy for one adaptive-gate decision question.
- Must preserve: `PASS` — context and source stayed unchanged; the known reader and email format remained available for continuation.
- Forbidden: `PASS` — no brief, delegation, rewrite, Amazon choice, context update, or second question appeared.
- Output contract: `PASS` — one concise Russian decision question.

### [`context-legacy-migration-021`](../skills/a1-setup-marketing-context/evals/cases/context-legacy-migration-021.md)

First-turn write trace: no file or directory change.

```text
Найден legacy-контекст `.claude/marketing-context.md`. Перенести всё его содержимое в `.agents/marketing-context.md`, применить безопасную каноническую схему и удалить legacy-файл только после успешной записи?
```

After the exact harness authorization, the canonical write completed first. The legacy source was then removed. Final repository state contained one context with this content:

```markdown
# Marketing Context

Last updated: 2026-07-16

## How to Use This Context

- In this migrated file, Audience is an overridable default that guides a task only when the current request is silent.
- Product is a protected input and must not be contradicted, weakened, or silently replaced. A material conflict requires clarification.
- Launch Notes is a confirmed reusable section. Missing sections never block another skill.

<!-- owner: marketing -->

## Product
- Review Hub collects Ozon and Wildberries reviews in one list.

## Audience
- Marketplace managers.

## Launch Notes
- Preserve this custom section exactly.
```

Complete second-turn output:

```markdown
Created [`.agents/marketing-context.md`](.agents/marketing-context.md).

Changed:
- Product
- Audience
- Launch Notes
```

- Must change: `PASS` — the first turn asked one explicit migration question with zero writes; authorization produced the canonical file before removing the source.
- Must preserve: `PASS` — product, audience, comment, custom section, ordering, and formatting survived, leaving one public context.
- Forbidden: `PASS` — no silent competing file, lost content, fallback mutation, inferred value, global/private state, pointer, or domain map appeared.
- Output contract: `PASS` — one migration question followed by concise linked creation confirmation.

### [`context-interview-empty-stop-022`](../skills/a1-setup-marketing-context/evals/cases/context-interview-empty-stop-022.md)

Assistant turn 1, with no repository write:

```text
Я буду задавать вопросы по одному и сохранять каждый подтверждённый ответ перед следующим вопросом. Можно остановиться в любой момент и сохранить валидный частичный контекст.

Какой первый подтверждённый факт о продукте нужно записать?
```

The next exact user message was `Стоп.` The stop pass built the explicit empty patch and made no directory or file change. Complete assistant turn 2:

```text
Остановились. Маркетинговый контекст не создан: подтверждённых ответов не было.
```

- Must change: `PASS` — the required notice and one question preceded an immediate short Russian close response.
- Must preserve: `PASS` — the repository remained byte-identical and `.agents/` stayed absent.
- Forbidden: `PASS` — no directory, file, placeholder, profile, fallback, map, link, section list, incompleteness warning, or next question appeared.
- Output contract: `PASS` — notice plus one question, then one zero-write close response.

## Repository Evidence

- README and plugin synchronization: `PASS` — `node scripts/sync-readme-and-plugin.js` reported everything in sync.
- Structural validation: `PASS` — 3 skills, 94 contract artifacts, 0 warnings, 0 failures.
- Shell syntax, diff hygiene, and link integrity: `PASS`.
- Standards and spec review: `PASS` — independent reviews completed after fixes with no findings.

## Remaining Limitations

- Tenant policy prevents a fresh external clean-client run; the accepted fallback provides less isolation.
- Human criteria judgment passed for all 22 cases under the accepted constrained fallback.
- Passive no-op and two-repository isolation are evaluated through the deterministic state harness declared by their cases.
- Interview limit and early-stop behavior use deterministic multi-turn answer harnesses.
- Semantic evidence is model- and run-sensitive and applies to the recorded candidate digest only.
