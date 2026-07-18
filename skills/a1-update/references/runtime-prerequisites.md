# Runtime Prerequisites

The canonical minimum for the current `skills` CLI is Node.js 22.20.0. Load this reference when Node.js, `npm`, or `npx` is missing or the installed Node.js does not satisfy that requirement.

## Policy

Install an active Node.js LTS release using a trusted installer already available on the computer. `npm` and `npx` ship with Node.js; do not install them as unrelated global packages.

Ask only this question before any system change, translated only when the user's language is not Russian:

```text
Для обновления нужен Node.js. Установить и продолжить?
```

The confirmation turn contains nothing else: no command, package-manager name, permission warning, version table, alternatives, or diagnostics.

If the user declines, stop the original update immediately. Do not inspect installation options, run a package manager or official installer, or start updater inventory commands. Confirm concisely that nothing changed; in Russian use `Ничего не изменено.`

After approval:

1. Identify the operating system and an existing trusted Node version manager or system package manager.
2. Select one trusted installation path and run it. Complete any operating-system permission prompt with the user.
3. Verify `node --version`, `npm --version`, and `npx --version` and confirm that Node.js satisfies the current `skills` requirement.
4. Restart the original update from its runtime check; do not ask the user to repeat the request.

Prefer an already-installed Node version manager because it can select LTS directly:

- `fnm install --lts`, then activate that LTS version;
- `nvm install --lts`, then activate that LTS version;
- `volta install node@lts`.

Otherwise use an existing trusted platform manager, such as Homebrew on macOS, WinGet on Windows, or the system package manager on Linux. Choose a package that satisfies the canonical minimum above and prefer active LTS. Do not hard-code a future-sensitive LTS major when the manager can resolve LTS itself.

If no suitable manager exists, use the official Node.js installer from `https://nodejs.org/en/download` and let the user complete operating-system prompts. Do not bootstrap Homebrew or another package manager merely to install Node.js.

Never use an unverified `curl | sh` command. If the installation fails or the resulting Node.js still does not satisfy the canonical minimum, stop and report the blocker instead of attempting unrelated system changes.
