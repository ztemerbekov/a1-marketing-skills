# A1 Editor Pilot Run Evidence — 2026-07-15

This record preserves complete semantic-run outputs for human review. Case instructions, inputs, setup, and criteria remain canonical in the linked eval files.

## Environment

- Client: `codex-cli 0.144.4`
- Model: `gpt-5.6-sol`
- Skill revision: `73e029ac8ee12d2b1cae85c703b0f5f54d6cf612`
- Installation: `a1-editor` and `a1-editor-in-chief` installed under `~/.codex/skills` and verified byte-for-byte against the recorded revision.
- Run mode: fresh `codex exec --ephemeral` session per case with a read-only sandbox.
- Human reviewer: `ztemerbekov`

## `editor-standard-001` — PASS

Case: [standard edit preserves voice](../skills/a1-editor/evals/cases/standard-edit-voice.md)

### Complete Output

```markdown
## Отредактированный вариант

Честно говоря, мы долго думали, как перестать каждый день прыгать между кабинетами маркетплейсов. В итоге сделали простую штуку: сервис собирает комментарии из Ozon, Wildberries и Яндекс Маркета в один отчёт. Я сам открываю его по пятницам — так хотя бы ничего не теряется между тремя вкладками.

## Что изменил

- Убрал повтор «очень долго и продолжительно».
- Упростил тяжёлую конструкцию «как не прыгать».
- Сохранил разговорные «честно говоря», «простую штуку» и личную деталь про пятницы.
```

### Human Evidence

- Must change: the tautology is gone and the relationship between marketplace cabinets, tabs, and one report is clearer.
- Must preserve: first-person conversational voice, Friday use, all three marketplace names, and the single report remain.
- Forbidden: no capability, metric, CTA, sales promise, or corporate rewrite was introduced.
- Output-contract check: the response contains the edited version and three concise explanations of actual changes.
- Verdict: `PASS`, confirmed by `ztemerbekov` in the Codex task.

## `editor-strategy-boundary-006` — PASS

Case: [ordinary editing stays in Editor without optional context](../skills/a1-editor/evals/cases/ordinary-edit-stays-editor.md)

### Complete Output

```markdown
## Сокращённый текст

Каждую пятницу команда открывает свежий отчёт, сверяет даты и удаляет дубли.

## Что изменено

- Убраны вводная фраза и повторы.
- Сохранены порядок действий и исходный смысл.
```

### Human Evidence

- Must change: the stock introduction and sequential repetition are gone; the edit starts immediately.
- Must preserve: Friday, the team, and the order of opening the fresh report, checking dates, and removing duplicates remain.
- Forbidden: no chief routing, chief-gate question, audience, channel, purpose, tool, benefit, or CTA appears.
- Output-contract check: the response contains a shortened version and two concise explanations.
- Verdict: `PASS`, confirmed by `ztemerbekov` in the Codex task.

## `editor-shorten-001` — PASS

Case: [shorten without losing qualifications](../skills/a1-editor/evals/cases/shorten.md)

### Complete Output

```markdown
## Сокращённая версия

Тариф Start стоит 1 900 рублей в месяц. Команда может подключить до 10 магазинов. Отчеты приходят раз в неделю — по понедельникам. Если тариф больше не нужен, подписку можно отменить в любой момент без звонка менеджеру: долгосрочных обязательств нет.

## Что изменилось

- Текст сокращён примерно на треть.
- Убраны повторы, все условия тарифа сохранены.
```

### Human Evidence

- Must change: the cancellation repetition and bureaucratic wording are removed; the result is materially shorter.
- Must preserve: the monthly price, up-to-10 limit, weekly Monday delivery, and cancellation at any time without a manager call remain.
- Forbidden: no discount, trial, refund, CTA, or new condition appears; `до 10` remains qualified.
- Output-contract check: the response contains the shortened version and two concise explanations.
- Verdict: `PASS`, confirmed by `ztemerbekov` in the Codex task.

## `editor-clarify-001` — PASS

Case: [clarify weak source material](../skills/a1-editor/evals/cases/clarify-weak-source.md)

### Complete Output

```markdown
## Отредактированный вариант

Наше решение объединяет вопросы клиентов в одном пространстве: команда видит их в одном окне.

## Что изменилось

- Убрал абстрактные формулировки о «качественном взаимодействии» и «коммуникационных процессах».
- Исключил неподтверждённые оценки: «инновационное», «максимально» и «эффективно».
- Сохранил конкретную пользу, которая есть в исходнике.
```

### Human Evidence

- Must change: the one-window fact is foregrounded; empty evaluations and bureaucratic phrasing are removed.
- Must preserve: the supported function remains and the result stays limited to the weak source material.
- Forbidden: no channel, integration, response speed, audience, analytics, or business result was introduced.
- Output-contract check: the response contains the clarified version and three concise explanations.
- Verdict: `PASS`, including the `объединяет вопросы клиентов` wording, confirmed by `ztemerbekov` in the Codex task.

## `editor-strengthen-001` — FAIL

Case: [strengthen without unsupported claims](../skills/a1-editor/evals/cases/strengthen-unsupported-claims.md)

### Complete Output

```markdown
## Усиленный текст

Сервис собирает отзывы с Wildberries и Ozon в одном списке и помогает команде быстрее их разбирать.

## Что изменилось

- Убрал неуверенное «возможно».
- Убрал неподтверждённые заявления о лидерстве на рынке и гарантированном росте продаж.
- Сохранил единственный конкретный факт — сбор отзывов в одном списке.
```

### Human Evidence

- Must change: the supported one-list function is foregrounded and the market-leadership and guaranteed-sales claims are removed.
- Must preserve: `возможно` was removed, turning the tentative speed outcome into a categorical claim.
- Forbidden: the output asserts a speed benefit more strongly than the source supports.
- Output-contract check: the response shape passes, but semantic preservation fails.
- Verdict: `FAIL`, confirmed by `ztemerbekov` in the Codex task.

## `editor-restructure-001` — PASS

Case: [restructure existing material only](../skills/a1-editor/evals/cases/restructure.md)

### Complete Output

```markdown
## Отредактированный вариант

- Тариф Team стоит 4 900 рублей в месяц и включает пять пользователей.
- Пробный период длится семь дней. Экспорт в это время недоступен.
- Отчёты приходят по пятницам на почту.
- Поддержка отвечает по будням с 10:00 до 18:00.

## Что изменилось

- Связанные условия объединены в пункты.
- Информация выстроена от тарифа и пробного периода к сервисным деталям.
- Новые смыслы не добавлены.
```

### Human Evidence

- Must change: tariff composition, trial restrictions, and service schedule are grouped into a scannable order.
- Must preserve: price, five users, Friday email reports, weekday support hours, seven-day trial, and unavailable trial export all remain.
- Forbidden: no benefit block, FAQ, comparison, CTA, discount, feature, or changed number appears.
- Output-contract check: the response contains the restructured version and three concise explanations.
- Verdict: `PASS`, confirmed by `ztemerbekov` in the Codex task.

## `editor-ambiguity-001` — FAIL

Case: [ask only for significant ambiguity](../skills/a1-editor/evals/cases/significant-ambiguity.md)

### Complete Output

```markdown
## Отредактированный текст

Мы сравнили тарифы Basic и Pro. Тариф Pro включает экспорт отчетов и доступ для пяти сотрудников.

## Что изменилось

- Местоимение «он» заменено на «тариф Pro», чтобы устранить неоднозначность.
```

### Human Evidence

- Must change: the response did not ask which tariff to substitute and did not stop before editing.
- Must preserve: the two possible interpretations were collapsed into an unsupported choice of `Pro`.
- Forbidden: the output assigned the functions to `Pro` without a user answer.
- Output-contract check: an edited-version shape was returned when the gate required one concise question instead.
- Verdict: `FAIL`, confirmed by `ztemerbekov` in the Codex task.

## Interrupted Run

The suite stopped after the two significant failures above. The corrected installed candidate must restart the full suite from case one; earlier PASS verdicts cannot be carried into the final run.
