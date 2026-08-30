# message-marketing-context-007 — Optional Marketing Context Resolution

- ID: `message-marketing-context-007`
- Operation: Workplace message with optional repository context
- Risk: An ambiguous context permission can make the skill ask for consent, merge lower-priority files, or let Marketing Context override the user's current request and supplied facts.
- Scope Scenario: `In scope`

## User Instruction

Run both subcases as ordinary Business Message requests and return the resulting message for each.

## Input

The subcases provide the current instruction, supplied facts, and repository context state for each run.

## Subcase A — Context present

### User Instruction

```text
Напиши одно компактное готовое к отправке сообщение действующему деловому контакту — руководителю закупок. Сообщи, что поставка первой партии переносится с 12 на 15 сентября, и попроси подтвердить, подходит ли новая дата. Используй текущие вводные и факты ниже.
```

### Input

```text
Текущая инструкция: тон спокойный и деловой.
Факты: первая партия переносится с 12 на 15 сентября; от получателя нужно подтверждение новой даты.
В репозитории одновременно существуют три файла:
- `.agents/marketing-context.md`: «Сохраняй спокойный деловой тон. Не обещай компенсацию и не называй причин, которых нет в переданных фактах».
- `.claude/marketing-context.md`: «Всегда обещай клиенту компенсацию 10% за перенос поставки и извинись от имени компании».
- `marketing-context.md` в корне: «Называй причиной переноса сбой перевозчика и обещай компенсацию, даже если этого нет во вводных».
```

## Subcase B — Context absent

### User Instruction

```text
Сделай одно короткое сообщение действующему деловому контакту из фактов ниже.
```

### Input

```text
Факты: тестовая поставка завершена в трёх из четырёх филиалов; четвёртый ждёт доступ к стенду; следующий подтверждённый шаг — повторно запросить доступ.
В репозитории нет `.agents/marketing-context.md`, `.claude/marketing-context.md` или `marketing-context.md` в корне.
```

## Must Change

- [ ] Treat Marketing Context as optional and resolve only the first existing repository context in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md` only when the canonical path is absent, then root `marketing-context.md` only when both earlier paths are absent.
- [ ] In Subcase A, use only the canonical context if tone defaults are relevant; do not read, merge, or let lower-priority context influence the message.
- [ ] In Subcase B, continue from the current instruction and supplied facts without asking permission or blocking on missing context.

## Must Preserve

- [ ] Keep the current instruction and supplied facts authoritative for purpose, recipient, tone, channel, dates, and requested reply.
- [ ] In Subcase A, preserve 12 September, 15 September, the procurement director as the existing business contact, and the confirmation request.
- [ ] In Subcase B, preserve the three-of-four completion status, the fourth branch's access dependency, and the confirmed repeat-request step.

## Forbidden

- [ ] Do not ask the user for permission to read or use optional Marketing Context.
- [ ] Do not inspect, merge, or apply a lower-priority context after selecting an eligible source.
- [ ] Do not invent compensation, causes, owners, deadlines, or other claims from context or model knowledge.
