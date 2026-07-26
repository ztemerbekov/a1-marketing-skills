<h1><img src="./assets/a1-logo.svg" alt="A1" width="42"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

**Hand over the routine to AI agents—freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

A1 Marketing Skills is a collection of Agent Skills built for the whole marketing team. It draws a clear line between execution and decision-making: agents take on repeatable operational work, while marketers keep expert control, clear focus, and ownership of growth decisions.

---

## What agents can already do

The collection is split into two connected packages for marketing decisions, reusable context, consumer psychology, and copy.

### A1 Core — Expertise and decisions

1. **Grill** (`/a1-grill`) pressure-tests a marketing idea, decision, or plan through a constructive interview.
2. **Consumer Psychology** (`/a1-consumer-psy`) audits consumer psychology hypotheses before launch and explains test outcomes using peer-reviewed research to identify flaws and behavioral drivers.
3. **Marketing Context** (`/a1-marketing-context`) stores the team's confirmed marketing context in `.agents/marketing-context.md`, so skills that use marketing context can work from real inputs instead of inventing them.

### A1 Editorial — Editing and copy

4. **Editor** (`/a1-editor`) improves existing drafts within supplied constraints and available Marketing Context while preserving source facts.
5. **Editor in Chief** (`/a1-editor-in-chief`) sets editorial direction inside approved strategy, briefs Editor, and reviews the resulting edit.
6. **Humanize** (`/a1-humanize`) removes recognizable AI-writing patterns while preserving the author's natural rhythm, voice, and specific details.

## Working principles

- **One marketing context.** Saved, confirmed team inputs live in `.agents/marketing-context.md`, giving context-aware workflows one shared source instead of made-up inputs.
- **Source fidelity.** The editorial skills preserve facts, numbers, terms, qualifications, and authorial meaning without adding missing claims, proof, or strategy.

---

## See it in one minute

Here is a complete context-to-edit loop:

> **You:** Analyze the files in project folder X and build a basic marketing context from them.
>
> **Result:** The agent extracts the positioning, target audience, and brand rules and records them in `.agents/marketing-context.md` so that every later skill invocation automatically uses the context and you do not need to provide the inputs again.
>
> **You:** Edit this in Ilyakhov’s style and rewrite it so it sounds human—the AI writing is obvious:
>
> `[paste your draft]`
>
> **Result:** Clean, finished copy in the brand’s Tone of Voice without fluff or AI clichés, rewritten according to the principles of “Write, Cut.”

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

   > Make this paragraph clearer and shorter. Keep every fact and do not add new claims.
   >
   > Return only the edited text:
   >
   > `[paste your draft]`

4. For repeated work in one repository, add shared context:

   > Set up marketing context from confirmed information in this repository.

   This explicit request creates or updates `.agents/marketing-context.md`. Installation alone never creates the file.

## Meet the skills

<details>
<summary><strong>Marketing Context — keep confirmed information reusable</strong></summary>

<br>

Marketing Context creates or incrementally updates `.agents/marketing-context.md`—a single source of confirmed inputs about your brand for future tasks.

You can start an update in two ways:

- **Ordinary request or command:** the skill collects confirmed facts from the supplied documents and builds the context.
- **Step-by-step interview:** if the files do not contain enough information, ask the skill to ask questions. It starts a short conversation, asks one question at a time, and saves confirmed progress after each answer.

**Try:**

Context can be updated as a whole or with individual confirmed sections—just specify what to save and which source to use.

> Analyze the attached files and record our Brand Voice, Customer Profiles, editorial policy, brand restrictions, and stop-word list in the context.
>
> Record the target-audience profiles, segments, ICP (Ideal Customer Profile), and key pain points of B2B buyers from the presentation in the context.
>
> Add the brand positioning, UVP (value proposition), mission, and key themes from the file to the context.
>
> Capture our Tone of Voice, communication character, layout principles, and examples of the brand voice in action in the context.
>
> Record the editorial policy, formatting rules, structure requirements, and rules for presenting numerical facts in the context.
>
> Save the brand prohibitions, legal taboos, stop-word list, and rules for mentioning competitors’ products in the context.
>
> Record the key products, their features translated into customer benefits, and the main offers for the current campaign in the context.

Read the [full Marketing Context behavior](./skills/a1-marketing-context/SKILL.md).

</details>

<details>
<summary><strong>Grill — pressure-test a decision before acting</strong></summary>

<br>

Grill is a tough but constructive review of a marketing idea or plan. No hand-holding or fluff, but no toxicity or passive aggression either—like a direct conversation with a colleague.

Each step brings one clear recommendation and one precise question. The skill analyzes the decision deeply instead of following a checklist.

What you get: Grill returns an actionable decision, surfaces risks and assumptions, and gives you one concrete next step.

**Try:**

> `/a1-grill`
>
> We have an idea to launch a Telegram channel to attract B2B leads to our service. Help us break down the hypothesis and show where the weak points and blind spots are.

Read the [full Grill behavior](./skills/a1-grill/SKILL.md).

</details>

<details>
<summary><strong>Editor — improve existing copy without inventing facts</strong></summary>

<br>

**Editor** starts when you need to polish any finished text. It can easily cut the fluff, clarify the meaning, tune the style, or rewrite the whole thing in Ilyakhov’s information style. All facts, numbers, and your distinctive voice stay intact—it invents nothing and loses nothing.

It does not need a detailed explanation of the audience, channel, or goal—it can still produce a strong edit.

*Limitations:* Editor only works with text. If you need to create positioning, an offer, or a campaign strategy from scratch, that is a job for other skills.

**Try:**

> `/a1-editor`
>
> Edit this in Ilyakhov’s style and keep it to three paragraphs:
>
> `[paste your draft]`

Read the [full Editor behavior](./skills/a1-editor/SKILL.md).

</details>

<details>
<summary><strong>Humanize — remove AI patterns without flattening the voice</strong></summary>

<br>

Humanize works only with completed copy supplied in the conversation. It detects patterns by function across languages, preserves supported content and meaningful authorial choices, and does not add claims, opinions, anecdotes, offers, or CTAs.

It never reads or overwrites project files. A request that combines humanization with new marketing strategy stops before any partial rewrite.

**Try:**

> `/a1-humanize`
>
> Humanize this text and break up the AI-generated rhythm:
>
> `[paste your text]`

Read the [full Humanize behavior](./skills/a1-humanize/SKILL.md).

</details>

<details>
<summary><strong>Editor in Chief — direct and review a high-stakes edit</strong></summary>

<br>

Editor in Chief works inside confirmed product and marketing inputs. It resolves the source material, chooses bounded editorial direction, creates an internal brief, delegates all text work to Editor, and reviews the result with at most one corrective pass.

Use it when approved strategy already exists but reader focus, message emphasis, editorial angle, argument order, structure, or voice still needs a chief editor's judgment. It does not create positioning, segmentation, pricing, an offer, a campaign strategy, GTM, or product strategy.

**Try:**

> `/a1-editor-in-chief`
>
> Review the draft. Find the strongest angle for marketing directors and rewrite the text for that purpose.
>
> `[paste your draft]`

Read the [full Editor in Chief behavior](./skills/a1-editor-in-chief/SKILL.md).

</details>

<details>
<summary><strong>Consumer Psychology — audit hypotheses with peer-reviewed research</strong></summary>

<br>

**What it does:** audits consumer psychology hypotheses before launch and explains test outcomes using peer-reviewed research to identify flaws and behavioral drivers.

**Use it when:** you explicitly invoke `a1-consumer-psy` to validate a consumer hypothesis before launch or explain a marketing test result. It works only from the current request and directly supplied completed inputs; it does not investigate traffic, analytics, attribution, technical failures, or unrelated psychological mechanisms.

**Try:**

> `/a1-consumer-psy`
>
> Diagnose why our plan-selection conversion fell after a page change. Give only evidence-bounded hypotheses and a falsifiable test.

The skill covers the model families documented in its local references. It provides analysis, hypotheses, experiments, metrics, countermetrics, and implementation-risk warnings; it does not create copy, pages, tariffs, campaigns, or production implementation. It warns when a proposed intervention is deceptive or otherwise risky, then helps test a transparent alternative.

It also treats broad frameworks and analyst errors as guardrails: they can route analysis or be explained directly, but are not presented as a user's primary psychological cause.

</details>

---

## Other installation options

### Claude Code marketplace

Add the marketplace once:

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
```

For the currently packaged Claude Code collections, install A1 Marketing Suite:

```text
/plugin install a1-marketing-suite@a1-marketing-skills
```

A1 Marketing Suite installs both functional collections as dependencies and has no skills or commands of its own:

- **A1 Core:** `/a1-core:a1-grill`, `/a1-core:a1-consumer-psy`, and `/a1-core:a1-marketing-context`
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

Update the six globally installed skills:

```bash
npx skills@latest update \
  a1-editor \
  a1-editor-in-chief \
  a1-grill \
  a1-humanize \
  a1-marketing-context \
  a1-consumer-psy \
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
  a1-consumer-psy \
  --global \
  --yes
```

For project-only skills, run the command in that project and use `--project` with `update`; omit `--global` from `remove`.

## Help and feedback

Questions, improvement ideas, or something that did not work as expected? Join the discussion in [A1 Marketing Skills](https://t.me/+XIOtNfseTgA3MWZi).
