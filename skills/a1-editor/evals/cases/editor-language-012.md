# editor-language-012 — Edited-Text-Only Override Remains Wrapper-Free

- ID: `editor-language-012`
- Operation: `Shorten`
- Risk: The localization rule adds service headings or explanations when the user explicitly requested only edited copy.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Сократи английский текст. Сохрани английский язык и оба факта. Верни только готовый текст: без заголовков, пояснений, допущений и вариантов.
```

## Input

```text
Review Hub brings Ozon and Wildberries reviews together in one list, and the team checks that list every Friday.
```

## Must Change

- [ ] Вернуть только более компактный английский текст без служебной оболочки.

## Must Preserve

- [ ] Сохранить английский язык, Review Hub, Ozon, Wildberries, единый список и проверку по пятницам.

## Forbidden

- [ ] Не добавлять заголовки, подписи вариантов, пояснения, допущения, предупреждения или процессные заметки на любом языке.
- [ ] Не добавлять функции, метрики, автоматизацию, CTA или другие неподтверждённые утверждения.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
