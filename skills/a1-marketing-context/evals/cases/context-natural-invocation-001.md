# context-natural-invocation-001 — Natural Request Starts Auto-draft

- ID: `context-natural-invocation-001`
- Mode: `Auto-draft`
- Risk: A natural setup request triggers a questionnaire, preview ceremony, or invented context instead of a safe direct draft.
- Scope Scenario: `In scope`

## Setup

```text
Current repository has no .agents/ directory or marketing context. README.md is authoritative project material.
```

## User Instruction

```text
Set up marketing context for this repository.
```

## Input

```markdown
# Review Hub

Review Hub collects Ozon and Wildberries reviews in one list for marketplace managers.
Our approved voice is practical and direct.
```

## Must Change

- [ ] Start Auto-draft from the ordinary explicit request and create `.agents/marketing-context.md` without an interview or mandatory preview.
- [ ] Store only Product Facts, Audience Defaults, and Brand Voice Defaults supported by the README.

## Must Preserve

- [ ] Preserve both marketplace names, the one-list function, marketplace managers, and the practical direct voice.
- [ ] Mark audience and voice as defaults while product facts remain protected under the schema note.

## Forbidden

- [ ] Do not add positioning, benefits, competitors, proof, business goals, empty sections, `Unknown`, or `TBD`.
- [ ] Do not ask the user to choose Auto-draft versus Interview.

## Output Contract

Confirmation that the canonical file was created, with its relative link and only the three changed sections; no full file.
