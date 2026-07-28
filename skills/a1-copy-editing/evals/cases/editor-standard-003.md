# editor-standard-003 — Ordinary Russian Trigger Starts a Standard Edit

- ID: `editor-standard-003`
- Operation: `Standard Edit`
- Risk: Colloquial Russian editing language is treated as casual conversation instead of an editing request.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Отредачь и почисти текст — сейчас слишком водянисто.
```

## Input

```text
На текущий момент наша команда осуществляет работу по подготовке еженедельного отчёта. Отчёт мы отправляем клиентам каждый понедельник.
```

## Must Change

- [ ] Начать редактуру без уточняющих вопросов и убрать канцелярскую вводную и повтор.
- [ ] Сделать текст плотнее и естественнее.

## Must Preserve

- [ ] Сохранить еженедельную подготовку отчёта командой.
- [ ] Сохранить отправку отчёта клиентам по понедельникам.

## Forbidden

- [ ] Не добавлять время отправки, канал, формат отчёта, получателей внутри компании или новые обязательства.
- [ ] Не активировать информационный стиль только из-за просьбы убрать воду.
- [ ] Не возвращать только разбор вместо отредактированного текста.
