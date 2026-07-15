# editor-information-style-002 — Generic Editing Does Not Activate Information Style

- ID: `editor-information-style-002`
- Operation: `Standard Edit / Shorten`
- Risk: Generic cleanup accidentally broadens information-style activation.

## Setup

### Marketing Context

None.

## User Instruction

```text
Почисти текст и убери воду. Сохрани ссылку и факт о трех ручных проверках.
```

## Input

```text
Я очень рад и невероятно счастлив поделиться находкой, о которой давно хотел рассказать.

На прошлой неделе я трижды сверял отчеты вручную и постоянно путался во вкладках.

В памятке есть порядок проверки: сначала выгрузить отчет, затем сверить даты и только потом отправить итог. Памятка: https://example.com/checklist
```

## Must Change

- [ ] Консервативно сократить пустой разгон и повторы в рамках стандартной редактуры.
- [ ] Улучшить ясность внутри оставшихся содержательных абзацев без глубокой перестройки.

## Must Preserve

- [ ] Сохранить содержательные абзацы в исходном порядке: сначала личный опыт, затем порядок проверки.
- [ ] Сохранить три ручные проверки, ссылку без изменений и три действия в исходном порядке.

## Forbidden

- [ ] Не выносить порядок проверки раньше личного опыта и не превращать три действия в Markdown-список.
- [ ] Не добавлять заголовки, инструменты, выгоды, назначение памятки или CTA.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
