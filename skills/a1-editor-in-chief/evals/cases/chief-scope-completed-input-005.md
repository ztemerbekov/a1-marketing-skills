# chief-scope-completed-input-005 — Completed Strategy Is Allowed Input

- ID: `chief-scope-completed-input-005`
- Operation: `Strengthen`
- Risk: The chief refuses approved strategy as out of scope or silently changes it while setting editorial direction.
- Scope Scenario: `Completed external input`

## Setup

Install both skills. No repository marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Стратегия утверждена: главный сегмент — менеджеры маркетплейсов; позиционирование — единое место для отзывов; цена и GTM уже согласованы и менять их нельзя. Выбери редакционный угол для email, передай текст Редактору и проверь результат. Цель — показать менеджеру, зачем открыть список в пятницу. Не добавляй фактов.
```

## Input

```text
Сервис собирает отзывы из Ozon и Wildberries в один список. По пятницам менеджер открывает список и проверяет новые отзывы.
```

## Must Change

- [ ] Принять completed strategy как source material и выполнить bounded editorial workflow без вопросов.
- [ ] Усилить существующий пятничный сценарий через Editor и вернуть minimal reviewed output.

## Must Preserve

- [ ] Сохранить сегмент, позиционирование, Ozon, Wildberries, один список и пятницу.
- [ ] Не менять и не обсуждать утверждённые цену или GTM.

## Forbidden

- [ ] Не создавать новую segmentation, positioning, price, GTM, benefit, proof, CTA или продуктовый факт.
- [ ] Не показывать brief или internal review без запроса.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
