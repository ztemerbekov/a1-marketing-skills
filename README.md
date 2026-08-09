<h1><img src="./assets/logos/a1-logo.svg" alt="A1" width="40"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Hand over the routine to AI agents—freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

A1 Marketing Skills is a collection of Agent Skills built for the whole marketing team. It draws a clear line between execution and decision-making: agents take on repeatable operational work, while marketers keep expert control, clear focus, and ownership of growth decisions.

---

## What agents can already do

The collection is split into two connected packages for marketing decisions, reusable context, consumer psychology, and copy.

### A1 Core — Expertise and decisions

1. **[Grill](./docs/skills/a1-grill.md)** (`/a1-grill`) pressure-tests a marketing idea, decision, or plan through a round-by-round interview.
2. **[Consumer Psychology](./docs/skills/a1-consumer-psy.md)** (`/a1-consumer-psy`) audits consumer psychology hypotheses before launch and explains test outcomes using peer-reviewed research to identify flaws and behavioral drivers.
3. **[Marketing Context](./docs/skills/a1-marketing-context.md)** (`/a1-marketing-context`) stores the team's confirmed marketing context in `.agents/marketing-context.md`, so skills that use marketing context can work from real inputs instead of inventing them.

### A1 Editorial — Editing and copy

4. **[A1 Copy Editing](./docs/skills/a1-copy-editing.md)** (`/a1-copy-editing`, with the Russian command alias [`/a1-redaktura`](./docs/skills/a1-redaktura.md)) improves or reviews existing drafts within supplied constraints and available Marketing Context while preserving source facts and human editorial control.
5. **[Humanize](./docs/skills/a1-humanize.md)** (`/a1-humanize`) removes recognizable AI-writing patterns while preserving the author's natural rhythm, voice, and specific details.

## Working principles

- **One marketing context.** Saved, confirmed team inputs live in `.agents/marketing-context.md`, giving context-aware workflows one shared source instead of made-up inputs.
- **Source fidelity.** The editorial skills preserve facts, numbers, terms, qualifications, and authorial meaning without adding missing claims, proof, or strategy.

---

## See it in one minute

Here is a complete context-to-edit loop:

> **You:** Analyze the files in project folder X and build a basic marketing context from them.
>
> **Result:** The agent extracts the positioning, target audience, and brand rules and records them in `.agents/marketing-context.md` so that compatible context-aware skills can reuse the inputs instead of asking for them again.
>
> **You:** Make this clear and concise, then rewrite it so it sounds human—the AI writing is obvious:
>
> `[paste your draft]`
>
> **Result:** Clean, finished copy in the brand’s Tone of Voice without fluff or AI clichés, rewritten according to the principles of “Write, Cut.”

---

## Contents

- [Quick start](#quick-start)
- [Other installation options](#other-installation-options)
- [Update or remove](#update-or-remove)
- [Help and feedback](#help-and-feedback)

## Quick start

The shortest path to a useful result is a global install followed by an A1 Copy Editing request.

1. Open a terminal and install the collection. The same one-line command works in Bash, Command Prompt, and PowerShell:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

2. When the installer asks, choose the AI agents you already use and select `a1-copy-editing` or any other skills you want. To use the explicit Russian command, select both `a1-copy-editing` and its `a1-redaktura` alias.

3. Open the project that contains your draft in the selected agent. A1 Copy Editing can start from an ordinary-language request:

   > Make this paragraph clearer and shorter. Keep every fact and do not add new claims.
   >
   > Return only the edited text:
   >
   > `[paste your draft]`

4. For repeated work in one repository, add shared context:

   > Set up marketing context from confirmed information in this repository.

   This explicit request creates or updates `.agents/marketing-context.md`. Installation alone never creates the file.

## Other installation options

### Codex marketplace

Add the repository marketplace once:

```bash
codex plugin marketplace add ztemerbekov/a1-marketing-skills
codex plugin add a1-marketing-skills@a1-marketing-skills
```

Start a new Codex session after installation so it can load the bundled skills. You can also browse the repository marketplace and manage the plugin through `/plugins`.

### Cursor marketplace

Add the repository marketplace once:

```bash
cursor-agent plugin marketplace add https://github.com/ztemerbekov/a1-marketing-skills
```

Start `cursor-agent`, open `/plugin`, choose the **A1 Marketing Skills** marketplace, and install the **A1 Marketing Skills** plugin at user or project scope.

### Claude Code marketplace

Add the marketplace once:

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
```

For the complete A1 Marketing Skills installation:

```text
/plugin install a1-marketing-skills@a1-marketing-skills
```

The complete installation includes both collections:

- **A1 Core:** `/a1-core:a1-grill`, `/a1-core:a1-consumer-psy`, and `/a1-core:a1-marketing-context`
- **A1 Editorial:** `/a1-editorial:a1-copy-editing`, its Russian alias `/a1-editorial:a1-redaktura`, and `/a1-editorial:a1-humanize`

To install only one collection:

```text
/plugin install a1-core@a1-marketing-skills
/plugin install a1-editorial@a1-marketing-skills
```

### One project only

Run the primary command inside the project and omit `-g`:

```bash
npx skills@latest add ztemerbekov/a1-marketing-skills
```

Project installation keeps the selected skill versions with that project. For the CLI's full current agent list and installation behavior, see the upstream [`skills` documentation](https://github.com/vercel-labs/skills).

## Update or remove

Update the five capabilities and the Russian command alias:

```bash
npx skills@latest update a1-copy-editing a1-redaktura a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

Remove them from the global installation:

```bash
npx skills@latest remove a1-copy-editing a1-redaktura a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

For project-only skills, run the command in that project and use `--project` with `update`; omit `--global` from `remove`.

## Help and feedback

Questions, improvement ideas, or something that did not work as expected?<br>
Join the discussion in <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
