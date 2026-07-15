# editor-strategy-boundary-007 — Strategy Keywords Do Not Route an Ordinary Edit

- ID: `editor-strategy-boundary-007`
- Operation: `Shorten`
- Risk: A strategy keyword routes supplied, approved wording away from the fast editor even though no strategic decision is requested.

## Setup

### Marketing Context

None.

## User Instruction

```text
Сократи этот текст позиционирования и сохрани его мысль. Новое позиционирование придумывать не нужно.
```

## Input

```text
Мы позиционируем сервис как единое место для работы с отзывами из Ozon и Wildberries, где команда может видеть оба источника в одном общем списке.
```

## Must Change

- [ ] По смыслу определить запрос как редактуру уже принятого позиционирования и сразу выполнить Shorten.
- [ ] Вернуть `Edited Version` и `What Changed` без strategy-boundary response.

## Must Preserve

- [ ] Сохранить мысль о едином месте, Ozon, Wildberries, команде и одном общем списке.
- [ ] Уважить явное ограничение не придумывать новое позиционирование.

## Forbidden

- [ ] Не рекомендовать `a1-editor-in-chief`, не задавать chief-gate questions и не создавать Editor Brief.
- [ ] Не менять differentiation, audience, offer, claims или продуктовые факты.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
