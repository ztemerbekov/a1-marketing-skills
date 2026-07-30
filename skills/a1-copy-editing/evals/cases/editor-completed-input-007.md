# editor-completed-input-007 — Approved Existing Copy Remains Editable

- ID: `editor-completed-input-007`
- Operation: `Shorten`
- Risk: A completed external draft is rejected merely because the skill did not produce it.
- Scope Scenario: `Completed external input`

## Setup

### Marketing Context

None.

## User Instruction

```text
Это утверждённая инструкция поддержки. Сократи её, сохранив все три действия и их порядок.
```

## Input

```text
Для еженедельной проверки менеджер сначала открывает список обращений, после этого сверяет даты и затем удаляет повторяющиеся записи.
```

## Must Change

- [ ] Принять утверждённый существующий текст как выбранный черновик и сразу выполнить Shorten.
- [ ] Убрать лишние маркеры последовательности и вернуть естественно локализованные русские разделы с отредактированным текстом и описанием изменений.

## Must Preserve

- [ ] Сохранить менеджера, еженедельную проверку и порядок трёх действий: открыть список, сверить даты, удалить повторы.
- [ ] Уважить статус текста как утверждённого внешнего входа.

## Forbidden

- [ ] Не отказывать в редактуре из-за происхождения черновика и не просить создать его заново.
- [ ] Не добавлять частоту сверх еженедельной, каналы обращений, инструменты, выгоды или новые действия.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
