# context-interview-stop-006 — Early Stop Keeps Partial Progress

- ID: `context-interview-stop-006`
- Mode: `Interview`
- Risk: Stopping an interview discards confirmed answers, forces completion, or leaves padded empty sections.
- Scope Scenario: `In scope`

## Setup

```text
No context exists. Run the declared multi-turn harness.
```

## User Instruction

```text
Давай настроим маркетинговый контекст через интервью.
```

## Input

```text
Answer 1: Сервис собирает отзывы Ozon и Wildberries в один список.
Answer 2: Утверждённая аудитория — менеджеры маркетплейсов.
Next user message: Стоп, на этом закончим.
```

## Must Change

- [ ] Save each of the two confirmed answers before the next question and stop immediately on the user's stop message.
- [ ] Leave a valid partial context with Product Facts and Audience Defaults only.

## Must Preserve

- [ ] Preserve both marketplaces, the one-list function, and the approved audience.

## Forbidden

- [ ] Do not ask any question after the stop message, delete the partial file, or add positioning, voice, proof, vocabulary, goals, empty headings, `Unknown`, or `TBD`.
- [ ] Do not describe the partial context as incomplete or unusable.

## Output Contract

Confirmation that the canonical file was updated, with a link and the two saved sections.
