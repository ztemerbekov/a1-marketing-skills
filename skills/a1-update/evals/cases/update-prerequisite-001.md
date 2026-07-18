# Install a Missing Runtime Prerequisite

- ID: `update-prerequisite-001`
- Operation: `install-prerequisite`

## Setup

The user requested an update on macOS. Node.js is missing, Homebrew is already installed, and no Node version manager is available. System changes are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

## Input

`node`, `npm`, and `npx` are unavailable. Homebrew can install a Node.js release satisfying the CLI's Node.js 18-or-newer requirement.

After the runtime is installed, live fixture state contains one active global scope and no current-project scope. Upstream contains `a1-editor`, `a1-editor-in-chief`, `a1-marketing-context`, and `a1-update`; the exact-source global lock tracks all four, and global installed inventory reports them in Codex and Cursor with no membership change.

## Must Change

- Before any system change, asks exactly `Для обновления нужен Node.js. Установить и продолжить?` with no additional prose or command.
- After the user approves, selects the already-installed Homebrew, installs a Node.js release satisfying the current CLI requirement, and verifies `node`, `npm`, and `npx`.
- Restarts the original Marketing Skills update from runtime preflight after verification.

## Must Preserve

- Uses the already-installed trusted package manager.
- Keeps the prerequisite work limited to what `npx skills` needs.

## Forbidden

- Installing Homebrew, a second package manager, or unrelated global packages.
- Using an unverified `curl | sh` command.
- Showing an installation command, permission explanation, version table, or alternative before approval.
- Continuing to `npx skills` before Node.js 18 or newer is verified.

## Output Contract

- The confirmation turn contains exactly `Для обновления нужен Node.js. Установить и продолжить?`.
- After approval and a successful resumed update, follows the ordinary concise Marketing Skills success contract.
