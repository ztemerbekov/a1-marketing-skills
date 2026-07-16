# Runtime Prerequisites

Load this reference only when Node.js, `npm`, or `npx` is missing or Node.js is older than 18.

## Policy

Install an active Node.js LTS release using a trusted installer already available on the computer. `npm` and `npx` ship with Node.js; do not install them as unrelated global packages.

Before changing the system:

1. Identify the operating system and an existing trusted Node version manager or system package manager.
2. Show the exact command, what it installs, and whether administrator privileges may be requested.
3. Ask for one confirmation.
4. Run the approved installation and complete any operating-system permission prompt with the user.
5. Verify `node --version`, `npm --version`, and `npx --version`, then resume the update.

Prefer an already-installed Node version manager because it can select LTS directly:

- `fnm install --lts`, then activate that LTS version;
- `nvm install --lts`, then activate that LTS version;
- `volta install node@lts`.

Otherwise use an existing trusted platform manager, such as Homebrew on macOS, WinGet on Windows, or the system package manager on Linux. Choose a package that provides Node.js 18 or newer and prefer active LTS. Do not hard-code a future-sensitive LTS major when the manager can resolve LTS itself.

If no suitable manager exists, use the official Node.js installer from `https://nodejs.org/en/download` and let the user complete operating-system prompts. Do not bootstrap Homebrew or another package manager merely to install Node.js.

Never use an unverified `curl | sh` command. If the installation fails or the resulting Node.js is still older than 18, stop and report the blocker instead of attempting unrelated system changes.
