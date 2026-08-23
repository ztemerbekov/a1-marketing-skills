# editor-information-style-008 — Information Style Preserves Formatting

- ID: `editor-information-style-008`
- Operation: `Information Style`
- Risk: Deep editing changes Markdown structures despite an explicit formatting-preservation constraint.

## Setup

### Marketing Context

None.

## User Instruction

```text
Перепиши в информационном стиле, но не меняй форматирование. Сохрани все Markdown-блоки, их порядок и количество.
```

## Input

````markdown
## Проверка отчета

Важно отметить, что **проверка** проходит по пятницам.

- Сначала нужно открыть [отчет](https://example.com/report).
- Затем следует сверить даты.

> Экспорт доступен только до 18:00.

| Поле | Значение |
|------|----------|
| Неделя | 42 |

```text
report --week=42
```
````

## Must Change

- [ ] Убрать шаблонные вводные и канцелярские слова только внутри существующих Markdown-блоков.
- [ ] Сделать формулировки двух шагов короче без изменения формы списка.

## Must Preserve

- [ ] Сохранить один заголовок, один абзац, два list items, один blockquote, таблицу и code fence в исходном порядке и количестве.
- [ ] Сохранить выделение слова `**проверка**`, link target, ограничение `18:00`, table value `42` и команду без изменений.

## Forbidden

- [ ] Не добавлять, не удалять, не объединять, не делить, не перемещать и не преобразовывать Markdown-структуры.
- [ ] Не менять уровень заголовка, тип списка, table shape, code-fence language или link target; не добавлять факты, выводы или CTA.
