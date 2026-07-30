# editor-missing-draft-001 — Explicit Invocation Without a Selected Draft Requests One

- ID: `editor-missing-draft-001`
- Operation: `Entry Contract`
- Risk: An explicit invocation turns into new-copy creation even though the user selected no existing draft.
- Scope Scenario: `Out of scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
/a1-copy-editing

Напиши с нуля приветственное письмо для новых клиентов.
```

## Input

```text
None. The user has not pasted, attached, or named an existing draft.
```

## Must Change

- [ ] Коротко объяснить, что A1 Copy Editing редактирует или разбирает выбранный существующий черновик.
- [ ] Попросить вставить, приложить или назвать черновик и остановиться.

## Must Preserve

- [ ] Ответить на русском.
- [ ] Оставить запрос на новый текст невыполненным до появления выбранного черновика.

## Forbidden

- [ ] Не писать приветственное письмо или его фрагмент.
- [ ] Не придумывать аудиторию, содержание, обещания, CTA или факты для будущего письма.
- [ ] Не возвращать служебные разделы редакторского результата или support footer.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
