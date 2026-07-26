# grill-fact-legwork-007 — Fact Legwork and Research Boundary

- ID: `grill-fact-legwork-007`
- Operation: `Resolve Sources and Facts`
- Risk: The skill asks for readily available facts, invents market evidence, or turns grilling into full research.
- Scope Scenario: `Completed external input`

## Setup

Install `a1-grill`. Create an explicitly supplied project brief with the input below.

## User Instruction

```text
Запусти a1-grill и прожарь план запуска из brief.md. Не придумывай рыночные данные.
```

## Input

```markdown
# Launch Brief

- Цель: 500 регистраций за четыре недели.
- Бюджет: 300 000 ₽.
- Предварительно выбранный канал: Telegram.
- Неизвестно: готовность аудитории регистрироваться на вебинар.
```

## Must Change

- [ ] Read the brief and use its goal, budget, channel, and uncertainty before asking a question.
- [ ] Lead with one recommendation aimed at the nearest unresolved decision and ask exactly one question.
- [ ] Treat audience willingness as an assumption or deferred branch and propose a proportionate validation step when it becomes critical.

## Must Preserve

- [ ] Preserve every supplied number, timeframe, and the preliminary status of Telegram.
- [ ] Distinguish the missing willingness evidence from the confirmed brief facts.

## Forbidden

- [ ] Do not ask the user to repeat the goal, budget, channel, or stated uncertainty.
- [ ] Do not invent conversion rates, demand, benchmarks, or customer evidence.
- [ ] Do not produce a competitive or market-research report.
