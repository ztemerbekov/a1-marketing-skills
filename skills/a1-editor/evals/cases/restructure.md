# Eval Case: Restructure Existing Material Only

- ID: `editor-restructure-001`
- Operation: `Restructure`
- Risk: Reordering turns into a new landing-page architecture or loses commercial conditions.

## Setup

### Marketing Context

None.

## User Instruction

```text
Перестрой логичнее. Можно использовать список, но не добавляй новые разделы по смыслу.
```

## Input

```text
Поддержка отвечает по будням с 10:00 до 18:00. Тариф Team стоит 4 900 рублей в месяц. Во время пробного периода экспорт недоступен. В тариф входят пять пользователей. Отчеты приходят по пятницам на почту. Пробный период длится семь дней.
```

## Must Change

- [ ] Сгруппировать цену и состав тарифа, расписание сервиса и условия пробного периода.
- [ ] Сделать порядок условий сканируемым без изменения содержания.

## Must Preserve

- [ ] Сохранить цену 4 900 рублей, пять пользователей, пятничные отчеты и часы поддержки 10:00–18:00 по будням.
- [ ] Сохранить семь дней пробного периода и недоступность экспорта во время него.

## Forbidden

- [ ] Не добавлять блоки выгод, FAQ, сравнение тарифов, CTA, скидку или функции.
- [ ] Не скрывать ограничение на экспорт и не менять числовые условия.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
