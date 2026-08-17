<h1><img src="./assets/logos/a1-logo.svg" alt="A1" width="40"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Hand over the routine to AI agents—freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

A1 Marketing Skills is a collection of Agent Skills built for the whole marketing team. It draws a clear line between execution and decision-making: agents take on repeatable operational work, while marketers keep expert control, clear focus, and ownership of growth decisions.

---

## What agents can already do

The collection is split into two connected packages for marketing decisions, reusable context, consumer psychology, and copy.

### A1 Core — Expertise and decisions

1. **[Wayfinder](./docs/skills/a1-wayfinder.md)** (`/a1-wayfinder`) maps a large, unclear marketing initiative as one document and resolves its decisions one at a time until it is ready for a brief, strategy, or plan.
2. **[Grill](./docs/skills/a1-grill.md)** (`/a1-grill`) pressure-tests a marketing idea, decision, or plan through a round-by-round interview.
3. **[Consumer Psychology](./docs/skills/a1-consumer-psy.md)** (`/a1-consumer-psy`) audits consumer psychology hypotheses before launch and explains test outcomes using peer-reviewed research to identify flaws and behavioral drivers.
4. **[Marketing Context](./docs/skills/a1-marketing-context.md)** (`/a1-marketing-context`) stores the team's confirmed marketing context in `.agents/marketing-context.md`, so skills that use marketing context can work from real inputs instead of inventing them.

### A1 Editorial — Editing and copy

5. **[A1 Copy Editing](./docs/skills/a1-copy-editing.md)** (`/a1-copy-editing`, with the Russian command alias [`/a1-redaktura`](./docs/skills/a1-redaktura.md)) improves or reviews existing drafts within supplied constraints and available Marketing Context while preserving source facts and human editorial control.
6. **[Humanize](./docs/skills/a1-humanize.md)** (`/a1-humanize`) removes recognizable AI-writing patterns while preserving the author's natural rhythm, voice, and specific details.

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
- [Meet the skills](#meet-the-skills)
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

## Meet the skills

<details>
<summary><strong>Wayfinder — find a route through a foggy initiative</strong></summary>

<br>

Wayfinder turns a marketing effort that is too large and unclear for one conversation into a shared decision map. The first run names the destination and charts the current frontier, blocked questions, fog, and out-of-scope boundary. Later runs resolve one decision at a time and update what becomes possible next.

The map is one visible `wayfinder-<topic>.md` document, not a collection of GitHub issues or project tasks. Research, discussion, and disposable prototypes may support a choice; execution starts only after the route is clear.

A1 Wayfinder is adapted from Matt Pocock's [`wayfinder`](https://github.com/mattpocock/skills/blob/38d62e71ed01fc05d5ae63b0807172e9546049d5/skills/engineering/wayfinder/SKILL.md) under the MIT License. See the skill's [license and attribution](./skills/a1-wayfinder/references/license-and-attribution.md).

**Try:**

> `/a1-wayfinder`
>
> We want to enter a new market, but we cannot yet write a useful brief or plan. Map the decisions we need to make before choosing the route.

Read the [Wayfinder guide](./docs/skills/a1-wayfinder.md).

</details>

<details>
<summary><strong>Marketing Context — keep confirmed information reusable</strong></summary>

<br>

Marketing Context creates or incrementally updates `.agents/marketing-context.md`—a single source of confirmed product, audience, positioning, voice, proof, vocabulary, copy-example, and business-goal inputs for future marketing work. Project and asset conventions remain in the repository instructions that own them.

You can start an update in two ways:

- **Ordinary request or command:** the skill collects confirmed facts from the supplied documents and builds the context.
- **Step-by-step interview:** if the files do not contain enough information, ask the skill to ask questions. It starts a short conversation, asks one question at a time, and saves confirmed progress after each answer.

**Try:**

Context can be updated as a whole or with individual confirmed sections—just specify what to save and which source to use.

> Analyze the attached files and record our Brand Voice, Customer Profiles, editorial policy, messaging restrictions, and stop-word list in the context.
>
> Record the target-audience profiles, segments, ICP (Ideal Customer Profile), and key pain points of B2B buyers from the presentation in the context.
>
> Add the brand positioning, UVP (value proposition), mission, and key themes from the file to the context.
>
> Capture our Tone of Voice, communication character, verbal messaging principles, and examples of the brand voice in action in the context.
>
> Record the editorial policy, copy-structure requirements, and rules for wording numerical facts in the context.
>
> Save the brand prohibitions, legal taboos, stop-word list, and rules for mentioning competitors’ products in the context.
>
> Record the key products, their features translated into customer benefits, and the main offers for the current campaign in the context.

Read the [Marketing Context guide](./docs/skills/a1-marketing-context.md).

</details>

<details>
<summary><strong>Grill — pressure-test a decision before acting</strong></summary>

<br>

Grill maps a marketing idea, decision, or plan as a design tree and relentlessly interviews you until every relevant branch has been examined.

Each round asks every question whose prerequisites are already settled. Questions are numbered and each includes the agent's recommended answer, so you can respond to the whole round by number. Your answers reshape the tree before the next round.

When a question needs a discoverable fact, Grill sends a background sub-agent to find it while continuing with independent questions. Decisions remain yours, and the skill does not act until you confirm that you and the agent share the same understanding.

**Try:**

> `/a1-grill`
>
> We have an idea to launch a Telegram channel to attract B2B leads to our service. Help us break down the hypothesis and show where the weak points and blind spots are.

Read the [Grill guide](./docs/skills/a1-grill.md).

</details>

<details>
<summary><strong>A1 Copy Editing — improve or review existing copy without inventing facts</strong></summary>

<br>

Use **A1 Copy Editing** to polish a finished text or get editorial feedback before making changes. It can cut fluff, clarify meaning, tune the style, apply information-style editing when explicitly requested, or review the draft without silently rewriting it. Facts, numbers, and the author’s distinctive voice stay intact, while the user keeps final editorial control.

It does not need a detailed explanation of the audience, channel, or goal—it can still produce a strong edit.

*Limitations:* A1 Copy Editing only works with existing text. If you need to create positioning, an offer, or a campaign strategy from scratch, that is a job for other skills.

Russian-speaking users can invoke the same behavior explicitly with `/a1-redaktura`. It is a command alias, not a separate editing capability, and requires `a1-copy-editing` to be installed alongside it.

**Try:**

> `/a1-copy-editing`
>
> Rewrite this in information style and keep it to three paragraphs:
>
> `[paste your draft]`

For the Russian command alias, replace `/a1-copy-editing` with `/a1-redaktura`.

Or ask for a review without an automatic rewrite:

> Give feedback on this copy and prioritize what I should fix first. Do not rewrite it yet:
>
> `[paste your draft]`

Read the [A1 Copy Editing guide](./docs/skills/a1-copy-editing.md).

</details>

<details>
<summary><strong>Humanize — remove AI patterns without flattening the voice</strong></summary>

<br>

Humanize follows Humanizer 2.11.0: the same 35 patterns, examples, voice calibration, false-positive guard, and draft → audit → final process. It preserves the writer's facts, meaning, and voice and never invents facts, names, numbers, dates, quotations, or citations.

It accepts text and an optional writing sample in the conversation and never reads or overwrites project files or Marketing Context. By default it returns a draft, a short audit, and the final rewrite; an explicit final-only request returns only the rewrite.

A1 Humanize is adapted from [Humanizer by Siqi Chen](https://github.com/blader/humanizer) under the MIT License. See the skill’s [license and attribution](./skills/a1-humanize/references/license-and-attribution.md).

**Try:**

> `/a1-humanize`
>
> Humanize this text and break up the AI-generated rhythm:
>
> `[paste your text]`

Read the [Humanize guide](./docs/skills/a1-humanize.md).

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

Read the [Consumer Psychology guide](./docs/skills/a1-consumer-psy.md).

</details>

---

## Other installation options

### Agent Plugins v1 package

The repository root targets the [Agent Plugins v1.0.0](https://agent-plugins.org/specification) portable package format: `plugin.json` owns the portable identity, and `skills/` is the portable discovery location. Agent Plugins standardizes package layout, not one universal installation or marketplace flow. Use the documented route for your client below; the existing client manifests remain the source of client-specific presentation and installation behavior.

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

- **A1 Core:** `/a1-core:a1-wayfinder`, `/a1-core:a1-grill`, `/a1-core:a1-consumer-psy`, and `/a1-core:a1-marketing-context`
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

Update the six capabilities and the Russian command alias:

```bash
npx skills@latest update a1-copy-editing a1-redaktura a1-wayfinder a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

Remove them from the global installation:

```bash
npx skills@latest remove a1-copy-editing a1-redaktura a1-wayfinder a1-grill a1-humanize a1-marketing-context a1-consumer-psy --global --yes
```

For project-only skills, run the command in that project and use `--project` with `update`; omit `--global` from `remove`.

## Help and feedback

Questions, improvement ideas, or something that did not work as expected?<br>
Join the discussion in <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
