# editor-combined-review-023 — Combined Rewrite and Review Remain Non-Duplicative

- ID: `editor-combined-review-023`
- Operation: `Standard Edit` with `Substantive Review`
- Risk: The skill rejects an accepted combined request, returns only one deliverable, or repeats the change summary as substantive feedback.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Перепиши этот абзац яснее и затем дай содержательный разбор: что в аргументе всё ещё требует решения автора. Не повторяй список внесённых правок.
```

## Input

```text
Важно отметить, что новый отчёт является очень полезным инструментом для команды, потому что он собирает данные в одном месте. Мы считаем, что это, возможно, ускорит согласование, но пока не измеряли время и не определили, кто принимает финальное решение.
```

## Must Change

- [ ] Return a clearer rewrite followed by a substantive review.
- [ ] Identify the unmeasured time effect and missing decision owner as unresolved author decisions or source gaps.
- [ ] Keep recommendations limited to next moves the rewrite cannot perform.

## Must Preserve

- [ ] Preserve that the report collects data in one place, acceleration is tentative, time has not been measured, and the final decision owner is unknown.

## Forbidden

- [ ] Do not return review only, rewrite only, or reject the compatible combined request.
- [ ] Do not repeat wording changes as substantive findings or invent measured speed, an owner, workflow, proof, or product capability.
