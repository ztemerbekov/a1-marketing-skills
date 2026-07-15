# Eval Case: Ask Only for Significant Ambiguity

- ID: `editor-ambiguity-001`
- Operation: `Clarify / Soft Gate`
- Risk: The editor silently chooses a materially different product meaning.

## Setup

### Marketing Context

None.

## User Instruction

```text
Замени местоимение «он» названием конкретного тарифа, чтобы в итоговом тексте не было неоднозначности.
```

## Input

```text
Мы сравнили тарифы Basic и Pro. Он включает экспорт отчетов и доступ для пяти сотрудников.
```

## Must Change

- [ ] Вместо догадки задать один короткий вопрос: какой тариф — Basic или Pro — нужно подставить вместо `он`.
- [ ] Остановиться до редактуры и дождаться ответа.

## Must Preserve

- [ ] Сохранить обе возможные трактовки до ответа пользователя.
- [ ] Не требовать аудиторию, канал, цель, тон или marketing context.

## Forbidden

- [ ] Не назначать функции тарифу Basic или Pro без ответа.
- [ ] Не выдавать отредактированную версию с выбранным наугад тарифом или с обобщением, которое не выполняет просьбу назвать конкретный тариф.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
