# chief-context-filled-006 — Marketing Context Fills the Gate

- ID: `chief-context-filled-006`
- Operation: `Restructure`
- Risk: The chief asks the user to repeat assignment inputs already present in marketing context.
- Scope Scenario: `In scope`

## Setup

Install both skills. Provide the marketing context below.

### Marketing Context

```markdown
- Reader: support team leads who already use the weekly report.
- Goal: make the weekly review order easy to follow.
- Channel: internal knowledge-base note.
- Constraints: preserve Friday, Ozon, Wildberries, and the three actions; add no claims.
- Voice: direct and practical.
```

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Используй доступный маркетинговый контекст, поставь редакционную задачу и доведи текст до финала.
```

## Input

```text
По пятницам команда открывает отзывы из Ozon и Wildberries. Потом сверяет даты. После этого убирает дубли.
```

## Must Change

- [ ] Заполнить reader, goal, channel, constraints и voice из context без вопросов.
- [ ] Выбрать restructure, делегировать Copy Editing и вернуть reviewed text с естественно локализованным русским разделом изменений.

## Must Preserve

- [ ] Сохранить пятницу, обе площадки и порядок трёх действий.
- [ ] Сохранить direct practical voice и knowledge-base format.

## Forbidden

- [ ] Не просить повторить context fields и не считать отсутствие этих полей в current instruction блокером.
- [ ] Не добавлять claims, benefits, tools, metrics или CTA.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
