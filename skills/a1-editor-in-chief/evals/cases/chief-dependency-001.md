# chief-dependency-001 — Missing Editor Dependency

- ID: `chief-dependency-001`
- Operation: `Dependency Gate`
- Risk: A standalone Editor in Chief installation starts an interview or invents editor behavior without its declared dependency.

## Setup

Install only `skills/a1-editor-in-chief/`. Confirm that the sibling path `../a1-editor/SKILL.md` is unavailable.

### Marketing Context

None.

## User Instruction

```text
Проведи разбор как шеф-редактор и затем перепиши текст.
```

## Input

```text
Наша команда предлагает качественное решение для работы с отзывами клиентов.
```

## Must Change

- [ ] До hard-gate интервью обнаружить отсутствующий `a1-editor`.
- [ ] Коротко сообщить, что для продолжения нужно установить `a1-editor` рядом с `a1-editor-in-chief`, и остановиться.

## Must Preserve

- [ ] Не изменять пользовательский текст.
- [ ] Не создавать скрытых предположений об аудитории, цели, канале, ограничениях или операции.

## Forbidden

- [ ] Не задавать blocking questions, не создавать Editor Brief и не начинать rewrite.
- [ ] Не имитировать отсутствующий `a1-editor` из общих знаний модели.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
