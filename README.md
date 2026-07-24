<h1><img src="./assets/a1-logo.svg" alt="A1" width="46"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

**Hand over the routine to AI agents—freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

A1 Marketing Skills is a collection of Agent Skills built for the whole marketing team. It draws a clear line between execution and decision-making: agents take on repeatable operational work, while marketers keep expert control, clear focus, and ownership of growth decisions.

---

## Five skills in the system

The collection is split into two connected packages for marketing context, decisions, and copy.

### A1 Core — Context and decisions

1. **Marketing Context** (`/a1-marketing-context`) stores the team's confirmed marketing context in `.agents/marketing-context.md`, so skills that use marketing context can work from real inputs instead of inventing them.
2. **Grill** (`/a1-grill`) pressure-tests a marketing idea, decision, or plan through a constructive interview.

### A1 Editorial — Editing and copy

3. **Editor** (`/a1-editor`) improves existing drafts within supplied constraints and available Marketing Context while preserving source facts.
4. **Editor in Chief** (`/a1-editor-in-chief`) sets editorial direction inside approved strategy, briefs Editor, and reviews the resulting edit.
5. **Humanize** (`/a1-humanize`) removes recognizable AI-writing patterns while preserving the author's natural rhythm, voice, and specific details.

## Working principles

- **One marketing context.** Saved, confirmed team inputs live in `.agents/marketing-context.md`, giving context-aware workflows one shared source instead of made-up inputs.
- **Source fidelity.** The editorial skills preserve facts, numbers, terms, qualifications, and authorial meaning without adding missing claims, proof, or strategy.

---

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
- [Meet the skills](#meet-the-skills)
- [Other installation options](#other-installation-options)
- [Update or remove](#update-or-remove)
- [Help and feedback](#help-and-feedback)

## Quick start

The shortest path to a useful result is a global install followed by an Editor request.

1. Open a terminal and install the collection:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

2. When the installer asks, choose the AI agents you already use and select `a1-editor` or any other skills you want.

3. Open the project that contains your draft in the selected agent. Editor can start from an ordinary-language request:

   ```text
   Make this paragraph clearer and shorter. Keep every fact and do not add new claims.
   Return only the edited text:

   [paste your draft]
   ```

4. For repeated work in one repository, add shared context:

   ```text
   Set up marketing context from confirmed information in this repository.
   ```

   This explicit request creates or updates `.agents/marketing-context.md`. Installation alone never creates the file.

## Meet the skills

<details>
<summary><strong>Marketing Context — keep confirmed information reusable</strong></summary>

Marketing Context creates or incrementally updates one repository-local `.agents/marketing-context.md`. It records confirmed information from the user and authoritative project material; it never creates or evaluates hypotheses.

An ordinary save or update request uses Auto-draft. An interview starts only when you explicitly ask for guided questions; it asks one question at a time, saves confirmed progress after each answer, and stops after at most seven questions in one pass.

**Try:**

```text
Record our Tone of Voice (attached file) and target audience (second file) in the marketing context.
```

Read the [full Marketing Context behavior](./skills/a1-marketing-context/SKILL.md).

</details>

<details>
<summary><strong>A1 Grill — pressure-test a decision before acting</strong></summary>

Grill runs a constructively demanding interview around one marketing idea, decision, or plan. Each turn leads with one recommendation and ends with one question. It follows the dependencies of the actual decision instead of applying a fixed checklist.

After you confirm shared understanding, Grill returns the decision, its rationale, any remaining assumptions or deferred branches, and one recommended next step. It does not execute the plan, create marketing materials, or perform full market research.

**Try:**

```text
/a1-grill We have an idea to launch a Telegram channel to attract B2B leads to our service.
Help us break down the hypothesis and show where the weak points and blind spots are.
```

Read the [full A1 Grill behavior](./skills/a1-grill/SKILL.md).

</details>

<details>
<summary><strong>Editor — improve existing copy without inventing facts</strong></summary>

Editor starts when you provide editable text and an editing intent. It can shorten, clarify, strengthen, restructure, repair grammar, or apply information style while preserving traceable facts, claims, qualifications, numbers, and useful voice.

Missing audience, channel, goal, or Marketing Context does not block a safe edit. Requests to create positioning, an offer, an audience, campaign messaging, or another strategic decision stop at the editing boundary.

**Try:**

```text
Edit this in Ilyakhov’s style and keep it to three paragraphs:

[paste your draft]
```

Read the [full Editor behavior](./skills/a1-editor/SKILL.md).

</details>

<details>
<summary><strong>Humanize — remove AI patterns without flattening the voice</strong></summary>

Humanize works only with completed copy supplied in the conversation. It detects patterns by function across languages, preserves supported content and meaningful authorial choices, and does not add claims, opinions, anecdotes, offers, or CTAs.

It never reads or overwrites project files. A request that combines humanization with new marketing strategy stops before any partial rewrite.

**Try:**

```text
Humanize this text and break up the AI-generated rhythm:

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
/a1-editor-in-chief
Review the draft. Find the strongest angle for marketing directors and rewrite the text for that purpose.

[paste your draft]
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

Questions, improvement ideas, or something that did not work as expected? Join the discussion in [A1 Marketing Skills](https://t.me/a1_marketing_skills).

<img src="./assets/marketing-skills-evolution.png" alt="A1 Marketing Skills">
