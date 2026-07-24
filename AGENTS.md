# AGENTS.md

Guidelines for agents working in this repository.

## Repository Purpose

This repository publishes marketing-focused Agent Skills for clients that understand the Agent Skills folder format.

## Project Workflow

- Work is tracked in GitHub Issues. See `docs/agents/issue-tracker.md`.
- Use the canonical triage labels from `docs/agents/triage-labels.md`.
- This is a single-context repository. Follow `docs/agents/domain.md` and reassess the boundary before adding a skill.

## Git Delivery Flow

For every implementation change, follow this order:

1. Create or identify the GitHub Issue that defines the work and its acceptance criteria.
2. Inspect the worktree and preserve unrelated changes.
3. Update the base branch and create a `codex/` branch before editing tracked files.
4. Make the scoped changes and run the relevant validation.
5. Inspect the diff, then stage only the files that belong to the Issue and commit them.
6. Push the feature branch and open a draft pull request against `main`.
7. Merge the pull request into `main` only after the user explicitly authorizes the merge.

Pushing a feature branch never authorizes a merge. Do not commit implementation changes directly to `main`.

## GitHub authentication

Use the globally configured GitHub CLI authentication (`gh`) from the macOS system Keychain.

- Never ask the user to log in per repository.
- Never read, print, copy, store, or add GitHub tokens to repository files, prompts, `.env` files, or commits.
- Before a GitHub operation, run `gh auth status`.
- If `gh` reports an invalid or unavailable token inside a sandbox, retry the required command with permission to access the macOS Keychain. Do not ask the user to re-authenticate unless global `gh auth status` also fails.
- Use `gh` for GitHub Issues and pull requests; use the configured Git HTTPS credentials for `git fetch`, `git pull`, and `git push`.

## Skill Structure

Canonical skills live as direct children of `skills/`. Each directory must be self-contained and installable directly from GitHub without a build or sync step.

Every skill must:

- have a lowercase `a1-` name that matches its directory;
- include `SKILL.md` with `name` and `description` frontmatter;
- include a `## Language` section that preserves the input language for rewritten copy and uses the instruction language for explanations unless the user asks otherwise;
- keep detailed canon, examples, rubrics, and templates in local `references/` when they would make `SKILL.md` unwieldy;
- use relative links only to files inside its own directory.

Evaluation suites are optional maintainer material. When present, keep them under the skill's `evals/` directory; they must never be runtime dependencies.

## Invocation Compatibility

Model-invoked skills are the default and need no invocation metadata.

For a user-invoked skill, keep both client controls in sync:

- `disable-model-invocation: true` in `SKILL.md` frontmatter;
- `policy.allow_implicit_invocation: false` in `agents/openai.yaml`.

Use client-specific metadata only when it protects a concrete client behavior. Do not add copied skill trees, platform rules, plugins, or manual installers unless an issue explicitly restores that distribution surface.

## README Languages

`README.md` is English and `README.ru.md` is Russian. Keep the language switcher near the top of both files:

- `README.md`: `**English** | [Русский](./README.ru.md)`
- `README.ru.md`: `[English](./README.md) | **Русский**`

Update both files together when the skill inventory, installation, platform support, or user-facing behavior changes. The READMEs are maintained by people, not generated.

## Design Sources

- `docs/a1-skill-design-contract.md` owns shared skill-design principles.
- `docs/a1-marketing-glossary.md` owns shared operational vocabulary.
- A skill's `SKILL.md` and local references own that skill's behavior.
- Pull requests own change-specific semantic evidence. `CHANGELOG.md`, Git tags, and GitHub Releases own release history.

## Simplicity Guardrails

- Give every fact one canonical owner; link to it instead of copying it.
- Validate only facts with an objective machine answer. Do not turn documentation wording or human judgment into string assertions.
- Add automation only for demonstrated repeated work, and state what manual step or older mechanism it replaces.
- Do not add permanent run reports, certification records, candidate digests, or model-output archives; put that evidence in the pull request or release.
- Before adding a generator, manifest, dependency, adapter, process document, or required gate, explain the need, maintenance cost, and replacement plan to the user and wait for approval.
- Infrastructure simplification must preserve confirmed product behavior. Do not reopen settled product decisions without a concrete conflict.
- For every new maintenance mechanism, ask what can now be removed.

## Validation

Run:

```bash
bash -n scripts/validate-skills.sh
./scripts/validate-skills.sh
git diff --check
```

When a change affects runtime behavior, run the relevant manual eval cases and record the evidence in the pull request.

## Change Reporting

After every code or documentation change, include a suggested commit title in the response.
