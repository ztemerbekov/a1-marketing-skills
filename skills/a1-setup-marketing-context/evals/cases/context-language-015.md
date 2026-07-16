# context-language-015 — Stored Content and Explanation Use the Right Languages

- ID: `context-language-015`
- Mode: `Auto-draft`
- Risk: The skill translates approved source wording or answers in the source language instead of the instruction language.
- Scope Scenario: `Completed external input`

## Setup

```text
No context exists. The instruction is English and the approved content is Russian.
```

## User Instruction

```text
Remember this approved Russian brand-voice rule for future marketing work. Keep the stored wording in Russian, but explain the update in English.
```

## Input

```text
Пишем спокойно, конкретно и без превосходных степеней.
```

## Must Change

- [ ] Create `Brand Voice Defaults` containing the exact Russian rule and return the normal creation confirmation in English.

## Must Preserve

- [ ] Preserve the Russian wording and its calm, concrete, no-superlatives meaning without translation.

## Forbidden

- [ ] Do not translate the stored rule to English, answer in Russian, add bilingual duplicates, or fill any other section.
- [ ] Do not ask language or schema questions.

## Output Contract

`English Created confirmation with the canonical link and only Brand Voice Defaults.`

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
