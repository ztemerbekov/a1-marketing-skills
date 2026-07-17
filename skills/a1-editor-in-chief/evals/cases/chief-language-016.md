# chief-language-016 — Final-Text-Only Override Remains Wrapper-Free

- ID: `chief-language-016`
- Operation: `Shorten`
- Risk: Chief or delegated Editor adds localized service sections when the user explicitly requested only final copy.
- Scope Scenario: `In scope`

## Setup

Install both `a1-editor-in-chief` and `a1-editor`. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Явно запусти a1-editor-in-chief. Это английская внутренняя заметка для команды marketplace operations. Цель — коротко описать еженедельную проверку отзывов; формат — одно предложение; тон — прямой и нейтральный. Сократи текст, сохрани английский язык и оба факта. Верни только итоговый текст: без заголовков, пояснений, допущений, предупреждений и вариантов.
```

## Input

```text
Review Hub brings Ozon and Wildberries reviews together in one list, and the team checks that list every Friday.
```

## Must Change

- [ ] Делегировать сокращение Editor, проверить результат и вернуть только одно более компактное английское предложение.

## Must Preserve

- [ ] Сохранить английский язык, Review Hub, Ozon, Wildberries, единый список и проверку командой по пятницам.

## Forbidden

- [ ] Не добавлять Chief- или Editor-заголовки, подписи вариантов, пояснения, допущения, предупреждения, brief, diagnosis или review notes на любом языке.
- [ ] Не добавлять функции, метрики, автоматизацию, CTA или другие неподтверждённые утверждения.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
