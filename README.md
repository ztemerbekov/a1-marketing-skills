<h1><img src="./assets/logos/a1-logo.svg" alt="A1" width="40"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Give recurring marketing work to AI agents while your team keeps control of strategy, evidence, and final decisions.**

A1 Marketing Skills is a collection of ten focused Agent Skills for marketing decisions, reusable context, consumer psychology, writing, and editing. Each skill owns one recognizable job, so an agent can execute the work without quietly expanding its scope or inventing missing facts.

- **Two collections.** A1 Core supports decisions and context; A1 Editorial creates and improves source-grounded content.
- **Shared context.** Compatible skills can reuse confirmed product, audience, positioning, and voice inputs from `.agents/marketing-context.md`.
- **Clear boundaries.** Editorial skills preserve source facts and expose missing evidence instead of filling the gaps with plausible copy.
- **Portable installation.** Install individual skills with the `skills` CLI or add the collection as a plugin in Codex, Cursor, or Claude Code.

> **Naming:** prose uses human-readable names such as **Copy Editing**. Code uses the install identifier `a1-copy-editing`; examples show the command `/a1-copy-editing`.

## Try it

After installation, open a project with your draft and ask Copy Editing to improve it:

> `/a1-copy-editing`
>
> Make this paragraph clearer and shorter. Preserve every fact and do not add new claims.
>
> `[paste your draft]`

The skill returns a source-faithful edit. You can also ask for feedback without a rewrite or use ordinary language when your agent supports automatic skill selection.

## Contents

- [Quick start](#quick-start)
- [Skills](#skills)
- [Other installation options](#other-installation-options)
- [Update or remove](#update-or-remove)
- [Help and feedback](#help-and-feedback)

## Quick start

1. Install the collection globally. The same command works in Bash, Command Prompt, and PowerShell:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

2. Choose the AI agents you already use, then select `a1-copy-editing` or any other skills you need. To use the Russian Copy Editing alias, select both `a1-copy-editing` and `a1-redaktura`.

3. Start a new session in the project that contains your materials, then invoke a skill by command or describe the job in ordinary language.

4. For recurring work in one repository, ask Marketing Context to save confirmed inputs:

   > Set up marketing context from confirmed information in this repository.

   This creates or updates `.agents/marketing-context.md`. Installation alone never creates the file.

## Skills

### A1 Core — decisions and context

| Skill | Command | Use it to |
| --- | --- | --- |
| [Wayfinder](./docs/skills/a1-wayfinder.md) | `/a1-wayfinder` | Map an unclear marketing initiative and resolve its decisions one at a time. |
| [Grill](./docs/skills/a1-grill.md) | `/a1-grill` | Pressure-test a marketing idea, decision, or plan through a structured interview. |
| [Consumer Psychology](./docs/skills/a1-consumer-psy.md) | `/a1-consumer-psy` | Audit consumer hypotheses and interpret test outcomes using peer-reviewed research. |
| [Marketing Context](./docs/skills/a1-marketing-context.md) | `/a1-marketing-context` | Store confirmed marketing inputs for reuse by compatible skills. |

### A1 Editorial — writing and editing

| Skill | Command | Use it to |
| --- | --- | --- |
| [Copy Editing](./docs/skills/a1-copy-editing.md) | `/a1-copy-editing` or `/a1-redaktura` | Edit or review an existing draft without inventing facts. |
| [Article Writing](./docs/skills/a1-article-writing.md) | `/a1-article-writing` | Turn a topic or source material into an article, guide, case study, or newsletter. |
| [Decision Memo](./docs/skills/a1-decision-memo.md) | `/a1-decision-memo` | Organize supplied material into a memo for a specific decision-maker. |
| [Promo Page](./docs/skills/a1-promo-page.md) | `/a1-promo-page` | Create the structure or copy for one promotional page, audience, and action. |
| [Press Release](./docs/skills/a1-press-release.md) | `/a1-press-release` | Draft a routine announcement and surface anything that still needs verification. |
| [Humanize](./docs/skills/a1-humanize.md) | `/a1-humanize` | Remove recognizable AI-writing patterns while preserving the author's voice and details. |

The Russian `/a1-redaktura` command is an alias for Copy Editing, not a separate editing capability. Install it alongside `a1-copy-editing` when you want that command.

## Other installation options

### One project only

Run the primary installation command inside the project and omit `-g`:

```bash
npx skills@latest add ztemerbekov/a1-marketing-skills
```

Project installation keeps the selected skill versions with that project. For the CLI's current agent list and installation behavior, see the upstream [`skills` documentation](https://github.com/vercel-labs/skills).

### Codex marketplace

Add the repository marketplace, then install the plugin:

```bash
codex plugin marketplace add ztemerbekov/a1-marketing-skills
codex plugin add a1-marketing-skills@a1-marketing-skills
```

Start a new Codex session after installation. You can also browse and manage the plugin through `/plugins`.

### Cursor marketplace

Add the marketplace:

```bash
cursor-agent plugin marketplace add https://github.com/ztemerbekov/a1-marketing-skills
```

Then start `cursor-agent`, open `/plugin`, choose **A1 Marketing Skills**, and install the plugin at user or project scope.

### Claude Code marketplace

Add the marketplace and install the complete collection:

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
/plugin install a1-marketing-skills@a1-marketing-skills
```

The complete installation includes both collections. In Claude Code, their commands are namespaced:

- **A1 Core:** `/a1-core:a1-wayfinder`, `/a1-core:a1-grill`, `/a1-core:a1-consumer-psy`, and `/a1-core:a1-marketing-context`
- **A1 Editorial:** `/a1-editorial:a1-copy-editing`, `/a1-editorial:a1-redaktura`, `/a1-editorial:a1-article-writing`, `/a1-editorial:a1-decision-memo`, `/a1-editorial:a1-promo-page`, `/a1-editorial:a1-press-release`, and `/a1-editorial:a1-humanize`

To install only one collection:

```text
/plugin install a1-core@a1-marketing-skills
/plugin install a1-editorial@a1-marketing-skills
```

### Agent Plugins package

The repository root follows the [Agent Plugins v1.0.0 specification](https://agent-plugins.org/specification). Its `plugin.json` provides the portable package identity; the client manifests provide client-specific installation and presentation.

## Update or remove

Update the ten capabilities and the Russian Copy Editing alias:

```bash
npx skills@latest update a1-copy-editing a1-redaktura a1-article-writing a1-decision-memo a1-promo-page a1-press-release a1-wayfinder a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

Remove them from the global installation:

```bash
npx skills@latest remove a1-copy-editing a1-redaktura a1-article-writing a1-decision-memo a1-promo-page a1-press-release a1-wayfinder a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

For project-only skills, run the command in that project and use `--project` with `update`; omit `--global` from `remove`.

## Help and feedback

Questions, improvement ideas, or something that did not work as expected?<br>
Join the discussion in <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
