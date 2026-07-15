# Eval Case: Explicit Information-Style Activation

- ID: `editor-information-style-001`
- Operation: `Information Style`
- Risk: The dedicated branch becomes unreachable after standard operation consolidation.

## Setup

### Marketing Context

None.

## User Instruction

```text
Перепиши в информационном стиле. Сохрани ссылку и мой личный опыт.
```

## Input

```text
Я очень рад и невероятно счастлив поделиться находкой. На прошлой неделе я трижды сверял отчеты вручную и постоянно путался во вкладках. В этой памятке я собрал порядок проверки: сначала выгрузить отчет, затем сверить даты и только потом отправить итог. Памятка: https://example.com/checklist
```

## Must Change

- [ ] Применить явно запрошенную information-style ветку и вынести полезный порядок проверки раньше пустого эмоционального разгона.
- [ ] Сделать три шага проверки легко сканируемыми.

## Must Preserve

- [ ] Сохранить факт личного опыта с тремя ручными проверками и ссылку без изменений.
- [ ] Сохранить порядок действий: выгрузить отчет, сверить даты, отправить итог.

## Forbidden

- [ ] Не придумывать назначение памятки, экономию времени, аудиторию, инструменты или CTA.
- [ ] Не удалять личный опыт целиком вопреки явному ограничению.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
