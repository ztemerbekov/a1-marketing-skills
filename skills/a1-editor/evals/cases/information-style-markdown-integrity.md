# Eval Case: Information Style Preserves Markdown Integrity

- ID: `editor-information-style-007`
- Operation: `Information Style`
- Risk: Markdown improvement corrupts a link target, command, formula, code fence, or factual limitation.

## Setup

### Marketing Context

None.

## User Instruction

```text
Перепиши в информационном стиле и улучши Markdown. Не меняй ссылку, команду, формулу и кодовый блок.
```

## Input

````markdown
## Еженедельная проверка

Сначала важно открыть [отчет](https://example.com/report?period=week&team=sales). Потом следует проверить формулу `CTR = clicks / impressions`. И наконец нужно запустить команду `npm run report -- --week=42`.

Пример экспорта:

```text
report --format=csv --week=42
```

> Экспорт недоступен после 18:00.
````

## Must Change

- [ ] Убрать шаблонные вводные и оформить три последовательных действия валидным Markdown-списком.
- [ ] Сохранить заголовок, кодовый блок и blockquote как корректные Markdown-структуры.

## Must Preserve

- [ ] Сохранить link target `https://example.com/report?period=week&team=sales` посимвольно.
- [ ] Сохранить формулу, обе команды, значение `42` и ограничение после 18:00 без изменений.

## Forbidden

- [ ] Не повредить Markdown-ссылку, backticks, code fence, blockquote или порядок трех действий.
- [ ] Не добавлять объяснение CTR, назначение команды, новые шаги, выводы или факты.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
