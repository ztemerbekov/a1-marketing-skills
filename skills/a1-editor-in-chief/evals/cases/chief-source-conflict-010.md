# chief-source-conflict-010 — Current Facts Override Marketing Context

- ID: `chief-source-conflict-010`
- Operation: `Clarify`
- Risk: Older repository context silently overrides current task facts.
- Scope Scenario: `In scope`

## Setup

Install both skills. Provide the marketing context below.

### Marketing Context

```markdown
- Reader: marketplace manager.
- Goal: explain the weekly review.
- Channel: internal email.
- Review schedule: Monday at 09:00.
```

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Для текущей задачи расписание изменилось: проверка проходит в пятницу в 16:00. Сделай email понятнее, сохрани три действия и не добавляй фактов.
```

## Input

```text
Менеджер открывает список отзывов Ozon и Wildberries, сверяет даты и убирает дубли.
```

## Must Change

- [ ] Дать current instruction приоритет над context и включить пятницу 16:00 в brief и финальный текст.
- [ ] Добавить короткое material warning о проигнорированном старом расписании.

## Must Preserve

- [ ] Сохранить три действия, Ozon, Wildberries, reader, goal и email channel.
- [ ] Продолжить без decision question, потому что precedence разрешает конфликт.

## Forbidden

- [ ] Не использовать Monday или 09:00 и не смешивать два расписания.
- [ ] Не спрашивать, какое расписание верно, и не добавлять новые факты.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
