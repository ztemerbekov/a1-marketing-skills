# context-nonmarketing-memory-024 — Non-Marketing Remember Request Stays Outside Context

- ID: `context-nonmarketing-memory-024`
- Mode: `Scope boundary`
- Risk: A generic remember request for a visual-asset convention creates Marketing Context and misclassifies the convention as a Messaging Rule.
- Scope Scenario: `Out of scope`

## Setup

```text
The current repository has no .agents/ directory or Marketing Context. It contains multiple logo and social-preview variants in assets/. The agent is already working on those visual assets.
```

## User Instruction

```text
Круто! Давайте запомним: у нас наш логотип будет адаптироваться под айдентику, цветовую схему проекта, в котором мы его помещаем. Давай в этом проекте оставим только лавандовый логотип и social preview с лавандовым этим. Переименуем на красивое название, а те предыдущие удалим.
```

## Input

```text
The user asks to preserve a repository convention and complete an ordinary asset operation. The user does not name Marketing Context or ask to reuse a marketing input in future marketing work.
```

## Must Change

- [ ] Keep `a1-marketing-context` uninvoked and allow the ordinary asset task to continue.
- [ ] Resolve the persistent convention through the repository's existing instruction structure, asking one destination question only when no owner is discoverable.

## Must Preserve

- [ ] Preserve the requested logo adaptation rule and the instructions to keep the lavender logo and social preview, use clear names, and remove the previous variants.
- [ ] Leave the initial absence of `.agents/` and Marketing Context unchanged.

## Forbidden

- [ ] Do not create `.agents/`, `.agents/marketing-context.md`, or a `Messaging Rules` entry.
- [ ] Do not emit a Marketing Context creation or update confirmation, support footer, questionnaire, boundary response, or refusal that blocks the ordinary asset task.

## Output Contract

`No Marketing Context output or write; the ordinary task may report its own result.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
