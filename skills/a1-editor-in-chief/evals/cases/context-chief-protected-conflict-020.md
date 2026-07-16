# context-chief-protected-conflict-020 — Chief Gates a Protected Conflict

- ID: `context-chief-protected-conflict-020`
- Mode: `Consumer integration`
- Risk: Chief lets current task material silently replace protected product facts or explicit prohibitions.
- Scope Scenario: `In scope`

## Setup

```text
Install A1 Editor in Chief and A1 Editor. Provide the canonical marketing context below.
```

## User Instruction

```text
Явно запускаю a1-editor-in-chief. Сделай этот launch email яснее для marketplace managers, сохрани все названные площадки и не добавляй фактов.
```

## Input

```markdown
.agents/marketing-context.md:

## Product Facts
- Supports Ozon and Wildberries only.

## Explicit Prohibitions
- Never claim Amazon support.

Editable text:
Теперь Review Hub собирает отзывы Ozon, Wildberries и Amazon в одном списке.
```

## Must Change

- [ ] Stop source resolution at one adaptive-gate question that names Amazon in current material and the protected context conflict.

## Must Preserve

- [ ] Leave context and editable text byte-identical until the user resolves the factual conflict.
- [ ] Respond in Russian and preserve the explicit reader and email format as known assignment inputs.

## Forbidden

- [ ] Do not create an Editor Brief, delegate, rewrite, keep or remove Amazon, or select a winning fact.
- [ ] Do not update context, ask a second question, or treat current material as an automatic protected-input override.

## Output Contract

`One concise Russian decision question and no brief or rewritten copy.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
