# context-sparse-repo-007 — Sparse Repository Does Not Produce Empty Context

- ID: `context-sparse-repo-007`
- Mode: `Auto-draft`
- Risk: Repository inspection turns filenames or dependencies into marketing facts or creates a padded empty file.
- Scope Scenario: `In scope`

## Setup

```text
The repository has no context. README.md contains only `# Project`. package.json contains only name and version. No authoritative product statement exists.
```

## User Instruction

```text
Set up marketing context from this repository.
```

## Input

```text
Repository name: review-hub
Dependencies: axios, react
No other product or marketing material.
```

## Must Change

- [ ] Detect that no reusable confirmed marketing fact is available and ask one concrete question for the first product fact.

## Must Preserve

- [ ] Leave the repository unchanged and keep package names and dependencies out of marketing context.

## Forbidden

- [ ] Do not infer a review product, SaaS category, audience, positioning, voice, features, or benefits from the repository name or dependencies.
- [ ] Do not create `.agents/`, an empty context, empty sections, `Unknown`, `TBD`, or a multi-question setup form.

## Output Contract

`One concise product-fact question and no write.`
