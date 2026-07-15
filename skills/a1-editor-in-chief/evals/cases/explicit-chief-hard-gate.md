# Eval Case: Explicit Chief Invocation Runs the Hard Gate

- ID: `chief-explicit-002`
- Operation: `Hard Gate`
- Risk: An explicitly invoked chief either skips required assignment fields or asks an open-ended strategy interview.

## Setup

Install `skills/a1-editor-in-chief/` together with the sibling `skills/a1-editor/` dependency.

### Marketing Context

None.

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Помоги поставить задачу для этого текста.
```

## Input

```text
Наша команда предлагает качественное решение для работы с отзывами клиентов.
```

## Must Change

- [ ] Показать краткий `What I Understand`, затем одним компактным блоком спросить только пять обязательных полей: Reader, Text Goal, Channel or Format, Constraints и Editing Operation.
- [ ] После blocking questions остановиться и дождаться ответа пользователя.

## Must Preserve

- [ ] Сохранить исходный текст без изменений до прохождения hard gate.
- [ ] Не считать отсутствие marketing context отдельным блокером или шестым обязательным полем.

## Forbidden

- [ ] Не создавать Editor Brief, не переписывать текст и не выполнять handoff до ответа пользователя.
- [ ] Не задавать дополнительные вопросы о бюджете, конкурентах, воронке, метриках или бизнес-стратегии.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
