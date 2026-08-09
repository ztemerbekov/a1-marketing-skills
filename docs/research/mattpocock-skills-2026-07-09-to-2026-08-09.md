# Что изменилось в `mattpocock/skills` за 9 июля — 9 августа 2026 года

Исследование для [Issue #208](https://github.com/ztemerbekov/a1-marketing-skills/issues/208). Цель — определить, что из месячной активности `mattpocock/skills` полезно для A1 Marketing Skills, прежде всего для `a1-grill`, и не менять runtime в рамках этого Issue.

## Краткий вывод

Главное изменение из upstream уже внедрено: A1 Grill перешёл на раунды, frontier, фиксированный формат вопросов и параллельный поиск доступных фактов в [локальном PR #211](https://github.com/ztemerbekov/a1-marketing-skills/pull/211). Сравнение текущих файлов не выявило недостающей части механики из upstream PR #593, поэтому Issue #208 не требует ещё одной runtime-правки.

Самое полезное следующее техническое действие — отдельной задачей сделать существующую проверку invocation metadata двусторонней. Upstream после переименования оставил `allow_implicit_invocation: false` у model-invoked skill, и Codex перестал показывать его модели; это исправил [PR #766](https://github.com/mattpocock/skills/pull/766). Локальный валидатор уже проверяет направление `disable-model-invocation: true` → `allow_implicit_invocation: false`, но не обратное.

Остальные идеи нужно переносить выборочно. Полезны ручной аудит существующих README по читательскому frame из PR #761 и отдельный продуктовый follow-up для границ A1 Grill: пассивное согласие пользователя и вопросы, которые нельзя решить разговором. Не следует сейчас копировать отдельное дерево docs, release automation, общий блок redaction, новые инфраструктурные skill или новые каталоги beta/deprecated.

## Охват и источники

- Окно: `2026-07-09`—`2026-08-09`, даты GitHub в UTC.
- Upstream snapshot: [`84fdeffd`](https://github.com/mattpocock/skills/commit/84fdeffd12f2ee307994d1eb6feb48173b6e0502), последний commit в окне — 6 августа.
- За окно слито 46 PR по [GitHub merged-PR filter](https://github.com/mattpocock/skills/pulls?q=is%3Apr+is%3Amerged+merged%3A2026-07-09..2026-08-09).
- Опубликованы [v1.2.0](https://github.com/mattpocock/skills/releases/tag/v1.2.0), [v1.2.2](https://github.com/mattpocock/skills/releases/tag/v1.2.2) и [v1.2.3](https://github.com/mattpocock/skills/releases/tag/v1.2.3). Отдельного публичного релиза v1.2.1 в [списке релизов](https://github.com/mattpocock/skills/releases) нет.
- Использованы только первичные источники: upstream release notes, PR, issues, commits и файлы; локальные PR, история и текущие файлы A1 Marketing Skills.

## Что произошло в upstream

| Дата | Первичный источник | Материальное изменение |
| --- | --- | --- |
| 13 июля | [PR #551](https://github.com/mattpocock/skills/pull/551) | Рядом с каждым `SKILL.md` появился `agents/openai.yaml`; user-invoked skills получили `policy.allow_implicit_invocation: false`. Автор намеренно отказался от генератора, Ruby-валидатора и копий skill tree. |
| 13 июля | [PR #536](https://github.com/mattpocock/skills/pull/536) | Набор стал native Claude Code plugin. Codex plugin был отложен, потому что один рекурсивный `skills` path не мог выразить curated subset из bucketed tree без перестройки или дублирования; решение зафиксировано в [ADR](https://github.com/mattpocock/skills/blob/84fdeffd12f2ee307994d1eb6feb48173b6e0502/.agents/adr/0002-ship-as-a-claude-code-plugin.md). |
| 16 июля — 5 августа | [Release PR #593](https://github.com/mattpocock/skills/pull/593), [commit `a4b2009`](https://github.com/mattpocock/skills/commit/a4b2009a1a3ac9575506c10b4c84f08f9bba7a38) | `grilling` сменил один вопрос за ход на весь доступный frontier за раунд; факты ищут фоновые субагенты, независимые вопросы не ждут их; формат вопроса и рекомендации зафиксирован. В опубликованный v1.2.0 также вошли `to-questionnaire`, pruning и другие изменения. |
| 5 августа | [PR #752](https://github.com/mattpocock/skills/pull/752) | Удалены четыре уже поглощённых skill и два личных skill, один из которых содержал путь к машине автора. Upstream оставил пустой `deprecated/`, а `in-progress/` переопределил как публичный beta channel. |
| 5 августа | [PR #759](https://github.com/mattpocock/skills/pull/759), [PR #761](https://github.com/mattpocock/skills/pull/761) | Документация получила frame: `What it does` и определяющее ограничение; `When to reach for it` и invocation boundary; `Common questions` в количестве, соразмерном фактическим вопросам; проверяемое пользователем `It's working if`; `Where it fits`. Переписывание обнаружило несколько рассинхронизаций между runtime, router, README и docs. |
| 5 августа | [Issue #748](https://github.com/mattpocock/skills/issues/748), [PR #766](https://github.com/mattpocock/skills/pull/766), [v1.2.2](https://github.com/mattpocock/skills/releases/tag/v1.2.2) | После rename model-invoked `writing-for-agents` сохранил старое имя и `allow_implicit_invocation: false`; Codex исключил skill из model-visible списка. Metadata и README classification были синхронизированы. |
| 5 августа | [PR #769](https://github.com/mattpocock/skills/pull/769) | После реального version drift добавлен script, синхронизирующий `package.json` и Claude plugin manifest в release flow, плюс read-only check. |
| 6 августа | [PR #779](https://github.com/mattpocock/skills/pull/779), [v1.2.3](https://github.com/mattpocock/skills/releases/tag/v1.2.3) | После security finding `diagnosing-bugs` стал редактировать секреты в показываемых командах, outputs и артефактах; правило сократили до трёх положительно сформулированных предложений. |
| 6 августа | [PR #781](https://github.com/mattpocock/skills/pull/781), [v1.2.3](https://github.com/mattpocock/skills/releases/tag/v1.2.3) | Из трёх skill удалены Claude-specific имена `Agent`, `general-purpose` и `Explore`; инструкции теперь описывают форму делегирования, а механизм оставляют клиенту. |

## 1. Уже внедрено локально

### A1 Grill уже содержит весь материальный результат PR #593

Upstream определяет round как весь frontier решений с уже закрытыми предпосылками, затем пересчитывает frontier; вопрос имеет номер, заголовок и отдельную строку рекомендации; доступные факты отправляются субагенту и не блокируют независимые вопросы. Это видно в [upstream `grilling/SKILL.md`](https://github.com/mattpocock/skills/blob/84fdeffd12f2ee307994d1eb6feb48173b6e0502/skills/productivity/grilling/SKILL.md) и release notes [v1.2.0](https://github.com/mattpocock/skills/releases/tag/v1.2.0).

Текущий [`a1-grill/SKILL.md`](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/skills/a1-grill/SKILL.md#L9-L25) содержит те же четыре операционных свойства. Они были внесены и проверены на маркетинговом сценарии в [локальном PR #211](https://github.com/ztemerbekov/a1-marketing-skills/pull/211). Локальная адаптация дополнительно сохраняет маркетинговый scope, user-invoked контракт, язык ответа и support footer. Вывод для Issue #208: **runtime не менять**.

### Invocation metadata в текущем tree согласована

Upstream PR #551 ввёл пару `disable-model-invocation: true` / `allow_implicit_invocation: false`; PR #766 показал, что рассинхронизация в обратную сторону ломает model invocation в Codex. Локальный design contract уже требует применять клиентские controls вместе в [Invocation](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/docs/a1-skill-design-contract.md#L15-L22), а AGENTS.md задаёт точную пару в [Invocation Compatibility](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/AGENTS.md#L75-L84). У A1 Grill обе стороны согласованы: [frontmatter](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/skills/a1-grill/SKILL.md#L1-L5) и [`agents/openai.yaml`](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/skills/a1-grill/agents/openai.yaml).

### Native distribution уже шире upstream #536 и не требует копий

Локальный [PR #51](https://github.com/ztemerbekov/a1-marketing-skills/pull/51) добавил Claude Code meta-plugin, а [PR #171](https://github.com/ztemerbekov/a1-marketing-skills/pull/171) — native Codex и Cursor marketplaces поверх одного корневого `skills/` tree. Codex manifest указывает на [`./skills/`](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/.codex-plugin/plugin.json#L21), потому что все канонические локальные skill — прямые публичные дети `skills/`; upstream-проблемы с promoted и non-promoted buckets здесь нет. [PR #179](https://github.com/ztemerbekov/a1-marketing-skills/pull/179) и текущий validator дополнительно синхронизируют discovery metadata и composition.

### Pruning и простота уже являются локальной политикой

Upstream #752 удалил поглощённые и личные skill. Локальный [PR #205](https://github.com/ztemerbekov/a1-marketing-skills/pull/205) тем же принципом удалил `a1-editor-in-chief` и зависимые surfaces после того, как отдельный orchestration job перестал окупать сложность. Текущие [Simplicity Guardrails](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/AGENTS.md#L104-L112) уже требуют одного владельца факта, запрещают генератор или новый gate без обоснования и просят для каждого механизма назвать то, что он заменяет. Создавать локальные `deprecated/` или `in-progress/` по примеру upstream не нужно.

### A1 Grill уже использует harness-neutral язык

Вместо Claude-specific tool или agent type локальный runtime просит отправить [background sub-agent](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/skills/a1-grill/SKILL.md#L23). Это соответствует результату upstream [PR #781](https://github.com/mattpocock/skills/pull/781). Добавлять клиентские имена инструментов или string-based validator для этой формулировки не нужно.

## 2. Полезно сделать сейчас или вынести в ближайший follow-up

### 2.1. Сделать существующую invocation-проверку двусторонней

Факт: текущий [`validate-skills.sh`](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/scripts/validate-skills.sh#L257-L264) проверяет только: если в `SKILL.md` есть `disable-model-invocation: true`, то `agents/openai.yaml` обязан содержать `allow_implicit_invocation: false`. Он не отклонит model-invoked skill, у которого по ошибке остался `allow_implicit_invocation: false` — именно дефект upstream [Issue #748](https://github.com/mattpocock/skills/issues/748).

Рекомендация: отдельным маленьким Issue усилить уже существующий validator до точного соответствия в обе стороны. Это объективная machine-checkable инварианта из AGENTS.md, не новый maintenance mechanism. Не пытаться автоматически выводить `display_name` из имени директории: upstream #551 специально оставил UI copy ручным, а локальный design contract считает presentation частью публичного контракта.

### 2.2. Адаптировать docs frame внутри существующих README

Факт: upstream [PR #761](https://github.com/mattpocock/skills/pull/761) использовал frame не только как формат, но как ручной coherence audit и нашёл устаревшие promises и пропущенные routes. Локальный репозиторий поддерживает две человеко-редактируемые поверхности — `README.md` и `README.ru.md` — и требует менять их вместе в [AGENTS.md](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/AGENTS.md#L86-L95).

Рекомендация: при следующем README-pass вручную проверить раздел каждого skill по пяти вопросам: что делает и каково определяющее ограничение; когда вызывать и где boundary; какие вопросы реально возникают у пользователей; по каким наблюдаемым признакам работа удалась; где skill находится относительно соседних jobs. Сохранять число FAQ соразмерным evidence. Не создавать отдельный постоянный `docs/<skill>` tree, не генерировать README и не превращать формулировки в string assertions.

### 2.3. Отдельно решить две продуктовые границы A1 Grill

Новые upstream docs называют две ошибки, которых нет в текущем коротком runtime A1 Grill:

1. **Пассивное согласие.** Пользователь может последовательно соглашаться с рекомендациями и получить решение агента, которое лишь выглядит совместным; upstream описывает это как `passivity` в [`grill-me` docs](https://github.com/mattpocock/skills/blob/84fdeffd12f2ee307994d1eb6feb48173b6e0502/docs/productivity/grill-me.md#L21-L29).
2. **Непрожариваемый вопрос.** Некоторые решения требуют прототипа, макета, customer interview или теста, а не ещё одного раунда разговора; upstream проводит эту границу в [Grillable and ungrillable](https://github.com/mattpocock/skills/blob/84fdeffd12f2ee307994d1eb6feb48173b6e0502/docs/productivity/grill-me.md#L31-L37).

Рекомендация: открыть отдельный product Issue и решить, нужно ли A1 Grill явно (а) проверять реальное несогласие/ownership пользователя и (б) уметь остановить ветку с конкретной рекомендацией проверки вместо продолжения вопросов. Это изменение interaction contract, поэтому его нельзя вносить в исследовательский Issue #208 без собственных acceptance criteria и semantic evidence.

## 3. Наблюдать или не копировать

### `to-questionnaire`: кандидат на discovery, не готовая рекомендация добавить skill

Upstream `to-questionnaire` делает узнаваемый job: выясняет, кому отправят документ и какие решения нужны обратно, затем создаёт асинхронный questionnaire, направленный на gap между знаниями отправителя и получателя; runtime закреплён в [`SKILL.md`](https://github.com/mattpocock/skills/blob/84fdeffd12f2ee307994d1eb6feb48173b6e0502/skills/productivity/to-questionnaire/SKILL.md). Для маркетинга это может быть сбор ответов у product, sales, legal или brand owner перед кампанией. Но локального evidence повторяющегося спроса пока нет. Сначала проверить запросы пользователей и boundary с A1 Grill/Marketing Context; новый skill потребует отдельного Issue и финального manifest approval перед release.

### Version sync из #769: ждать повторяющейся проблемы

Upstream добавил script только после реального drift между `package.json` и Claude manifest в [PR #769](https://github.com/mattpocock/skills/pull/769). Локально нет `package.json` как владельца release version; версии Codex и Cursor уже сравниваются существующим [`validate-marketplaces.py`](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/scripts/validate-marketplaces.py#L295-L308). Не добавлять changesets, package manifest или sync script до повторяющейся ручной проблемы и явного решения, какой источник версии станет каноническим и какой старый шаг автоматизация заменит.

### Redaction из #779: применять по exposure, не как общий boilerplate

Upstream rule появился там, где skill прямо показывал команды, outputs и captured artifacts с возможными credentials; это зафиксировано в [PR #779](https://github.com/mattpocock/skills/pull/779). Текущие маркетинговые runtime почти не делают этого: Marketing Context ограничивает источники подтверждёнными материалами и не трактует source code как маркетинговое evidence в [source policy](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/skills/a1-marketing-context/references/source-policy.md). Не копировать `Redact` во все skill. Возвращаться к правилу, когда появится конкретный job, читающий CRM exports, logs, HAR, команды, `.env` или API responses; тогда поставить positive redaction в точках показа/записи и проверить escape hatch.

### Не копировать отдельный docs tree и формальный стандарт

Upstream docs rewrite полезен как метод аудита, но отдельные docs уже успели разойтись с runtime и README, что сам [PR #761](https://github.com/mattpocock/skills/pull/761) исправлял. Локальная политика требует одного канонического владельца факта и запрещает новую surface без обоснования. Поэтому переносится frame, а не файловая структура, changeset или автоматический gate.

### Не добавлять `wizard` и `wait-what` без собственного marketing job

`wizard` автоматизирует ручные dashboard/secret/migration steps, а `wait-what` переподаёт одну непонятную реплику; эти jobs описаны в release notes [v1.2.0](https://github.com/mattpocock/skills/releases/tag/v1.2.0). Они полезны как общие productivity skills, но пока не выражают отдельный узнаваемый marketing job и расширили бы scope пака без локального спроса.

### Следить за двумя клиентскими рисками, не менять контракт заранее

- В открытом upstream [Issue #693](https://github.com/mattpocock/skills/issues/693) Claude coordinator mode скрывает user-invoked skills с `disable-model-invocation: true`. Это harness issue; снимать флаг у A1 Grill означало бы изменить его deliberate invocation contract и рассинхронизировать клиенты.
- В открытых [Issue #530](https://github.com/mattpocock/skills/issues/530) и [Issue #573](https://github.com/mattpocock/skills/issues/573) субагенты повторно запускают delegating skill и создают recursive fan-out. Локальных наблюдений такого сбоя у A1 Grill нет. Если он появится, исправлять конкретный dispatch/worker boundary и проверять installed-client interaction, а не добавлять общий запрет во все skill.

## Итог по Issue #208

- Outcome PR #593 и все материальные изменения `grilling` зафиксированы первичными источниками.
- Текущий A1 Grill и его история сравнены с upstream; основная механика уже внедрена локальным PR #211.
- Факты отделены от локальных рекомендаций.
- Runtime A1 Grill не менялся.
- Самый обоснованный следующий технический Issue — двусторонняя invocation validation; отдельный продуктовый Issue — passivity и ungrillable branches; README frame — ручной аудит существующей поверхности.

## Перечень первичных источников

### Upstream releases и release PR

- [Release v1.2.0](https://github.com/mattpocock/skills/releases/tag/v1.2.0)
- [Release v1.2.2](https://github.com/mattpocock/skills/releases/tag/v1.2.2)
- [Release v1.2.3](https://github.com/mattpocock/skills/releases/tag/v1.2.3)
- [PR #593 — Release v1.2](https://github.com/mattpocock/skills/pull/593)

### Upstream PR и issues

- [#551 — Codex `agents/openai.yaml` metadata](https://github.com/mattpocock/skills/pull/551)
- [#536 — native Claude Code plugin](https://github.com/mattpocock/skills/pull/536)
- [#752 — remove unused/personal skills](https://github.com/mattpocock/skills/pull/752)
- [#759 — docs page frame](https://github.com/mattpocock/skills/pull/759)
- [#761 — docs rewrite and coherence fixes](https://github.com/mattpocock/skills/pull/761)
- [#748 — stale Codex invocation metadata](https://github.com/mattpocock/skills/issues/748)
- [#766 — restore model invocation](https://github.com/mattpocock/skills/pull/766)
- [#769 — plugin version sync](https://github.com/mattpocock/skills/pull/769)
- [#779 — redact secrets](https://github.com/mattpocock/skills/pull/779)
- [#781 — harness-neutral subagent language](https://github.com/mattpocock/skills/pull/781)
- [#693 — coordinator mode and user-invoked skills](https://github.com/mattpocock/skills/issues/693)
- [#530 — recursive research agents](https://github.com/mattpocock/skills/issues/530)
- [#573 — recursive code-review agents](https://github.com/mattpocock/skills/issues/573)

### Локальные источники

- [Issue #208 — Research Grill Me PR #593 for A1 Grill](https://github.com/ztemerbekov/a1-marketing-skills/issues/208)
- [PR #211 — Adopt round-by-round mechanics in A1 Grill](https://github.com/ztemerbekov/a1-marketing-skills/pull/211)
- [PR #51 — Claude Code marketing suite](https://github.com/ztemerbekov/a1-marketing-skills/pull/51)
- [PR #171 — native Codex and Cursor marketplaces](https://github.com/ztemerbekov/a1-marketing-skills/pull/171)
- [PR #179 — synchronize marketplace discovery metadata](https://github.com/ztemerbekov/a1-marketing-skills/pull/179)
- [PR #205 — remove `a1-editor-in-chief`](https://github.com/ztemerbekov/a1-marketing-skills/pull/205)
- [`a1-grill/SKILL.md` at research baseline](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/skills/a1-grill/SKILL.md)
- [A1 Skill Design Contract at research baseline](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/docs/a1-skill-design-contract.md)
- [AGENTS.md simplicity and invocation rules at research baseline](https://github.com/ztemerbekov/a1-marketing-skills/blob/74999f950dbab1f9ac38329f173b17b1fb0fad92/AGENTS.md)
