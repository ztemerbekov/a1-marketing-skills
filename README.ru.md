<h1><img src="./assets/logos/a1-logo.svg" alt="A1" width="40"> Маркетинговые скиллы</h1>

[English](./README.md) | **Русский**

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Отдайте повторяющуюся маркетинговую работу AI-агентам, сохранив за командой стратегию, контроль фактов и финальные решения.**

A1 Маркетинговые скиллы — это набор из десяти сфокусированных скиллов для маркетинговых решений, общего контекста, психологии потребителя, создания и редактуры текстов. У каждого скилла одна понятная задача: агент выполняет работу, не расширяет её границы без спроса и не додумывает недостающие факты.

- **Два набора.** A1 Core помогает с решениями и контекстом, A1 Editorial создаёт и улучшает тексты на основе источников.
- **Общий контекст.** Совместимые скиллы используют подтверждённые данные о продукте, аудитории, позиционировании и голосе из `.agents/marketing-context.md`.
- **Чёткие границы.** Редакторские скиллы сохраняют факты исходника и показывают пробелы в доказательствах, а не заполняют их правдоподобным текстом.
- **Несколько способов установки.** Отдельные скиллы можно установить через CLI `skills`, а всю коллекцию — как плагин для Codex, Cursor или Claude Code.

> **Названия:** в тексте используются человеческие названия — например, **Copy Editing**. В коде указан идентификатор для установки `a1-copy-editing`, а в примерах — команда `/a1-copy-editing`.

## Попробовать

После установки откройте проект с черновиком и попросите Copy Editing улучшить его:

> `/a1-copy-editing`
>
> Сделай этот абзац понятнее и короче. Сохрани все факты и не добавляй новых утверждений.
>
> `[вставьте черновик]`

Скилл вернёт отредактированный текст без искажения исходных фактов. Можно также запросить разбор без переписывания или сформулировать задачу обычным языком, если агент поддерживает автоматический выбор скилла.

## Содержание

- [Быстрый старт](#быстрый-старт)
- [Скиллы](#скиллы)
- [Другие способы установки](#другие-способы-установки)
- [Обновление и удаление](#обновление-и-удаление)
- [Помощь и обратная связь](#помощь-и-обратная-связь)

## Быстрый старт

1. Установите коллекцию глобально. Одна команда работает в Bash, Command Prompt и PowerShell:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

2. Выберите AI-агентов, которыми уже пользуетесь, затем отметьте `a1-copy-editing` или другие нужные скиллы. Для русской команды Copy Editing выберите и `a1-copy-editing`, и `a1-redaktura`.

3. Начните новую сессию в проекте с нужными материалами, затем вызовите скилл командой или опишите задачу обычным языком.

4. Для регулярной работы в одном репозитории попросите Marketing Context сохранить подтверждённые вводные:

   > Настрой маркетинговый контекст по подтверждённой информации в этом репозитории.

   Команда создаст или обновит `.agents/marketing-context.md`. Сама установка этот файл не создаёт.

## Скиллы

### A1 Core — решения и контекст

| Скилл | Команда | Для чего использовать |
| --- | --- | --- |
| [Wayfinder](./docs/skills/a1-wayfinder.ru.md) | `/a1-wayfinder` | Собрать неясную маркетинговую инициативу в карту и последовательно закрыть необходимые решения. |
| [Grill](./docs/skills/a1-grill.ru.md) | `/a1-grill` | Проверить на прочность маркетинговую идею, решение или план через структурированное интервью. |
| [Consumer Psychology](./docs/skills/a1-consumer-psy.ru.md) | `/a1-consumer-psy` | Проверить потребительские гипотезы и объяснить результаты тестов по научной базе. |
| [Marketing Context](./docs/skills/a1-marketing-context.ru.md) | `/a1-marketing-context` | Сохранить подтверждённые маркетинговые вводные для совместимых скиллов. |

### A1 Editorial — создание и редактура текстов

| Скилл | Команда | Для чего использовать |
| --- | --- | --- |
| [Copy Editing](./docs/skills/a1-copy-editing.ru.md) | `/a1-copy-editing` или `/a1-redaktura` | Отредактировать или разобрать готовый текст, не додумывая фактов. |
| [Article Writing](./docs/skills/a1-article-writing.ru.md) | `/a1-article-writing` | Превратить тему или исходные материалы в статью, руководство, кейс или выпуск рассылки. |
| [Decision Memo](./docs/skills/a1-decision-memo.ru.md) | `/a1-decision-memo` | Собрать переданные материалы во внутреннюю записку для конкретного человека, принимающего решение. |
| [Promo Page](./docs/skills/a1-promo-page.ru.md) | `/a1-promo-page` | Создать структуру или текст одной промостраницы для одной аудитории и действия. |
| [Press Release](./docs/skills/a1-press-release.ru.md) | `/a1-press-release` | Подготовить обычный анонс и показать, что ещё нужно проверить. |
| [Humanize](./docs/skills/a1-humanize.ru.md) | `/a1-humanize` | Убрать заметные AI-паттерны, сохранив голос и фактуру автора. |

Русская команда `/a1-redaktura` — алиас Copy Editing, а не отдельный редакторский скилл. Чтобы использовать эту команду, установите её вместе с `a1-copy-editing`.

## Другие способы установки

### Только один проект

Запустите основную команду внутри проекта и уберите `-g`:

```bash
npx skills@latest add ztemerbekov/a1-marketing-skills
```

При проектной установке выбранные версии скиллов остаются с проектом. Актуальный список агентов и поведение установщика описаны в документации [`skills`](https://github.com/vercel-labs/skills).

### Marketplace Codex

Добавьте marketplace репозитория и установите плагин:

```bash
codex plugin marketplace add ztemerbekov/a1-marketing-skills
codex plugin add a1-marketing-skills@a1-marketing-skills
```

После установки начните новую сессию Codex. Просматривать плагины и управлять ими также можно через `/plugins`.

### Marketplace Cursor

Добавьте marketplace:

```bash
cursor-agent plugin marketplace add https://github.com/ztemerbekov/a1-marketing-skills
```

Затем запустите `cursor-agent`, откройте `/plugin`, выберите **A1 Marketing Skills** и установите плагин на уровне пользователя или проекта.

### Marketplace Claude Code

Добавьте marketplace и установите всю коллекцию:

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
/plugin install a1-marketing-skills@a1-marketing-skills
```

В полную установку входят оба набора. В Claude Code команды используют пространство имён:

- **A1 Core:** `/a1-core:a1-wayfinder`, `/a1-core:a1-grill`, `/a1-core:a1-consumer-psy` и `/a1-core:a1-marketing-context`
- **A1 Editorial:** `/a1-editorial:a1-copy-editing`, `/a1-editorial:a1-redaktura`, `/a1-editorial:a1-article-writing`, `/a1-editorial:a1-decision-memo`, `/a1-editorial:a1-promo-page`, `/a1-editorial:a1-press-release` и `/a1-editorial:a1-humanize`

Чтобы установить только один набор:

```text
/plugin install a1-core@a1-marketing-skills
/plugin install a1-editorial@a1-marketing-skills
```

### Пакет Agent Plugins

Корень репозитория соответствует [спецификации Agent Plugins v1.0.0](https://agent-plugins.org/specification). `plugin.json` задаёт переносимую идентичность пакета, а клиентские манифесты — установку и отображение для конкретных клиентов.

## Обновление и удаление

Обновите десять возможностей и русский алиас Copy Editing:

```bash
npx skills@latest update a1-copy-editing a1-redaktura a1-article-writing a1-decision-memo a1-promo-page a1-press-release a1-wayfinder a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

Удалите их из глобальной установки:

```bash
npx skills@latest remove a1-copy-editing a1-redaktura a1-article-writing a1-decision-memo a1-promo-page a1-press-release a1-wayfinder a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

Для проектных скиллов выполните команду внутри проекта: используйте `--project` с `update` и уберите `--global` из `remove`.

## Помощь и обратная связь

Есть вопрос, идея или что-то сработало не так?<br>
Напишите в <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
