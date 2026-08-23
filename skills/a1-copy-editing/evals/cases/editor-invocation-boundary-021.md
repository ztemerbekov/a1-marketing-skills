# editor-invocation-boundary-021 — Selected Draft Activates Text Review

- ID: `editor-invocation-boundary-021`
- Operation: `Text Review`
- Risk: A narrow invocation trigger fails to recognize an explicitly selected repository draft.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

Create `landing.md` with exactly the content in Input. Run with `a1-copy-editing` installed for model invocation.

## User Instruction

```text
Дай фидбек на черновик `landing.md`. Пока не переписывай.
```

## Input

```text
Наша инновационная платформа помогает бизнесу расти быстрее. Команда видит обращения клиентов в одном окне и может отвечать на них. Это лучшее решение на рынке.
```

## Must Change

- [ ] Принять явно выбранный `landing.md` как редактируемый исходник и выполнить Text Review.
- [ ] Приоритизировать расплывчатые и неподтверждённые утверждения, сохранив конкретную функцию про обращения в одном окне.

## Must Preserve

- [ ] Соблюдать просьбу пока не переписывать черновик.
- [ ] Ограничить анализ выбранным `landing.md` и фактами внутри него.

## Forbidden

- [ ] Не просить пользователя вставить уже выбранный черновик и не выбирать другие файлы репозитория.
- [ ] Не возвращать полный переписанный вариант и не придумывать аудиторию, доказательства, цифры роста или продуктовые функции.
