# editor-strategy-boundary-006 — Ordinary Editing Stays in Copy Editing Without Optional Context

- ID: `editor-strategy-boundary-006`
- Operation: `Shorten`
- Risk: Missing audience, channel, goal, or marketing context incorrectly routes a safe edit to Editor in Chief.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Сократи текст. Аудиторию, канал и отдельную цель пока не определяли.
```

## Input

```text
Важно отметить, что каждую пятницу команда сначала открывает свежий файл отчета, затем после этого сверяет даты и в самом конце убирает найденные дубли.
```

## Must Change

- [ ] Сразу выполнить обычное сокращение и вернуть естественно локализованные русские разделы с отредактированным текстом и описанием изменений.
- [ ] Убрать шаблонную вводную и повторы в последовательности действий.

## Must Preserve

- [ ] Сохранить пятницу, команду и порядок действий: открыть свежий файл, сверить даты, убрать дубли.
- [ ] Продолжить без marketing context, reader, channel и отдельного goal.

## Forbidden

- [ ] Не рекомендовать `a1-editor-in-chief`, не задавать chief-gate questions и не создавать Copy Editing Brief.
- [ ] Не придумывать аудиторию, канал, назначение отчета, выгоды, инструменты или CTA.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
