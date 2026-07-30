# editor-mixed-job-008 — Mixed Editing and New-Copy Request Stops Before Partial Execution

- ID: `editor-mixed-job-008`
- Operation: `Entry Contract`
- Risk: The skill edits the selected draft or creates a second artifact before rejecting a mixed request.
- Scope Scenario: `Mixed job`

## Setup

### Marketing Context

None.

## User Instruction

```text
Почисти готовый абзац ниже и отдельно напиши с нуля приветственное письмо для новых клиентов.
```

## Input

```text
Важно отметить, что сервис собирает отзывы из Ozon и Wildberries в один общий список для команды.
```

## Must Change

- [ ] До copy-editing spine определить, что первый результат редактирует выбранный черновик, а второй создаёт отдельный новый текст.
- [ ] Коротко объяснить, что A1 Copy Editing редактирует или разбирает выбранные существующие черновики, и остановиться без выполнения обеих частей.

## Must Preserve

- [ ] Оставить исходный абзац неизменённым.
- [ ] Ответить на русском и оставить новый текст ненаписанным.

## Forbidden

- [ ] Не возвращать очищенную, сокращенную или иначе отредактированную версию абзаца, служебные разделы редакторского результата или другой частичный редакторский результат.
- [ ] Не писать приветственное письмо, его план, тему, CTA или отдельный фрагмент.
- [ ] Не задавать уточняющие вопросы и не начинать другой workflow автоматически.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
