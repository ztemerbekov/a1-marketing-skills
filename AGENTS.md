# AGENTS.md

Guidelines for agents working in this repository.

## Repository Purpose

This repository publishes marketing-focused Agent Skills for clients that understand the Agent Skills folder format.

## Agent skills

### Issue tracker

Material work and PRDs are tracked in GitHub Issues for `ztemerbekov/a1-marketing-skills`. Small maintenance changes may be tracked by their pull request. See `docs/agents/issue-tracker.md`.

### Triage labels

The five canonical triage roles use their default GitHub label names. See `docs/agents/triage-labels.md`.

### Domain docs

This is a single-context repository. See `docs/agents/domain.md`.

## Project Workflow

- Track material work and PRDs according to `docs/agents/issue-tracker.md`.
- Use the canonical triage labels from `docs/agents/triage-labels.md`.
- This is a single-context repository. Follow `docs/agents/domain.md` and reassess the boundary before adding a skill.

## Delivery Modes

Choose the delivery mode before making a GitHub write.

- **Local change:** the user asks to edit files without asking to commit, push, open a pull request, merge, release, or otherwise publish. Inspect the worktree, preserve unrelated changes, make the scoped edit, and run the iteration validation below. Keep follow-up tweaks in the same working state. A local change requires no Issue, base update, branch setup, commit, push, or pull request.
- **Publish change:** the user explicitly asks to publish or requests a Git operation. Follow the publish flow below. Reuse an existing Issue, branch, and open pull request when they already cover the same scope.

### Publish flow

1. Inspect the worktree and preserve unrelated changes.
2. For material work, create or identify the GitHub Issue that defines the acceptance criteria. For a small maintenance change, the pull request description may own the criteria.
3. Update the base branch and create a `codex/` branch before editing tracked files.
4. Make the scoped changes. Batch related follow-up tweaks in the same branch and pull request.
5. Run the final validation once after the final edit, inspect the diff, stage only the scoped files, and commit them.
6. Push the feature branch and open a draft pull request against `main`.
7. Hand off the draft pull request without waiting for GitHub Actions unless the user requested CI verification or a merge.
8. Merge the pull request into `main` only after the user explicitly authorizes the merge.

Pushing a feature branch never authorizes a merge. Do not commit implementation changes directly to `main`.

When a branch deletion is requested, verify both the remote branch and its local counterpart. Delete each one when present, then report the verified state of both.

## New Skill Release Approval

Before releasing a newly created skill to `main`, present its final manifest to the maintainer and obtain explicit approval. This is a release gate: it applies to the commit or merge that introduces the new skill to `main`, not to changes in an already released skill or exploratory commits on a feature branch.

The review must include the final skill name, directory name, `description`, every other manifest field, and any e-mail/contact field. Do not release provisional, placeholder, or intermediate values to `main`. If an approved manifest value changes, present the revised manifest for approval again before release.

## GitHub authentication

Use the globally configured GitHub CLI authentication (`gh`) from the macOS system Keychain.

- Never ask the user to log in per repository.
- Never read, print, copy, store, or add GitHub tokens to repository files, prompts, `.env` files, or commits.
- Before the first GitHub operation in a task, run `gh auth status` once. Reuse that result for the rest of the task unless authentication fails.
- If `gh` reports an invalid or unavailable token inside a sandbox, retry the required command with permission to access the macOS Keychain. Do not ask the user to re-authenticate unless global `gh auth status` also fails.
- Use `gh` for GitHub Issues and pull requests; use the configured SSH key and SSH remote for `git fetch`, `git pull`, and `git push`.

## Skill Structure

Canonical skills live as direct children of `skills/`. Each directory must be self-contained and installable directly from GitHub without a build or sync step.

Before creating or materially changing a skill, or copying, translating, paraphrasing, or adapting external material into one, read and follow `docs/a1-skill-design-contract.md` before editing.

Every skill must:

- have a lowercase `a1-` name that matches its directory;
- include `SKILL.md` with `name` and `description` frontmatter;
- keep detailed canon, examples, rubrics, and templates in local `references/` when they would make `SKILL.md` unwieldy;
- use relative links only to files inside its own directory.

When adding or materially changing a skill, follow the human-facing documentation contract in `docs/a1-skill-design-contract.md`.

When adding, renaming, or removing a canonical skill, update `skills.sh.json` in the same change so the skills.sh repository page stays current. Add user-facing skills to the appropriate grouping; intentionally ungrouped support skills and aliases may remain in `Other skills`.

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

Keep every `npx skills update` and `npx skills remove` example in both READMEs on one physical line. Do not use shell-specific line-continuation syntax in these examples.

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

### During iteration

Run the narrowest check that covers the current batch of edits:

- For changes limited to `README.md`, `README.ru.md`, or `docs/`, run `git diff --check`.
- For changes limited to existing marketplace metadata or assets under `.claude-plugin/`, `.agents/plugins/`, `.codex-plugin/`, `.cursor-plugin/`, or `assets/marketplaces/`, run `python3 scripts/validate-marketplaces.py` and `git diff --check`.
- For skill source, evaluation cases, scripts, workflows, or any other package behavior, run the relevant targeted check. Use the full suite when no narrower deterministic check proves the change.

### Before a pull request

For a documentation-only pull request, run `git diff --check`. For every other pull request, run the full suite once after the final edit:

```bash
bash -n scripts/validate-skills.sh
./scripts/validate-skills.sh
git diff --check
```

These deterministic checks verify objective package structure and whitespace only. They never prove semantic quality or replace a manual semantic evaluation.

### Manual semantic evaluation

Run an installed-client semantic evaluation only when the maintainer explicitly requests it, for example before a release. It is not a default prerequisite for merging or releasing a change.

Evaluation cases must remain criteria-based installed-client public interactions: score `Must Change`, `Must Preserve`, and `Forbidden` behavior. Do not introduce golden-output snapshots or assertions about internal file layout as semantic tests.

When an evaluation is run, record its purpose; selected case IDs; client, model, and revision; pass/fail results with concrete evidence; and limitations in the pull request or GitHub Release. Do not commit permanent run reports, candidate digests, or model outputs.

## Change Reporting

After every code or documentation change, include a suggested commit title in the response.
