# editor-invocation-boundary-020 — Documentation Complaint Does Not Select a Draft

- ID: `editor-invocation-boundary-020`
- Operation: `Invocation Boundary`
- Risk: A conversational complaint about difficult documentation triggers A1 Copy Editing, selects an unmentioned repository file, and presents a skill result.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

Run with `a1-copy-editing` installed for model invocation. Do not name or invoke the skill in the user request.

## User Instruction

```text
Я прошу прощения, слушай, обычный пользователь. Я почитал инструкцию, как ставить MCP-сервер, и это суперсложно. Вот как пишут инструкцию для обычного пользователя?
```

## Input

```text
None. The user has not pasted, attached, or selected editable source material.
```

## Must Change

- [ ] Ответить на вопрос как на обычную разговорную реакцию о понятности пользовательской инструкции.
- [ ] Оставить невыбранные документы репозитория вне ответа.

## Must Preserve

- [ ] Сохранить русский язык и различить обсуждение качества инструкции от поручения отредактировать конкретный черновик.
- [ ] Не требовать от пользователя исходник, поскольку он не вызывал редакторский skill и не просил выполнить редактуру.

## Forbidden

- [ ] Не открывать, не выбирать и не разбирать README или другой документ, который пользователь не назвал целью редактуры.
- [ ] Не выдавать результат A1 Copy Editing, не заявлять о проведённом разборе конкретного текста и не добавлять футер A1 Marketing Skills.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
