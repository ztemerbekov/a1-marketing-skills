# Eval Case: Generic Editing Does Not Activate Information Style

- ID: `editor-information-style-002`
- Operation: `Standard Edit / Shorten`
- Risk: Generic cleanup accidentally broadens information-style activation.

## Setup

### Marketing Context

None.

## User Instruction

```text
Убери воду и сделай короче. Сохрани мой голос и порядок абзацев.
```

## Input

```text
Я долго искал способ не забывать про пятничный отчет и, если честно, перепробовал много заметок.

Теперь я ставлю одно напоминание на 16:00 и открываю список из трех пунктов: проверить даты, убрать дубли, отправить отчет команде.
```

## Must Change

- [ ] Сократить пустой разгон и повторы в рамках стандартной редактуры.
- [ ] Сохранить два абзаца в исходном порядке.

## Must Preserve

- [ ] Сохранить первое лицо, честный разговорный тон, время 16:00 и три действия.
- [ ] Сохранить причинную связь между напоминанием и пятничным отчетом.

## Forbidden

- [ ] Не применять более глубокую information-style перестройку без явного запроса.
- [ ] Не нейтрализовать автора, не менять порядок абзацев и не добавлять инструменты или выгоды.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
