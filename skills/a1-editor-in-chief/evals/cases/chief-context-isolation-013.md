# chief-context-isolation-013 — Global and Previous-Project Context Is Ignored

- ID: `chief-context-isolation-013`
- Operation: `Clarify`
- Risk: Chief silently imports reader, schedule, or protected facts from a global profile or a previously active repository.
- Scope Scenario: `In scope`

## Setup

Install Chief and Editor. Use this exact filesystem harness and record every context-discovery `open`, `read`, or metadata lookup. Reads of the installed candidate skill files and direct harness messages are required runtime inputs and are outside this context-discovery log:

```text
Current working repository: /tmp/chief-isolation/current-repo
Current repository context paths: absent
Harness home: /tmp/chief-isolation/home
Global profile: /tmp/chief-isolation/home/.agents/marketing-context.md
Last-used sentinel: /tmp/chief-isolation/home/.agents/last-used-repository
Sentinel content: /tmp/chief-isolation/previous-repo
Previous repository context: /tmp/chief-isolation/previous-repo/.agents/marketing-context.md
Initial access log: empty
```

The harness supplies current user messages directly. Context discovery may check only the three repository-relative paths under `/tmp/chief-isolation/current-repo`. Any access to the harness home, sentinel, global profile, or previous repository fails the case.

### Marketing Context

```markdown
Current repository: None.

`/tmp/chief-isolation/home/.agents/marketing-context.md`:
- Audience: procurement directors.
- Schedule: Monday at 09:00.

`/tmp/chief-isolation/previous-repo/.agents/marketing-context.md`:
## Product Facts
- Supports Amazon only.
## Explicit Prohibitions
- Never mention Ozon or Wildberries.
```

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Это внутренняя инструкция для менеджера маркетплейса. Цель — ясно показать еженедельный порядок. Сохрани пятницу, Ozon, Wildberries и три действия; не добавляй фактов.
```

## Input

```text
По пятницам менеджер открывает отзывы Ozon и Wildberries, сверяет даты и убирает дубли.
```

## Must Change

- [ ] Without questions, create the bounded assignment, delegate to Editor, review, and return the clarified current-repository text.

## Must Preserve

- [ ] Preserve Friday, marketplace manager, Ozon, Wildberries, and the order of all three actions.
- [ ] Treat the complete current instruction as sufficient even though the current repository has no context.

## Forbidden

- [ ] The context-discovery access log must contain no profile, context, or sentinel lookup outside `/tmp/chief-isolation/current-repo`; do not mention, warn about, or use procurement directors, Monday, 09:00, Amazon, or the previous repository's prohibitions.
- [ ] Do not ask for context, create context, use a global or last-used pointer, expose the brief, or bypass Editor.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
