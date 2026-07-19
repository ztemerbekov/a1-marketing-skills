# Contributing

## Before You Change Anything

1. Read [AGENTS.md](AGENTS.md) and the relevant skill instructions.
2. Work from a GitHub Issue with clear scope and acceptance criteria.
3. Check Git status and preserve unrelated work.
4. Identify the canonical owner of every rule you plan to change.

## Make the Change

- Keep every skill self-contained and directly installable from GitHub.
- Prefer changing an existing source of truth over adding a parallel document or tool.
- Update `README.md` and `README.ru.md` together when the inventory, installation path, platform support, or user-facing behavior changes.
- Add or update only the eval cases relevant to changed behavior. Evals are optional maintainer material, not runtime dependencies.
- Update `CHANGELOG.md` under `Unreleased` for user-facing changes.

Before adding automation or process infrastructure, answer:

1. What repeated problem does it solve?
2. Why can the existing owner not solve it?
3. What manual step or older mechanism does it replace?
4. What ongoing maintenance does it introduce?

If the answers do not show a net simplification, do not add it.

## Validate

Run the repository checks:

```bash
bash -n scripts/validate-skills.sh
./scripts/validate-skills.sh
git diff --check
```

For behavior changes, run the relevant manual eval cases without changing their criteria after seeing the output. Record prompts, results, and human judgment in the pull request rather than adding a permanent run report.

## Release

Use one repository version. Git tags and GitHub Releases identify published versions; `CHANGELOG.md` summarizes notable user-facing changes. Do not maintain independent versions inside individual skills.
