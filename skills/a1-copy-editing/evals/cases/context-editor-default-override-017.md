# context-editor-default-override-017 — Copy Editing May Override Context Defaults

- ID: `context-editor-default-override-017`
- Mode: `Consumer integration`
- Risk: Copy Editing treats an audience or voice default as an immutable product fact and blocks a valid task-specific edit.
- Scope Scenario: `In scope`

## Setup

```text
Install A1 Copy Editing and provide the canonical marketing context below. Do not invoke Marketing Context setup.
```

## User Instruction

```text
Rewrite this for agency owners rather than marketplace managers. Use a firmer voice for this task and add no facts.
```

## Input

```markdown
.agents/marketing-context.md:

## How to Use This Context
- Defaults in Audience Defaults, Brand Voice Defaults, and Business Goal Defaults guide a task only when the current request is silent.
- Protected inputs in Product Facts, Claims and Evidence, and Explicit Prohibitions must not be contradicted, weakened, or silently replaced.

## Product Facts
- Review Hub collects Ozon and Wildberries reviews in one list.

## Audience Defaults
- Marketplace managers.

## Brand Voice Defaults
- Calm and explanatory.

Editable text:
Review Hub collects Ozon and Wildberries reviews in one list, so you can review both stores in one place.
```

## Must Change

- [ ] Return an edit addressed to agency owners in a firmer voice because both task values explicitly override defaults.

## Must Preserve

- [ ] Preserve the one-list function and both supported marketplaces as protected product facts.
- [ ] Leave `.agents/marketing-context.md` byte-identical.

## Forbidden

- [ ] Do not block on, warn about, or ask to update the audience or voice defaults.
- [ ] Do not add a marketplace, capability, benefit, metric, or claim.

## Output Contract

`Normal Copy Editing result for agency owners, without a context-maintenance confirmation or question.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
