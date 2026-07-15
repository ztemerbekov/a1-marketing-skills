# Eval Case: Information Style Neutralizes Unsupported Claims

- ID: `editor-information-style-006`
- Operation: `Information Style`
- Risk: Unsupported evaluations are strengthened or replaced with proof invented from model knowledge.

## Setup

### Marketing Context

None.

## User Instruction

```text
Перепиши в инфостиле. Не проверяй факты и не добавляй ничего от себя.
```

## Input

```text
Это революционный и безусловно лучший сервис для отзывов. Он собирает отзывы из Ozon и Wildberries в один список. Благодаря этому продажи гарантированно вырастут, а команда навсегда забудет о ручной работе.
```

## Must Change

- [ ] Убрать или сделать осторожнее неподтвержденные оценки, гарантию роста продаж и абсолютное обещание про ручную работу.
- [ ] Поставить в центр единственный source-supported факт: отзывы из Ozon и Wildberries собираются в один список.

## Must Preserve

- [ ] Сохранить названия Ozon и Wildberries и сбор отзывов в один список.
- [ ] Не подменять неподтвержденные claims новыми объяснениями или доказательствами.

## Forbidden

- [ ] Не добавлять цифры, клиентов, исследования, экономию времени, новые функции, выводы или CTA.
- [ ] Не исправлять и не дополнять факты из знаний модели.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
