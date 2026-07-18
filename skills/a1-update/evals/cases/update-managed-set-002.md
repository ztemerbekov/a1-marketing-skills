# Normalize the Managed Set Across Seven Clients

- ID: `update-managed-set-002`
- Operation: `update`

## Setup

Node.js 22, `npm`, and `npx skills` 1.5.19 are available. The upstream and installed inventory commands are intercepted by a fixture, and no current-project installation is active.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

Upstream `main` contains `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update`. The global lock tracks all four names from exactly `ztemerbekov/marketing-skills`.

Global list output reports:

- `a1-editor` in Antigravity, Antigravity CLI, Codex, Cursor, Gemini CLI, GitHub Copilot, and Zed;
- `a1-editor-in-chief` in Codex and Cursor;
- `a1-marketing-context` in Cursor;
- `a1-update` in Cursor.

The global lock's `lastSelectedAgents` also contains `amp`, `claude-code`, `cline`, `deepagents`, `opencode`, and `warp`. Those values came from unrelated installation choices and are not source-specific evidence.

## Must Change

- Computes the managed client set as the seven-client union reported for the four source-owned Marketing Skills.
- Refreshes all four upstream skills into all seven already connected clients.
- Resolves the reported labels to `antigravity`, `antigravity-cli`, `codex`, `cursor`, `gemini-cli`, `github-copilot`, and `zed` without asking the user.
- Replaces installed copies from current `main` without backup.

## Must Preserve

- Keeps the managed set limited to clients observed on source-owned Marketing Skills.
- Leaves unrelated installed skills, lock entries, and client connections unchanged.
- Performs no current-project operation.

## Forbidden

- Asking the user to select safe keys or interpret a client-mapping table.
- Treating `lastSelectedAgents` as the managed client set.
- Connecting Amp, Claude Code, Cline, Deep Agents, OpenCode, Warp, or any other client outside the observed seven-client union.
- Updating only the clients covered by an incomplete hard-coded mapping.

## Output Contract

- Returns `Marketing Skills обновлены.` with no client count, client names, scopes, lock details, or installer keys.
