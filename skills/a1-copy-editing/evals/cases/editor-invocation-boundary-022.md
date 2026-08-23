# editor-invocation-boundary-022 — Pasted Copy and Ordinary Intent Activate Editing

- ID: `editor-invocation-boundary-022`
- Operation: `Standard Edit`
- Risk: Tightening invocation to require a selected draft breaks ordinary editing intent expressed without a formal command.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

Run with `a1-copy-editing` installed for model invocation.

## User Instruction

```text
Слишком водянисто:
```

## Input

```text
Важно отметить, что наша команда на регулярной основе осуществляет проверку новых обращений клиентов и затем после этого отвечает на них.
```

## Must Change

- [ ] Распознать вставленный текст и жалобу `слишком водянисто` как обычный запрос на редактуру.
- [ ] Убрать вводную, канцеляризмы и повтор последовательности, сразу вернув более плотный вариант.

## Must Preserve

- [ ] Сохранить команду, регулярную проверку новых обращений и последующие ответы на них.
- [ ] Не запрашивать дополнительные вводные.

## Forbidden

- [ ] Не оставлять текст без редактуры и не просить пользователя сформулировать формальную команду.
- [ ] Не придумывать частоту проверки, каналы обращений, аудиторию, метрики, выгоды или CTA.
