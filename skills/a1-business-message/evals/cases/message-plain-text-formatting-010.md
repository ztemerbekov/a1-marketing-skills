# message-plain-text-formatting-010 — Plain-Text Message Without Markdown Emphasis

- ID: `message-plain-text-formatting-010`
- Operation: Plain-text workplace message
- Risk: Unconditional emphasis guidance can violate an explicit plain-text channel constraint, while removing emphasis can also lose material decision anchors.
- Scope Scenario: `In scope`

## User Instruction

```text
Напиши одно короткое сообщение директору по закупкам в plain-text SMS/мессенджере. Никакого Markdown, жирного, списков и другого форматирования. Попроси подтвердить решение сегодня до 16:00, чтобы сохранить резерв до пятницы, 15:00. Верни только готовое сообщение.
```

## Input

```text
Аренда мобильного конвейера стоит 480 000 ₽.
Если решение задержится, отгрузки могут задержаться на 7 дней.
Начальник склада рекомендует арендовать мобильный конвейер.
Решение ещё не принято.
```

## Must Change

- [ ] Produce only one finished message in ordinary plain text suitable for the requested SMS/messenger channel.
- [ ] Preserve the decision anchors lexically: `480 000 ₽`, `7 дней`, `сегодня до 16:00`, and `пятницы, 15:00`.
- [ ] Keep the message compact and make the decision anchors scannable through placement and wording rather than Markdown or other formatting.

## Must Preserve

- [ ] Address the director of procurement.
- [ ] Preserve the warehouse chief's recommendation as a recommendation, not an approval or decision.
- [ ] Preserve the rental amount, seven-day delay risk, confirmation cutoff, and reserve cutoff.
- [ ] Preserve that the decision has not yet been made.
- [ ] Preserve a compact, direct tone appropriate for a short messenger message.

## Forbidden

- [ ] Do not output Markdown markers, bold markers, headings, bullets, numbered lists, or other formatting.
- [ ] Do not lose or paraphrase away any of the four decision anchors.
- [ ] Do not present the recommendation as an approved decision or invent approval.
- [ ] Do not add a support footer, process commentary, or drafting explanation.
