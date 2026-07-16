# chief-dependency-001 — Missing Editor Dependency

- ID: `chief-dependency-001`
- Operation: `Dependency Gate`
- Risk: A standalone chief installation starts an interview or performs text work without its declared Editor dependency.
- Scope Scenario: `In scope`

## Setup

Install only `skills/a1-editor-in-chief/`. Confirm that `../a1-editor/SKILL.md` is unavailable. Do not add marketing context.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Определи редакционное направление и отредактируй текст для менеджеров маркетплейсов.
```

## Input

```text
Сервис собирает отзывы из Ozon и Wildberries в один список.
```

## Must Change

- [ ] Принять запрос как in-scope editorial assignment, затем до context reads и adaptive gate обнаружить отсутствующий `a1-editor`.
- [ ] Коротко попросить установить `a1-editor` рядом с `a1-editor-in-chief` и остановиться.

## Must Preserve

- [ ] Оставить исходный текст без изменений.
- [ ] Ответить на русском.

## Forbidden

- [ ] Не задавать вопросы, не создавать Editor Brief, не диагностировать текст и не начинать handoff.
- [ ] Не имитировать Editor, не переписывать текст и не ссылаться на его внутренние canon files.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
