# <img src="./assets/logos/a1-logo.svg" alt="A1" width="40">&nbsp;Маркетинговые скиллы

[English](./README.md) | **Русский**

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Передайте рутину AI-агентам — пусть маркетинговые команды сосредоточатся на стратегии, видении и решениях, которые ведут к росту.**

[Установить скиллы](#быстрый-старт) · [Посмотреть все скиллы](#скиллы)

---

## Быстрый старт

1. Откройте терминал и установите коллекцию:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

   Чтобы позже обновить установленные скиллы, запустите `npx update-skills`.

2. Выберите AI-агентов, которыми пользуетесь, и нужные скиллы.

3. Начните новую сессию в проекте с вашими материалами и попробуйте простой запрос:

   > `/a1-copy-editing`
   >
   > Сделай этот абзац понятнее и короче. Сохрани все факты и не добавляй новых утверждений.
   >
   > `[вставьте черновик]`

## Скиллы

### Core

| Скилл | Для чего использовать |
| --- | --- |
| [Wayfinder](./docs/skills/a1-wayfinder.ru.md)<br>`/a1-wayfinder` | Собрать неясную маркетинговую инициативу в карту и последовательно закрыть необходимые решения. |
| [Grill](./docs/skills/a1-grill.ru.md)<br>`/a1-grill` | Проверить на прочность маркетинговую идею, решение или план через структурированное интервью. |
| [Consumer Psychology](./docs/skills/a1-consumer-psy.ru.md)<br>`/a1-consumer-psy` | Проверить потребительские гипотезы и объяснить результаты тестов по научной базе. |
| [Marketing Context](./docs/skills/a1-marketing-context.ru.md)<br>`/a1-marketing-context` | Сохранить подтверждённые маркетинговые вводные для совместимых скиллов. |

### Editorial

| Скилл | Для чего использовать |
| --- | --- |
| [Copy Editing](./docs/skills/a1-copy-editing.ru.md)<br>`/a1-copy-editing` · `/a1-redaktura` | Отредактировать или разобрать готовый текст, не додумывая фактов. |
| [Article Writing](./docs/skills/a1-article-writing.ru.md)<br>`/a1-article-writing` | Превратить тему или исходные материалы в статью, руководство, кейс или выпуск рассылки. |
| [Decision Memo](./docs/skills/a1-decision-memo.ru.md)<br>`/a1-decision-memo` | Собрать переданные материалы во внутреннюю записку для конкретного человека, принимающего решение. |
| [Promo Page](./docs/skills/a1-promo-page.ru.md)<br>`/a1-promo-page` | Создать структуру или текст одной промостраницы для одной аудитории и действия. |
| [Press Release](./docs/skills/a1-press-release.ru.md)<br>`/a1-press-release` | Подготовить обычный анонс и показать, что ещё нужно проверить. |
| [Humanize](./docs/skills/a1-humanize.ru.md)<br>`/a1-humanize` | Убрать заметные AI-паттерны, сохранив голос и фактуру автора. |

Русская команда `/a1-redaktura` — алиас Copy Editing. Чтобы использовать её, установите `a1-redaktura` вместе с `a1-copy-editing`.

## Установка как плагина

### Codex

```bash
codex plugin marketplace add ztemerbekov/a1-marketing-skills
codex plugin add a1-marketing-skills@a1-marketing-skills
```

После установки начните новую сессию Codex. Просматривать плагины и управлять ими можно через `/plugins`.

### Cursor

```bash
cursor-agent plugin marketplace add https://github.com/ztemerbekov/a1-marketing-skills
```

Запустите `cursor-agent`, откройте `/plugin`, выберите **A1 Marketing Skills** и установите плагин на уровне пользователя или проекта.

### Claude Code

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
/plugin install a1-marketing-skills@a1-marketing-skills
```

## Помощь и обратная связь

Есть вопрос, идея или что-то сработало не так?<br>
Напишите в <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
