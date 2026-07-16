---
name: a1-update-marketing-skills
description: 'Update only the skills installed from ztemerbekov/marketing-skills. Use when the user explicitly asks to update, refresh, upgrade, repair, or reinstall Marketing Skills, including requests such as "Update Marketing Skills", "Обнови Marketing Skills", or "обнови маркетинговые навыки". Refresh tracked skills from main across their existing clients, remove upstream-deleted skills automatically, and ask once before installing newly available skills. For informational how-to questions, explain the process without changing the system.'
---

# Update Marketing Skills

Keep installations from `ztemerbekov/marketing-skills` aligned with the latest `main` without changing skills from any other source.

## Language

Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise.

## Interaction Contract

Treat a direct request such as “Update Marketing Skills” as authorization to refresh existing Marketing Skills and automatically remove skills deleted upstream. Do not ask for another confirmation for those operations.

Ask once before installing skills that are available in the repository but are not tracked in an active installation scope. Show every new skill with its description and affected scope. Accept all, none, or a named subset. Do not remember refusals; offer declined skills again on the next update.

If the user only asks how updating works, answer without running commands or changing files. Explain the exact source boundary, active scopes, existing-skill refresh, overwrite-without-backup policy, automatic upstream deletion, grouped confirmation for new skills, and the rule against connecting new clients.

## Scope

Manage only lock entries whose normalized source is exactly `ztemerbekov/marketing-skills`. Never run an unfiltered update or removal command and never touch unrelated skills, even when their names start with `a1-`.

Process:

1. The global installation.
2. A project installation only when `skills-lock.json` exists in the current working directory and contains this source.

Do not search other project directories. Preserve the clients already connected to each installation. Do not connect a new client without separate user authorization.

## Workflow

1. Distinguish an actionable update request from an informational question.
2. Check Node.js, `npm`, and `npx`. The current `skills` CLI requires Node.js 18 or newer. If the requirement is not met, follow [runtime-prerequisites.md](references/runtime-prerequisites.md), then resume this workflow.
3. Follow [npx-workflow.md](references/npx-workflow.md) to collect the upstream and installed inventories. If the upstream inventory cannot be verified, stop without updating or deleting anything.
4. For each active scope, automatically remove tracked skills missing from upstream, prune their exact source-owned lock entries with the bundled helper, and refresh every tracked skill still present. Overwrite installed files, including manual changes, without asking and without creating a backup.
5. Present all newly available skills in one confirmation. Install only the accepted names into the clients already connected to that scope.
6. Verify the final installed inventory and report the result.

If no Marketing Skills installation is tracked, do not guess from folder names. Explain that first installation is a console bootstrap and provide:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

## Failure Rules

- Fail closed on an unreadable lock file, unavailable upstream inventory, ambiguous source, unknown client mapping, or failed command.
- Do not treat a network or authentication failure as evidence that an upstream skill was deleted.
- Complete one scope before changing the next. If a command fails, stop that scope and report exactly what succeeded and what remains.
- Never edit a lock entry by hand when `scripts/prune-lock.mjs` rejects its source or structure.
- Do not install Homebrew, another package manager, or an unrelated system tool as part of this workflow.

## Output

Return a concise report containing:

- scopes and clients checked;
- skills refreshed;
- newly installed skills or declined new skills;
- skills removed because they disappeared upstream;
- failures or manual actions still required.

When nothing changed, say that Marketing Skills is already current on `main`.
