# A1 Editor in Chief Refactor Run — 2026-07-16

This record is the semantic release gate for the bounded chief-editor workflow implemented in GitHub Issue #8.

## Verdict

- Focused semantic regressions: `PASS` — human criteria review
- Repository verification: `PASS`
- Semantic release gate: `PASS`

## Environment

- Client: Codex desktop, current implementation task
- Model: GPT-5
- Run date: `2026-07-16`
- Candidate source: current `skills/a1-editor-in-chief/` plus sibling `skills/a1-editor/`
- Candidate directory digest: `8fc9d03afe270d05d8214f1699274be122a6af8c818b282892bd9f7289051f26`
- Digest method: SHA-256 over every sorted candidate-relative path, a NUL separator, and that file's SHA-256.
- Fallback mode: exact candidate instructions loaded in the current supported client because tenant policy blocks external clean-client execution
- Fallback approver: `ztemerbekov`, explicit product decision on `2026-07-16`
- Preliminary reviewer: Codex criteria review in the current task
- Human reviewer: `ztemerbekov`, confirmed `PASS` on `2026-07-16`

The exact **User Instruction**, **Input**, setup, and marketing context from every linked case were applied without paraphrasing. Case 011 used its declared two-response Editor harness. Structural checks are recorded separately and do not substitute for these outputs.

## Domain Boundary Reassessment

- Root `CONTEXT.md`: absent
- ADRs under `docs/adr/`: absent
- Decision: the refactor remains inside the existing single marketing-skills domain. It narrows an existing skill and does not introduce an independently evolving domain.
- `CONTEXT-MAP.md`: not needed and not created.

## Case Results

### [`chief-dependency-001`](../skills/a1-editor-in-chief/evals/cases/chief-dependency-001.md)

```text
Для продолжения нужен `a1-editor`, установленный рядом с `a1-editor-in-chief`. Установите зависимость и повторите запрос.
```

- Must change: `PASS` — the in-scope request reaches the missing dependency response before context or gate work.
- Must preserve: `PASS` — the source text is untouched and the response is Russian.
- Forbidden: `PASS` — no questions, brief, diagnosis, edit, emulation, or deep link appears.
- Output contract: `PASS` — the run stops with the concise dependency response.

### [`chief-explicit-002`](../skills/a1-editor-in-chief/evals/cases/chief-explicit-002.md)

```text
Какой результат должен дать этот текст: объяснить функцию уже заинтересованному читателю или убедить нового читателя рассмотреть сервис?
```

- Must change: `PASS` — one decisive editorial fork is asked and the run stops.
- Must preserve: `PASS` — source material is unchanged and missing marketing context is not mentioned.
- Forbidden: `PASS` — no five-field questionnaire, operation question, summary, brief, or handoff appears.
- Output contract: `PASS` — one concise blocking question only.

### [`chief-explicit-003`](../skills/a1-editor-in-chief/evals/cases/chief-explicit-003.md)

```markdown
## Final Text

По пятницам в 16:00 менеджер открывает список отзывов из Ozon и Wildberries, сверяет даты и убирает дубли.

## What Changed

- Убраны вводная фраза и повторы.
- Сохранены время и порядок трёх действий.
```

- Must change: `PASS` — clarify is selected, Editor execution is represented, and the result is reviewed.
- Must preserve: `PASS` — Friday, 16:00, both marketplaces, and the action order remain.
- Forbidden: `PASS` — no process sections, assumptions, warnings, or invented marketing content appear.
- Output contract: `PASS` — only final text and two concise change notes are visible.

### [`chief-scope-mixed-004`](../skills/a1-editor-in-chief/evals/cases/chief-scope-mixed-004.md)

```text
Запрос смешивает редактуру с выбором сегмента, цены и GTM — это работа вне границы `a1-editor-in-chief`. Шеф-редактор может использовать готовые решения как исходный материал, но не создаёт их. Поэтому я не выполняю ни стратегическую, ни редакторскую часть этого смешанного запроса.
```

- Must change: `PASS` — the whole mixed job is refused and all out-of-scope jobs are named.
- Must preserve: `PASS` — completed decisions are identified as allowed future inputs.
- Forbidden: `PASS` — no missing-dependency response, questions, strategy, or partial edit appears.
- Output contract: `PASS` — the refusal stops before any other stage.

### [`chief-scope-completed-input-005`](../skills/a1-editor-in-chief/evals/cases/chief-scope-completed-input-005.md)

```markdown
## Final Text

По пятницам менеджер открывает единый список отзывов из Ozon и Wildberries и проверяет новые отзывы.

## What Changed

- Утверждённое позиционирование вынесено в формулировку «единый список».
- Пятничный сценарий поставлен в начало без новых обещаний.
```

- Must change: `PASS` — completed strategy is accepted and the existing Friday scenario is foregrounded.
- Must preserve: `PASS` — segment, positioning, marketplaces, one list, and Friday remain; price and GTM are untouched.
- Forbidden: `PASS` — no new strategy, fact, proof, benefit, or CTA is created.
- Output contract: `PASS` — minimal reviewed output with no brief or internal review.

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

- Must change: `PASS` — context fills the assignment and restructure is executed without questions.
- Must preserve: `PASS` — Friday, both marketplaces, action order, practical voice, and knowledge-base shape remain.
- Forbidden: `PASS` — no repeated context questions, claim, benefit, metric, or CTA appears.
- Output contract: `PASS` — final text and concise notes only.

### [`chief-context-incomplete-007`](../skills/a1-editor-in-chief/evals/cases/chief-context-incomplete-007.md)

```text
Какой результат должен дать email: только объяснить новым клиентам функцию единого списка или привести их к конкретному следующему действию?
```

- Must change: `PASS` — the materially different goal directions are named in one question.
- Must preserve: `PASS` — reader, email channel, and supplied function are treated as known.
- Forbidden: `PASS` — no repeated field questions, inferred CTA, brief, edit, or partial output appears.
- Output contract: `PASS` — one decision question and stop.

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

- Must change: `PASS` — chief selects clarify and exposes only the requested brief plus final output.
- Must preserve: `PASS` — every required fact and action survives.
- Forbidden: `PASS` — no operation question, internal reference, or copied Editor rule appears.
- Output contract: `PASS` — brief is visible only because explicitly requested.

### [`chief-editorial-boundary-009`](../skills/a1-editor-in-chief/evals/cases/chief-editorial-boundary-009.md)

```text
Исследование рынка, выбор сегмента, позиционирования, цены и GTM находятся вне границы `a1-editor-in-chief`. Шеф-редактор может использовать готовые решения как исходный материал редакционной задачи, но не создаёт их.
```

- Must change: `PASS` — all general marketing jobs are refused before dependency work.
- Must preserve: `PASS` — the response is Russian and names the bounded chief-editor role.
- Forbidden: `PASS` — no dependency response, context read, questions, strategy hypothesis, or partial text appears.
- Output contract: `PASS` — concise full refusal.

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

- Must change: `PASS` — current instructions win and the material conflict is warned about.
- Must preserve: `PASS` — reader, goal, channel, marketplaces, and action order remain.
- Forbidden: `PASS` — Monday and 09:00 do not enter final copy; no question or merged schedule appears.
- Output contract: `PASS` — the warning appears only because the conflict is material.

### [`chief-corrective-review-011`](../skills/a1-editor-in-chief/evals/cases/chief-corrective-review-011.md)

Harness trace: the first Editor result said `10 магазинов`; chief rejected it for losing the qualification, sent one corrective note with the unchanged brief, and the second result restored `до 10 магазинов`. Editor calls: `2`.

```markdown
## Final Text

Тариф Start стоит 1 900 рублей в месяц. Команда может подключить до 10 магазинов.

## What Changed

- Условие тарифа разделено на цену и лимит.
- Квалификация «до 10 магазинов» сохранена.
```

- Must change: `PASS` — the first draft fails, one corrective pass is delegated, and the second is reviewed.
- Must preserve: `PASS` — price, tariff, and qualified limit remain; Editor owns both text passes.
- Forbidden: `PASS` — no local chief patch, third call, hidden failure, discount, trial, or CTA occurs.
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
- Output contract: `PASS` — final copy plus two English change notes.

### [`editor-strategy-route-001`](../skills/a1-editor/evals/cases/editor-strategy-route-001.md)

```text
A1 Editor редактирует готовый текст, но не выбирает, чем сервис должен отличаться и какую главную мысль занимать: это незавершённое позиционирование. `a1-editor-in-chief` тоже не создаёт позиционирование; он может принять уже утверждённое решение как вход редакционного задания.
```

- Must change: `PASS` — the request is classified as positioning creation and both Editor and Chief boundaries are stated.
- Must preserve: `PASS` — differentiation and the main thought are named as unresolved decisions; Ozon and Wildberries remain context only.
- Forbidden: `PASS` — no positioning, slogan, segment, claim, partial edit, Chief recommendation, question, or brief appears.
- Output contract: `PASS` — concise boundary response only.

### [`editor-strategy-route-002`](../skills/a1-editor/evals/cases/editor-strategy-route-002.md)

```text
A1 Editor редактирует готовый текст, но не создаёт оффер: состав тарифа, обоснование цены и CTA ещё не выбраны. `a1-editor-in-chief` тоже не создаёт эти решения; он может использовать их только как готовый вход редакционного задания.
```

- Must change: `PASS` — offer, pricing rationale, and CTA are identified as unmade commercial decisions outside both skills.
- Must preserve: `PASS` — the known price and review sources are not converted into an offer.
- Forbidden: `PASS` — no package, promise, discount, urgency, CTA, price rationale, Chief recommendation, question, or brief appears.
- Output contract: `PASS` — concise boundary response only.

### [`editor-strategy-route-003`](../skills/a1-editor/evals/cases/editor-strategy-route-003.md)

```text
A1 Editor редактирует готовый текст, но не выбирает целевую аудиторию, приоритетный сегмент или главного читателя. `a1-editor-in-chief` тоже не создаёт сегментацию; он может принять уже утверждённую аудиторию как вход редакционного задания.
```

- Must change: `PASS` — audience and segment selection is identified as strategy outside both skills.
- Must preserve: `PASS` — the main reader remains unresolved and no sparse-context guess becomes a fact.
- Forbidden: `PASS` — no role, business type, awareness level, Chief recommendation, question, or brief appears.
- Output contract: `PASS` — concise boundary response only.

### [`editor-strategy-route-004`](../skills/a1-editor/evals/cases/editor-strategy-route-004.md)

```text
A1 Editor редактирует готовый текст, но не создаёт концепцию кампании или систему сообщений: стратегическая основа запуска ещё не утверждена. `a1-editor-in-chief` тоже не создаёт кампанию; он может принять готовую концепцию и сообщения как входы редакционного задания.
```

- Must change: `PASS` — campaign concept and message-system creation are identified as unconfirmed strategy outside both skills.
- Must preserve: `PASS` — only the known marketplace sources remain factual.
- Forbidden: `PASS` — no big idea, slogan, ad, channel, sequence, audience, CTA, Chief recommendation, question, or brief appears.
- Output contract: `PASS` — concise boundary response only.

### [`editor-strategy-route-005`](../skills/a1-editor/evals/cases/editor-strategy-route-005.md)

```text
A1 Editor редактирует готовый текст, но не проектирует с нуля блоки лендинга, их порядок и роль доказательств. `a1-editor-in-chief` тоже не создаёт архитектуру лендинга; он может принять утверждённую структуру как вход редакционного задания.
```

- Must change: `PASS` — blank-page landing architecture is distinguished from restructuring existing copy.
- Must preserve: `PASS` — the sole product fact is not expanded into a page architecture.
- Forbidden: `PASS` — no hero, benefit, proof, objection, price, FAQ, CTA, order, Chief recommendation, question, or brief appears.
- Output contract: `PASS` — concise boundary response only.

### [`editor-strategy-boundary-008`](../skills/a1-editor/evals/cases/editor-strategy-boundary-008.md)

```text
Запрос смешивает редактуру готового абзаца и создание нового позиционирования, поэтому A1 Editor не выполняет ни одну часть. `a1-editor-in-chief` тоже не создаёт позиционирование и может принять его только как готовый вход отдельного редакционного задания.
```

- Must change: `PASS` — both jobs are named, the whole mixed request is refused, and Chief's strategy boundary is explicit.
- Must preserve: `PASS` — the source paragraph stays unused and the positioning remains unresolved.
- Forbidden: `PASS` — no strategy artifact, Chief recommendation, question, brief, edited fragment, `Edited Version`, or `What Changed` appears.
- Output contract: `PASS` — concise full refusal before partial execution.

### [`editor-chief-handoff-009`](../skills/a1-editor/evals/cases/editor-chief-handoff-009.md)

```text
Аудитория и позиционирование уже утверждены, а запрос ограничен редакционным углом и порядком аргументов до редактуры. Явно запустите `a1-editor-in-chief`: он использует готовые аудиторию и позиционирование как входы, определит ограниченное редакционное направление и передаст текст Редактору.
```

- Must change: `PASS` — completed strategy and the bounded editorial-direction job are distinguished, and explicit Chief invocation is recommended.
- Must preserve: `PASS` — approved audience and positioning remain inputs; the instruction not to rewrite now is honored.
- Forbidden: `PASS` — no chief stage starts, no question or brief appears, no direct edit is returned, and no new strategy or copy claim is created.
- Output contract: `PASS` — concise routing response only.

## Repository Evidence

- README and plugin synchronization: `PASS` — `node scripts/sync-readme-and-plugin.js` reported everything in sync.
- Structural validation: `PASS` — 3 skills, 63 contract artifacts, 0 warnings, 0 failures.
- Shell syntax, diff hygiene, and link integrity: `PASS`.
- Standards and spec review: `PASS` — final independent reviews reported no findings after the two correction rounds.

## Remaining Limitations

- Tenant policy prevents a fresh external clean-client run; the accepted fallback provides less isolation.
- Human criteria judgment passed for all 19 cases.
- Corrective-review case 011 uses the deterministic Editor-response harness declared in its setup rather than relying on a stochastic first-pass failure.
- Semantic evidence is model- and run-sensitive and applies to the recorded candidate digest only.
