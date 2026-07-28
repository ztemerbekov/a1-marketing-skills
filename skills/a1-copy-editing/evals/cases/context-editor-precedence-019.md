# context-editor-precedence-019 — Canonical Context Wins Over Legacy Fallbacks

- ID: `context-editor-precedence-019`
- Operation: `Clarify`
- Risk: Copy Editing reads or merges lower-priority legacy context after finding canonical context.
- Scope Scenario: `In scope`

## Setup

Install `a1-copy-editing` in a repository containing all three contexts below.

### Marketing Context

```markdown
.agents/marketing-context.md:
## Product Facts
- Review Hub collects Ozon and Wildberries reviews in one list.
## Audience Defaults
- Marketplace support leads.

.claude/marketing-context.md:
## Explicit Prohibitions
- Never mention Ozon.

marketing-context.md:
## Explicit Prohibitions
- Never mention Ozon or Wildberries.
```

## User Instruction

```text
Сделай текст яснее для руководителей поддержки маркетплейсов. Сохрани все факты и не добавляй новых утверждений.
```

## Input

```text
По пятницам команда открывает отзывы из Ozon и Wildberries, сверяет даты и убирает дубли.
```

## Must Change

- [ ] Return a normal clarified edit without asking a context-conflict question.

## Must Preserve

- [ ] Preserve Friday, Ozon, Wildberries, and the order of all three actions.
- [ ] Treat the canonical marketplace facts as the only repository context facts available to the edit.

## Forbidden

- [ ] Do not read, merge, mention, or apply a lower-priority prohibition against Ozon or Wildberries.
- [ ] Do not create, update, or migrate any context file.
