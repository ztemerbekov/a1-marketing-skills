---
name: a1-update
description: 'Update only the skills installed from ztemerbekov/marketing-skills. Use when the user explicitly asks to update, refresh, upgrade, repair, or reinstall Marketing Skills, including requests such as "Update Marketing Skills", "Обнови Marketing Skills", or "обнови маркетинговые навыки". Synchronize the complete current main collection across clients already connected to Marketing Skills, automatically adding or removing skills without changing unrelated sources or connecting new clients. For informational how-to questions, explain the process without changing the system.'
---

# Update

Keep installations from `ztemerbekov/marketing-skills` aligned with the latest `main` without changing skills from any other source.

## Language

Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise.

## Scope Classification

Classify the whole request before checking prerequisites, reading inventory, or changing anything.

**In scope:** an actionable request to update, refresh, repair, or reinstall only the collection owned by `ztemerbekov/marketing-skills`; or an informational question about that update process. If an update request finds no tracked installation, return only the bootstrap guidance defined below.

**Out of scope:** updating or removing skills from another source, connecting or disconnecting clients, scanning or updating other projects, changing unrelated system tools, or performing a first installation inside this workflow.

**Completed external inputs:** accept a user-supplied inventory, diagnostic, or command result as context. It does not prove current source ownership, upstream membership, or connected clients; verify live state before any mutation.

**Mixed-job behavior:** if one request combines the Marketing Skills update job with any out-of-scope job, stop the whole request before prerequisite or inventory work. Name the unsupported part and ask the user to separate it. Do not partially update Marketing Skills.

## Interaction Contract

Treat a direct request such as “Update Marketing Skills” as authorization to synchronize the complete collection from current `main` in every active installation scope. This includes refreshing existing skills, installing newly available skills, removing upstream-deleted skills, and replacing manual changes in installed copies.

Do not ask the user to choose skills, clients, scopes, or installer keys during an ordinary update. Install every upstream skill automatically into the scope's managed client set. Refresh, add, and remove without asking and without creating a backup.

If the user only asks how updating works, answer without running commands or changing files. Explain the exact source boundary, active scopes, complete-set synchronization, automatic addition and deletion, and the rule against connecting new clients. Always state explicitly that manual changes inside installed skill folders are overwritten without a backup.

## Scope

Manage only lock entries whose normalized source is exactly `ztemerbekov/marketing-skills`. Never run an unfiltered update or removal command and never touch unrelated skills, even when their names start with `a1-`.

Process:

1. The global installation.
2. A project installation only when `skills-lock.json` exists in the current working directory and contains this source.

Do not search other project directories. For each active scope, derive one managed client set: the union of clients reported for any source-owned Marketing Skill in that scope. Synchronize every upstream skill to that set, repairing incomplete per-skill installations. Do not use global installer selection history as source-specific evidence, combine client sets across scopes, or connect a client outside the managed set.

## Workflow

1. Classify the whole request under Scope Classification. Stop out-of-scope and mixed-job requests before prerequisite work; answer informational questions without commands.
2. Check Node.js, `npm`, and `npx`. The current `skills` CLI requires Node.js 18 or newer. If the requirement is not met, follow the one-question confirmation, trusted installation, verification, and automatic-resume contract in [runtime-prerequisites.md](references/runtime-prerequisites.md).
3. Follow [npx-workflow.md](references/npx-workflow.md) to collect the upstream and installed inventories, resolve every reported client, calculate each scope's managed client set, and build the complete mutation plan. Complete the read-only preflight for every active scope before the first installation change. If any upstream inventory or active-scope state cannot be verified, stop the whole run with every scope unchanged.
4. Cross the workflow's mutation barrier only after every preflight result is complete and valid.
5. For each active scope, automatically remove tracked skills missing from upstream and prune their exact source-owned lock entries with the bundled helper.
6. Synchronize every upstream skill to the managed client set. This automatically restores missing copies, installs newly available skills, and replaces installed files from current `main`, including manual changes, without asking and without creating a backup.
7. Verify the final installed inventory and report the result.

If no Marketing Skills installation is tracked, do not guess from folder names. Explain that first installation is a console bootstrap and provide:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

## Failure Rules

- Fail closed on an unreadable lock file, unavailable upstream inventory, ambiguous source, empty managed client set, unknown client mapping, or failed command.
- Any failure before the mutation barrier stops the entire run and leaves every active scope unchanged, including a scope whose own preflight already passed.
- Never ask the user to choose an `--agent` key. For an unknown client mapping, use the single updater-refresh recovery command defined in `npx-workflow.md`; do not skip the client or expose its label or key.
- Do not treat a network or authentication failure as evidence that an upstream skill was deleted.
- After the mutation barrier, enter the mutation phase immediately before invoking the first mutating command, then complete one scope before changing the next. If the first or any later mutating command fails, stop all further writes, treat the state as potentially partial, and never attempt an automatic rollback. Record completed, uncertain, and pending operations internally, but give the user only the concise partial-completion response and one retry action.
- Never edit a lock entry by hand when `scripts/prune-lock.mjs` rejects its source or structure.
- Do not install Homebrew, another package manager, or an unrelated system tool as part of this workflow.

## Output

For an ordinary successful update, return only the concise completion message in the user's language. In Russian, use exactly:

```text
Marketing Skills обновлены.
```

If collection membership changed, append the added or removed skill names only. Do not include client counts, client names, scopes, lock files, installer keys, or a routine list of refreshed skills. A recovery response may include one copy-ready command but no explanation of its flags. Include other technical detail only when the user explicitly requests diagnostics.

For a preflight failure without a more specific recovery above, state that preparation failed, nothing changed, and the user should retry later. In Russian, return exactly:

```text
Не удалось подготовить обновление. Ничего не изменено. Повторите запрос позже.
```

If a command fails after mutation begins, do not claim success or claim that nothing changed. In Russian, return exactly:

```text
Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».
```
