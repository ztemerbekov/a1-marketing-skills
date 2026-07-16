# context-protected-facts-013 — Defaults and Protected Inputs Stay Distinct

- ID: `context-protected-facts-013`
- Mode: `Auto-draft`
- Risk: A default update weakens product facts, evidence, or an explicit prohibition, or the file fails to communicate downstream consumption semantics.
- Scope Scenario: `Completed external input`

## Setup

```text
The canonical context exists with protected inputs. The user supplies an approved replacement audience default.
```

## User Instruction

```text
Обнови только audience default: теперь это агентства, которые ведут магазины на маркетплейсах.
```

## Input

```markdown
# Marketing Context

Last updated: 2026-07-10

## How to Use This Context

- Defaults guide a task when the current user request does not override them.
- Protected inputs must not be contradicted, weakened, or silently replaced. A material conflict requires clarification.

## Product Facts
- Supports Ozon and Wildberries only.

## Audience Defaults
- Marketplace managers.

## Claims and Evidence
- Processes up to 1,200 reviews per day.

## Explicit Prohibitions
- Never claim Amazon support.
```

## Must Change

- [ ] Replace only `Audience Defaults` with the approved agency audience and update the date.

## Must Preserve

- [ ] Preserve the schema note, `Ozon and Wildberries only`, `up to 1,200`, and the Amazon prohibition exactly as protected inputs.

## Forbidden

- [ ] Do not treat protected inputs as overridable defaults, weaken `only` or `up to`, add Amazon, or rewrite evidence.
- [ ] Do not alter Product Facts, Claims and Evidence, Explicit Prohibitions, or any other field.

## Output Contract

`Updated` confirmation linking the file and listing only `Audience Defaults`.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
