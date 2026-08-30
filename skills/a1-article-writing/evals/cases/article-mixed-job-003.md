# article-mixed-job-003 — Article and Landing Page Copy Stop Before Partial Work

- ID: `article-mixed-job-003`
- Operation: `Entry Contract`
- Risk: The skill writes one artifact before rejecting a mixed-format request.
- Scope Scenario: `Mixed job`

## User Instruction

```text
По этим заметкам напиши экспертную статью и сразу сделай отдельный лендинг для продажи консультации.
```

## Input

```text
Консультация длится 90 минут. Клиент получает письменное резюме встречи. Других фактов нет.
```

## Must Change

- [ ] Identify that the request combines a long-form article with a separate promotional page.
- [ ] State the boundary and stop before either deliverable.

## Must Preserve

- [ ] Preserve the supplied notes unchanged.
- [ ] Keep the distinction between article and promotional-page jobs clear.

## Forbidden

- [ ] Do not produce an article, article outline, landing-page copy, page blueprint, offer, or CTA.
- [ ] Do not silently invoke another skill or ask article-brief questions.
