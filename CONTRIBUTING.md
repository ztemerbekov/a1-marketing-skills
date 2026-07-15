# Contributing

Marketing Skills keeps user documentation separate from maintainer documentation. Start with the [maintainer guide](docs/maintainers/README.md) for the repository architecture, compatibility policy, canonical design records, and release evidence.

## Before You Change Anything

1. Read [AGENTS.md](AGENTS.md) for the repository rules.
2. Work from a GitHub issue with a clear scope and acceptance criteria.
3. Check the current Git status and preserve unrelated work.
4. Treat `skills/` as the canonical runtime. Platform adapters and generated files must not become the source of truth.

When installation, skill inventory, platform support, or user-facing behavior changes, update `README.md` and `README.ru.md` together.

## Make the Change

- Keep every skill self-contained and installable directly from GitHub.
- Keep `SKILL.md` concise and place detailed canon, examples, rubrics, and templates in the skill's `references/` directory.
- Preserve the required language policy and frontmatter rules documented in `AGENTS.md`.
- Keep user-facing explanations in the READMEs. Put design, architecture, compatibility, and release details in the maintainer documentation.

## Validate

If the skill inventory, README tables, or Claude plugin metadata may have changed, synchronize them:

```bash
node scripts/sync-readme-and-plugin.js
```

Run the full repository validation before committing:

```bash
./scripts/validate-skills.sh
```

Also check shell syntax for changed shell scripts and use `git diff --check` before the final commit.

## Complete and Certify

Use the [A1 skill completion checklist](docs/a1-skill-completion-checklist.md) before declaring a new or materially changed skill complete. Runtime behavior changes require criteria-based eval coverage and an installed semantic run; structural validation and metadata synchronization are not substitutes for semantic evidence.

Record durable design decisions and release evidence in the canonical documents linked from the [maintainer guide](docs/maintainers/README.md). Documentation-only changes do not require a new semantic certification when runtime behavior is unchanged.
