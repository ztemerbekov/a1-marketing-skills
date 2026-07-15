# Eval Case: Explicit Chief Invocation Completes the Handoff

- ID: `chief-explicit-003`
- Operation: `Clarify`
- Risk: A complete chief assignment is questioned again, bypasses the Editor Brief, or invents material during handoff.

## Setup

Install `skills/a1-editor-in-chief/` together with the sibling `skills/a1-editor/` dependency. Run as a development evaluation so the Editor Brief is visible.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief.
Reader: менеджер маркетплейса, который уже работает с отчетом.
Text Goal: после письма понять порядок еженедельной проверки.
Channel or Format: внутреннее email-сообщение.
Constraints: сохранить пятницу, 16:00, Ozon, Wildberries и три действия; не добавлять факты.
Editing Operation: clarify.
```

## Input

```text
Важным моментом является то, что по пятницам в 16:00 менеджер сначала открывает список отзывов из Ozon и Wildberries, затем после этого сверяет даты и в самом конце убирает дубли.
```

## Must Change

- [ ] Показать `What I Understand`, создать Editor Brief со всеми пятью gate fields и выполнить clarify через правила `a1-editor`.
- [ ] Вернуть `Edited Version`, один-пять пунктов `What Changed` и `Chief Review`, подтверждающий соответствие brief.

## Must Preserve

- [ ] Сохранить пятницу, 16:00, Ozon, Wildberries и порядок трех действий.
- [ ] Сохранить reader, goal, email format, constraints и clarify operation без скрытых стратегических решений.

## Forbidden

- [ ] Не задавать blocking questions, потому что все обязательные поля уже даны.
- [ ] Не добавлять аудиторию, выгоды, метрики, CTA, offer, proof, новую структуру письма или фактические объяснения.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
