![A1 Marketing Skills](./assets/marketing-skills-evolution.png)

<h1><img src="./assets/a1-logo.svg" alt="A1 logo" width="46"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

A1 Marketing Skills gives marketing teams five installable workflows for AI agents: keep confirmed product context, pressure-test marketing decisions, edit copy, remove recognizable AI-writing patterns, and turn approved strategy into a reviewed edit. The collection separates decision work from execution, so teams can hand over routine work without handing over expert control.

- **Five focused skills.** A1 Core contains Marketing Context and Grill; A1 Editorial contains Editor, Editor in Chief, and Humanize.
- **Reusable context.** Marketing Context stores only confirmed, repository-specific information in `.agents/marketing-context.md`, where Editor and Editor in Chief can reuse it.
- **Source fidelity.** Editor and Humanize preserve supplied facts, qualifications, names, numbers, and claims instead of inventing the missing marketing behind a draft.
- **Language-aware.** Rewritten copy stays in its source language, while questions and explanations follow the language of your instruction unless you request otherwise.
- **Flexible install.** Use the `skills` CLI with Codex, Claude Code, Cursor, Antigravity, and other supported agents, or install the functional collections from the Claude Code marketplace.

## See it in one minute

Here is a complete context-to-edit loop:

```text
You: Set up marketing context from confirmed information in this repository.
Result: Confirmed reusable facts are saved to .agents/marketing-context.md.

You: Make this landing-page paragraph clearer and shorter. Keep every fact:
     [paste your draft]
Result: Revised copy plus a short change summary.
```

---

## Contents

- [Quick start](#quick-start)
- [Choose a skill](#choose-a-skill)
- [Meet the skills](#meet-the-skills)
- [Other installation options](#other-installation-options)
- [Update or remove](#update-or-remove)
- [Help and feedback](#help-and-feedback)
- [Contribute](#contribute)

## Quick start

The shortest path to a useful result is a global install followed by an Editor request.

1. Open a terminal and install the collection:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

2. When the installer asks, choose the AI agents you already use and select `a1-editor` or any other skills you want.

3. Open the project that contains your draft in the selected agent and start a new task:

   ```text
   Make this paragraph clearer and shorter. Keep every fact and do not add new claims.
   Return only the edited text:

   [paste your draft]
   ```

   Editor starts from this ordinary-language request. It does not require Marketing Context or a setup interview.

4. For repeated work in one repository, add shared context:

   ```text
   Set up marketing context from confirmed information in this repository.
   ```

   This explicit request creates or updates `.agents/marketing-context.md`. Installation alone never creates the file.

> The primary command uses the current [`skills` CLI](https://github.com/vercel-labs/skills). Its `-g` flag makes the selected skills available across projects for the chosen agents.

---

## Choose a skill

Pick the smallest workflow that matches the job:

| Skill | Use it to | How it starts |
|---|---|---|
| [Marketing Context](./skills/a1-marketing-context/) `a1-marketing-context` | Save confirmed product, audience, positioning, voice, proof, vocabulary, and goals for reuse in one repository. | Ask explicitly to set up, remember, save, or update marketing context. |
| [A1 Grill](./skills/a1-grill/) `a1-grill` | Sharpen one marketing idea, decision, or plan before execution. | Invoke `a1-grill` explicitly. |
| [Editor](./skills/a1-editor/) `a1-editor` | Shorten, clarify, strengthen, restructure, or clean up existing marketing copy. | Paste editable text and state the change you want. |
| [Humanize](./skills/a1-humanize/) `a1-humanize` | Remove recognizable AI-writing patterns from supplied copy while preserving its meaning and voice. | Ask explicitly to humanize supplied text or make it sound less AI-generated. |
| [Editor in Chief](./skills/a1-editor-in-chief/) `a1-editor-in-chief` | Choose editorial direction inside approved strategy, brief Editor, and review the resulting edit. | Invoke `a1-editor-in-chief` explicitly. |

Marketing Context is useful for repeated work, but it is optional for Editor. Grill asks before reading an existing context. Humanize never reads project files or Marketing Context.

> Editor, Humanize, Marketing Context, and Editor in Chief do not invent missing marketing strategy. Grill challenges one marketing decision at a time but does not execute the result.

## Meet the skills

<details>
<summary><strong>Marketing Context — keep confirmed information reusable</strong></summary>

Marketing Context creates or incrementally updates one repository-local `.agents/marketing-context.md`. It records confirmed information from the user and authoritative project material; it never creates or evaluates hypotheses.

An ordinary save or update request uses Auto-draft. An interview starts only when you explicitly ask for guided questions; it asks one question at a time, saves confirmed progress after each answer, and stops after at most seven questions in one pass.

**Try:**

```text
Set up marketing context from confirmed information in this repository.

Remember our approved tone of voice: practical, calm, and direct.

Update only the audience: marketplace operations managers.
```

Read the [full Marketing Context behavior](./skills/a1-marketing-context/SKILL.md).

</details>

<details>
<summary><strong>A1 Grill — pressure-test a decision before acting</strong></summary>

Grill runs a constructively demanding interview around one marketing idea, decision, or plan. Each turn leads with one recommendation and ends with one question. It follows the dependencies of the actual decision instead of applying a fixed checklist.

After you confirm shared understanding, Grill returns the decision, its rationale, any remaining assumptions or deferred branches, and one recommended next step. It does not execute the plan, create marketing materials, or perform full market research.

**Try:**

```text
Use a1-grill. Grill this idea one decision at a time:
launch a Telegram channel to generate qualified leads
for our marketplace analytics service.
```

Read the [full A1 Grill behavior](./skills/a1-grill/SKILL.md).

</details>

<details>
<summary><strong>Editor — improve existing copy without inventing facts</strong></summary>

Editor starts when you provide editable text and an editing intent. It can shorten, clarify, strengthen, restructure, repair grammar, or apply information style while preserving traceable facts, claims, qualifications, numbers, and useful voice.

Missing audience, channel, goal, or Marketing Context does not block a safe edit. Requests to create positioning, an offer, an audience, campaign messaging, or another strategic decision stop at the editing boundary.

**Try:**

```text
Make this landing-page section clearer and shorter.
Keep every number and do not add new promises:

[paste your text]
```

Read the [full Editor behavior](./skills/a1-editor/SKILL.md).

</details>

<details>
<summary><strong>Humanize — remove AI patterns without flattening the voice</strong></summary>

Humanize works only with completed copy supplied in the conversation. It detects patterns by function across languages, preserves supported content and meaningful authorial choices, and does not add claims, opinions, anecdotes, offers, or CTAs.

It never reads or overwrites project files. A request that combines humanization with new marketing strategy stops before any partial rewrite.

**Try:**

```text
Humanize this paragraph. Keep every fact
and return only the final rewrite:

[paste your text]
```

Read the [full Humanize behavior](./skills/a1-humanize/SKILL.md).

</details>

<details>
<summary><strong>Editor in Chief — direct and review a high-stakes edit</strong></summary>

Editor in Chief works inside confirmed product and marketing inputs. It resolves the source material, chooses bounded editorial direction, creates an internal brief, delegates all text work to Editor, and reviews the result with at most one corrective pass.

Use it when approved strategy already exists but reader focus, message emphasis, editorial angle, argument order, structure, or voice still needs a chief editor's judgment. It does not create positioning, segmentation, pricing, an offer, a campaign strategy, GTM, or product strategy.

**Try:**

```text
Use a1-editor-in-chief. The audience and positioning below are approved.
Choose the strongest editorial angle and argument order for this email,
have Editor rewrite it, and review the result.

Approved strategy: [audience and positioning]
Source text: [paste your text]
```

Read the [full Editor in Chief behavior](./skills/a1-editor-in-chief/SKILL.md).

</details>

---

## Other installation options

### Claude Code marketplace

Add the marketplace once:

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
```

Install the complete suite:

```text
/plugin install a1-marketing-suite@a1-marketing-skills
```

A1 Marketing Suite installs both functional collections as dependencies and has no skills or commands of its own:

- **A1 Core:** `/a1-core:a1-marketing-context` and `/a1-core:a1-grill`
- **A1 Editorial:** `/a1-editorial:a1-editor`, `/a1-editorial:a1-humanize`, and `/a1-editorial:a1-editor-in-chief`

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

Update the five globally installed skills:

```bash
npx skills@latest update \
  a1-editor \
  a1-editor-in-chief \
  a1-grill \
  a1-humanize \
  a1-marketing-context \
  --global \
  --yes
```

Remove them from the global installation:

```bash
npx skills@latest remove \
  a1-editor \
  a1-editor-in-chief \
  a1-grill \
  a1-humanize \
  a1-marketing-context \
  --global \
  --yes
```

For project-only skills, run the command in that project and use `--project` with `update`; omit `--global` from `remove`.

## Help and feedback

Questions, improvement ideas, or something that did not work as expected? Join the discussion in [A1 Marketing Skills](https://t.me/a1_marketing_skills). Remove confidential information before posting.

## Contribute

Want to improve a skill or propose a new one? Start with the repository's [GitHub Issues](https://github.com/ztemerbekov/a1-marketing-skills/issues). Maintainer workflow and skill-design constraints are documented in [`AGENTS.md`](./AGENTS.md).
