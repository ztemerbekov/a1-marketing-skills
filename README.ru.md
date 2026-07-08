![Marketing Skills](./assets/marketing-skills-evolution.png)

# Marketing Skills

[English](./README.md) | **Русский**

Маркетинговые skills для AI-агентов.

Этот репозиторий следует формату Agent Skills: каждый skill — это самодостаточная папка с файлом `SKILL.md` и опциональными `references/`, `scripts/` или `assets/`.

## Содержание

- [Установка](#установка)
- [Skills](#skills)
- [Архитектура](#архитектура)
- [Поддержка платформ](#поддержка-платформ)
- [Философия совместимости](#философия-совместимости)
- [Разработка](#разработка)

## Установка

### <img src="./assets/vercel.webp" alt="npx skills" width="24" height="24"> Рекомендуемый способ: npx skills

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

### <img src="./assets/codex.webp" alt="Codex" width="24" height="24"> Codex

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

### <img src="./assets/claude.webp" alt="Claude Code" width="24" height="24"> Claude Code

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

### <img src="./assets/cursor.webp" alt="Cursor" width="24" height="24"> Cursor

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

### <img src="./assets/antigravity.webp" alt="Antigravity" width="24" height="24"> Antigravity

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
| [a1-editor](skills/a1-editor/) | Быстрый редактор и rewrite assistant для маркетингового текста. Используется, когда пользователь хочет сократить, переписать, усилить, почистить или улучшить текст. |
| [a1-editor-in-chief](skills/a1-editor-in-chief/) | Стратегический редактор-директор для строгого разбора текста, вопросов, создания Editor Brief и передачи задачи в editor. |
| [a1-setup-marketing-context](skills/a1-setup-marketing-context/) | Создает или обновляет общий marketing context для репозитория: продукт, аудитории, позиционирование, голос, proof, vocabulary, examples и business goals. |

## Архитектура

Система v1 состоит из трех skills:

- `a1-setup-marketing-context`: создает и обновляет общий файл `.agents/marketing-context.md` для репозитория.
- `a1-editor`: публичный, auto-triggered skill для переписывания текста с soft gate.
- `a1-editor-in-chief`: command-only стратегический редактор с hard gate, Editor Brief и handoff в `a1-editor`.

`a1-setup-marketing-context` общий для всех будущих маркетинговых skills. Он хранит продукт, аудиторию, позиционирование, голос, proof и бизнес-контекст. Он не хранит редакторский canon.

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
