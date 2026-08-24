# <img src="./assets/logos/a1-logo.svg" alt="A1" width="40">&nbsp;Marketing Skills

**English** | [Русский](./README.ru.md)

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Hand over the routine to AI agents — freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

[Install the skills](#quick-start) · [See what each skill does](#skills)

---

## Quick start

1. Open a terminal and install the collection:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

   To update the installed skills later, run `npx skills update`.

2. Select the AI agents you use and the skills you need.

3. Start a new session in the project with your materials and try a simple request:

   > `/a1-copy-editing`
   >
   > Make this paragraph clearer and shorter. Preserve every fact and do not add new claims.
   >
   > `[paste your draft]`

## Skills

### Core

| Skill | Use it to |
| --- | --- |
| [Wayfinder](./docs/skills/a1-wayfinder.md)<br>`/a1-wayfinder` | Map an unclear marketing initiative and resolve its decisions one at a time. |
| [Grill](./docs/skills/a1-grill.md)<br>`/a1-grill` | Pressure-test a marketing idea, decision, or plan through a structured interview. |
| [Consumer Psychology](./docs/skills/a1-consumer-psy.md)<br>`/a1-consumer-psy` | Audit consumer hypotheses and interpret test outcomes using peer-reviewed research. |
| [Marketing Context](./docs/skills/a1-marketing-context.md)<br>`/a1-marketing-context` | Store confirmed marketing inputs for reuse by compatible skills. |

### Editorial

| Skill | Use it to |
| --- | --- |
| [Copy Editing](./docs/skills/a1-copy-editing.md)<br>`/a1-copy-editing` · `/a1-redaktura` | Edit or review an existing draft without inventing facts. |
| [Article Writing](./docs/skills/a1-article-writing.md)<br>`/a1-article-writing` | Turn a topic or source material into an article, guide, case study, or newsletter. |
| [Decision Memo](./docs/skills/a1-decision-memo.md)<br>`/a1-decision-memo` | Organize supplied material into a memo for a specific decision-maker. |
| [Promo Page](./docs/skills/a1-promo-page.md)<br>`/a1-promo-page` | Create the structure or copy for one promotional page, audience, and action. |
| [Press Release](./docs/skills/a1-press-release.md)<br>`/a1-press-release` | Draft a routine announcement and surface anything that still needs verification. |
| [Humanize](./docs/skills/a1-humanize.md)<br>`/a1-humanize` | Remove recognizable AI-writing patterns while preserving the author's voice and details. |

The Russian `/a1-redaktura` command is an alias for Copy Editing. Install it alongside `a1-copy-editing` when you want that command.

## Install as a plugin

### Codex

```bash
codex plugin marketplace add ztemerbekov/a1-marketing-skills
codex plugin add a1-marketing-skills@a1-marketing-skills
```

Start a new Codex session after installation. You can browse and manage the plugin through `/plugins`.

### Cursor

```bash
cursor-agent plugin marketplace add https://github.com/ztemerbekov/a1-marketing-skills
```

Start `cursor-agent`, open `/plugin`, choose **A1 Marketing Skills**, and install the plugin at user or project scope.

### Claude Code

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
/plugin install a1-marketing-skills@a1-marketing-skills
```

## Help and feedback

Questions, improvement ideas, or something that did not work as expected?<br>
Join the discussion in <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
