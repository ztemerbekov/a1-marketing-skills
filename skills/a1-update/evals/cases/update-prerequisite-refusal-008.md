# Preserve the System When Node.js Installation Is Refused

- ID: `update-prerequisite-refusal-008`
- Operation: `prerequisite-refusal`

## Setup

The user requested an update on macOS. Node.js 16 with `npm` and `npx` is installed but is too old for the current `skills` CLI. Homebrew is already installed, and system changes are intercepted by a fixture.

## User Instruction

```text
Обнови Marketing Skills.
```

The user answers `Нет` to the Node.js confirmation.

## Input

`node --version` reports Node.js 16; `npm` and `npx` are available but cannot satisfy the CLI's Node.js 18-or-newer requirement. No updater inventory or installation command has run.

## Must Change

- Asks exactly `Для обновления нужен Node.js. Установить и продолжить?` before any system change.
- Accepts the refusal and stops the original update.
- Confirms concisely that nothing changed.

## Must Preserve

- Leaves Node.js, package managers, installed skills, lock entries, client connections, and unrelated state unchanged.
- Preserves the original request without converting refusal into a different recovery workflow.

## Forbidden

- Running Homebrew, an official installer, `npm`, `npx`, or any Marketing Skills command after refusal.
- Asking a second confirmation or offering alternative installation methods.
- Claiming that Marketing Skills were updated.

## Output Contract

- The confirmation turn contains exactly the approved Node.js question; after refusal, returns one concise statement that nothing changed and no command.
