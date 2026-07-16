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

## Must Change

- Shows the exact Homebrew command, explains that it installs Node.js with `npm` and `npx`, and warns about possible system permissions.
- Requests one confirmation before installing the prerequisite.
- After confirmation, installs Node.js, verifies all three commands, and resumes the Marketing Skills update.

## Must Preserve

- Uses the already-installed trusted package manager.
- Keeps the prerequisite work limited to what `npx skills` needs.

## Forbidden

- Installing Homebrew, a second package manager, or unrelated global packages.
- Using an unverified `curl | sh` command.
- Continuing to `npx skills` before Node.js 18 or newer is verified.

## Output Contract

- Separates the prerequisite result from the subsequent Marketing Skills update result.
