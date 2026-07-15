![Marketing Skills](./assets/marketing-skills-evolution.png)

# Marketing Skills

[English](./README.md) | **Русский**

Маркетинговые skills для AI-агентов.

Этот репозиторий следует формату Agent Skills: каждый skill — это самодостаточная папка с файлом `SKILL.md` и опциональными `references/`, `scripts/` или `assets/`.

## Содержание

- [Установка](#установка)
- [Skills](#skills)
- [Контракт проектирования](#контракт-проектирования)
- [Архитектура](#архитектура)
- [Поддержка платформ](#поддержка-платформ)
- [Философия совместимости](#философия-совместимости)
- [Разработка](#разработка)

## Установка

### <img src="./assets/vercel.webp" alt="npx skills" width="16" height="16"> Рекомендуемый способ: npx skills

Установить все текущие skills в текущий проект:

```bash
npx skills@latest add ztemerbekov/marketing-skills
```

Установить только редакторскую команду:

```bash
npx skills@latest add ztemerbekov/marketing-skills --skill a1-setup-marketing-context a1-editor a1-editor-in-chief
```

Удалить установленные project skills:

```bash
rm -rf .agents/skills/a1-setup-marketing-context \
       .agents/skills/a1-editor \
       .agents/skills/a1-editor-in-chief \
       .claude/skills/a1-setup-marketing-context \
       .claude/skills/a1-editor \
       .claude/skills/a1-editor-in-chief
```

Этот способ стоит использовать первым, когда нужна чистая cross-agent установка. Разделы по отдельным платформам ниже — это fallback-варианты или client-native альтернативы.

### <img src="./assets/codex.webp" alt="Codex" width="16" height="16"> Codex

Установить текущие skills из GitHub:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo ztemerbekov/marketing-skills \
  --path skills/a1-setup-marketing-context skills/a1-editor skills/a1-editor-in-chief
```

Удалить установленные skills:

```bash
rm -rf ~/.codex/skills/a1-setup-marketing-context \
       ~/.codex/skills/a1-editor \
       ~/.codex/skills/a1-editor-in-chief
```

После установки или удаления перезапустите Codex.

### <img src="./assets/claude.webp" alt="Claude Code" width="16" height="16"> Claude Code

Установить из GitHub:

```text
/plugin marketplace add ztemerbekov/marketing-skills
/plugin install marketing-skills
```

Установить только bundle редакторской команды:

```text
/plugin install editorial-team
```

Удалить установленные plugins:

```text
/plugin uninstall marketing-skills
/plugin uninstall editorial-team
/plugin marketplace remove marketing-skills
```

Для локальной разработки добавьте этот checkout как marketplace:

```text
/plugin marketplace add /Users/ztemerbekov/Documents/GitHub/marketing-skills
```

### <img src="./assets/cursor.webp" alt="Cursor" width="16" height="16"> Cursor

Поддержка Cursor работает как project adapter. Скопируйте canonical skills и Cursor rule в проект, где хотите их использовать:

```bash
mkdir -p .cursor/rules skills
cp -R /Users/ztemerbekov/Documents/GitHub/marketing-skills/skills/a1-* skills/
cp /Users/ztemerbekov/Documents/GitHub/marketing-skills/.cursor/rules/marketing-skills.mdc .cursor/rules/
```

Удалить их из проекта:

```bash
rm -rf skills/a1-setup-marketing-context \
       skills/a1-editor \
       skills/a1-editor-in-chief \
       .cursor/rules/marketing-skills.mdc
```

### <img src="./assets/antigravity.webp" alt="Antigravity" width="16" height="16"> Antigravity

Поддержка Antigravity использует cross-agent project convention. Скопируйте canonical skills в директорию `.agents/skills/` целевого проекта:

```bash
mkdir -p .agents/skills
cp -R /Users/ztemerbekov/Documents/GitHub/marketing-skills/skills/a1-* .agents/skills/
```

Для чистой установки из GitHub в текущий проект:

```bash
tmpdir="$(mktemp -d)"
git clone --depth 1 https://github.com/ztemerbekov/marketing-skills.git "$tmpdir/marketing-skills"
mkdir -p .agents/skills
cp -R "$tmpdir/marketing-skills"/skills/a1-* .agents/skills/
rm -rf "$tmpdir"
```

Удалить их из проекта:

```bash
rm -rf .agents/skills/a1-setup-marketing-context \
       .agents/skills/a1-editor \
       .agents/skills/a1-editor-in-chief
```

## Skills

| Skill | Описание |
|-------|----------|
| [a1-editor](skills/a1-editor/) | Быстрый редактор маркетингового текста и безопасный router стратегических запросов. Редактирует готовый текст, а запросы на новое позиционирование, оффер, аудиторию, кампанию или структуру лендинга направляет к явному запуску `a1-editor-in-chief` без автоматического интервью. |
| [a1-editor-in-chief](skills/a1-editor-in-chief/) | Стратегический редактор-директор для строгого разбора текста, вопросов, создания Editor Brief и передачи задачи в editor. |
| [a1-setup-marketing-context](skills/a1-setup-marketing-context/) | Создает или обновляет общий marketing context для репозитория: продукт, аудитории, позиционирование, голос, proof, vocabulary, examples и business goals. |

## Контракт проектирования

A1 skills скрывают сложность внутри и оставляют простой интерфейс для пользователя:

- Один публичный skill решает одну понятную задачу пользователя. Варианты остаются внутренними операциями, пока им не потребуется принципиально другой контракт взаимодействия.
- Безопасные точки входа на естественном языке запускаются моделью. Осознанные интервью и workflows с существенными последствиями запускаются пользователем или работают только как команды.
- Быстрые skills используют marketing context, если он есть, но продолжают работу без него. Стратегический skill может потребовать контекст, если иначе придется сделать небезопасный выбор.
- Результат зависит от материала, но процесс предсказуем: у каждого skill есть короткий неизменный каркас, а подробные references подключаются только по необходимости.

Для разработки используются канонические [контракт проектирования A1 skills](docs/a1-skill-design-contract.md) и [маркетинговый глоссарий A1](docs/a1-marketing-glossary.md). Каждый установленный skill остается самодостаточным.

Если skill дал плохой результат, удалите конфиденциальные данные и отправьте исходный текст, инструкцию, результат и ожидаемое поведение на [z.temerbekov@gmail.com](mailto:z.temerbekov@gmail.com).

## Архитектура

Система v1 состоит из трех skills:

- `a1-setup-marketing-context`: создает и обновляет общий файл `.agents/marketing-context.md` для репозитория.
- `a1-editor`: публичный, auto-triggered skill для переписывания текста с soft gate.
- `a1-editor-in-chief`: command-only стратегический редактор с hard gate, Editor Brief и handoff в `a1-editor`.

`a1-setup-marketing-context` общий для всех будущих маркетинговых skills. Он хранит продукт, аудиторию, позиционирование, голос, proof и бизнес-контекст. Он не хранит редакторский canon.

## Сценарии и режимы редактуры

Выбирайте точку входа по тому, насколько подробно нужно поставить задачу:

| Сценарий | Когда использовать | Поведение |
|----------|--------------------|-----------|
| `a1-editor` | Текст и задача редактуры уже понятны | Сразу начинает работу через soft gate и возвращает отредактированный текст с кратким списком изменений |
| `a1-editor-in-chief` | Вы явно запускаете его, чтобы поставить стратегическую или редакционную задачу | Проходит hard gate, создает Editor Brief и передает выбранную операцию в `a1-editor` |

Оба сценария используют общие операции редактуры. Стандартные команды «отредактируй», «почисти», «сократи» или «сделай понятнее» сохраняют обычное, более бережное поведение редактора.

Запросы на создание или пересмотр позиционирования, оффера, аудитории, сообщений кампании, структуры лендинга или другой маркетинговой архитектуры находятся за границей A1 Editor. Редактор кратко объясняет границу и рекомендует явно запустить `a1-editor-in-chief`; он не начинает интервью шеф-редактора автоматически. Отсутствие аудитории, канала, цели, ограничений или marketing context не переводит обычный запрос на редактуру в другой skill.

Информационный стиль — отдельный явный режим. Он включается по однозначным командам «в информационном стиле», «в инфостиле», «по Ильяхову» или «по „Пиши, сокращай“». Режим может убрать пустое авторское вступление, нейтрализовать неподтвержденные оценки, перестроить существующий материал и улучшить Markdown. При этом он не добавляет факты, определения, утверждения и выводы из знаний модели. Явные ограничения вроде «сохрани мой голос» или «сохрани структуру» всегда имеют приоритет.

## Поддержка платформ

Canonical skills лежат в `skills/`.

Метаданные Claude Code plugin лежат в `.claude-plugin/`.

Поддержка Cursor лежит в `.cursor/rules/` как adapter. Cursor rules не являются source of truth.

Поддержка Antigravity использует `.agents/skills/` на уровне целевого проекта.

Maintainer scripts лежат в `scripts/` и не требуются после установки.

## Философия совместимости

Этот репозиторий следует формату Agent Skills с документированными прагматичными расширениями, когда поведение важнее строгой чистоты спецификации.

Разрешенное расширение:

- `disable-model-invocation: true` можно использовать для command-only skills вроде `a1-editor-in-chief`, где случайный auto-trigger дал бы неправильный workflow.

## Разработка

Проверить skills:

```bash
./scripts/validate-skills.sh
```

Синхронизировать таблицу skills в README и version metadata Claude plugin:

```bash
node scripts/sync-readme-and-plugin.js
```

### Завершение и сертификация

Перед завершением нового или существенно измененного skill используйте [чек-лист завершения A1 skill](docs/a1-skill-completion-checklist.md). Текущий semantic verdict A1 Editor, параметры окружения, список кейсов, release evidence и ограничения хранятся в [записи сертификации пилота](docs/a1-editor-pilot-certification.md). Структурная валидация и синхронизация metadata не заменяют semantic-прогон установленного skill.
