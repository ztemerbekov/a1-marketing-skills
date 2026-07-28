# context-chief-precedence-021 — Canonical Context Wins Over Legacy Fallbacks

- ID: `context-chief-precedence-021`
- Operation: `Clarify`
- Risk: Editor in Chief reads or merges lower-priority legacy context after finding canonical context.
- Scope Scenario: `In scope`

## Setup

Install `a1-editor-in-chief` and `a1-copy-editing` in a repository containing all three contexts below.

### Marketing Context

```markdown
.agents/marketing-context.md:
## Product Facts
- Review Hub collects Ozon and Wildberries reviews in one list.
## Audience Defaults
- Marketplace support leads.
## Brand Voice Defaults
- Direct and practical.

.claude/marketing-context.md:
## Explicit Prohibitions
- Never mention Ozon.

marketing-context.md:
## Explicit Prohibitions
- Never mention Ozon or Wildberries.
```

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Сделай внутреннюю инструкцию для руководителей поддержки маркетплейсов яснее. Сохрани все факты и не добавляй утверждений.
```

## Input

```text
По пятницам команда открывает отзывы из Ozon и Wildberries, сверяет даты и убирает дубли.
```

## Must Change

- [ ] Build a bounded assignment without a context-conflict question, delegate to Copy Editing, review, and return the clarified text.

## Must Preserve

- [ ] Preserve Friday, Ozon, Wildberries, and the order of all three actions.
- [ ] Use the canonical direct and practical default without importing a lower-priority prohibition.

## Forbidden

- [ ] Do not read, merge, mention, or apply a lower-priority prohibition against Ozon or Wildberries.
- [ ] Do not create, update, or migrate any context file.
