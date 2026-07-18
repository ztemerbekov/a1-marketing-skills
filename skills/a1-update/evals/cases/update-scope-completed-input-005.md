# Verify a Supplied Installation Inventory

- ID: `update-scope-completed-input-005`
- Operation: `update`

## Setup

Node.js 22, `npm`, and `npx` are available. Command execution is intercepted by a fixture, and no current-project installation is active.

## User Instruction

```text
Вот готовый вывод установки: все Marketing Skills стоят в Cursor. Обнови Marketing Skills.
```

## Input

The user supplies a completed inventory report that lists all four Marketing Skills in Cursor. Live verification then confirms that the global lock tracks all four names from exactly `ztemerbekov/marketing-skills`, upstream `main` contains the same four names, and global list output reports the four source-owned skills in Cursor and Codex.

## Must Change

- Accepts the completed inventory report as context without treating it as live source or client evidence.
- Verifies the upstream inventory, exact source-owned lock entries, and installed client inventory before mutation.
- Synchronizes all four Marketing Skills into the verified Cursor/Codex managed client set.

## Must Preserve

- Preserves the user's supplied report without rewriting or treating it as an instruction to remove Codex.
- Leaves unrelated skills, sources, projects, and clients unchanged.

## Forbidden

- Trusting the supplied Cursor-only report over the verified live inventory.
- Narrowing the managed set to Cursor or connecting a client outside Cursor and Codex.
- Asking the user to choose clients or installer keys.
- Skipping live verification because a completed external input was supplied.

## Output Contract

- Returns `Marketing Skills обновлены.` with no client, scope, lock, or installer detail.
