![A1 Marketing Skills](./assets/marketing-skills-evolution.png)

<h1><img src="./assets/a1-logo.svg" alt="A1 logo" width="46"> Marketing Skills</h1>

**English** | [Русский](./README.ru.md)

A1 Marketing Skills helps marketers, founders, and writers work with AI agents in ordinary language. The collection can remember product context, pressure-test marketing decisions, improve existing copy, and clarify complex editorial assignments.

## Contents

- [Start here](#start-here)
- [Choose a skill](#choose-a-skill)
- [Meet the skills](#meet-the-skills)
- [Install](#install)
- [Update](#update)
- [Help and feedback](#help-and-feedback)

## Start here

```bash
npx skills@latest add ztemerbekov/a1-marketing-skills -g
```

## Choose a skill

If this is your first time using A1 Marketing Skills, start with [Marketing Context](skills/a1-marketing-context/). It saves product information that the other skills can reuse.

| Skill | Best for |
|-------|----------|
| [A1 Grill](skills/a1-grill/)<br>`a1-grill` | Sharpen a marketing idea, decision, or plan through constructive questioning before execution. |
| [Editor](skills/a1-editor/)<br>`a1-editor` | Improve existing text: shorten, clarify, strengthen, or restructure it without inventing facts. |
| [Editor in Chief](skills/a1-editor-in-chief/)<br>`a1-editor-in-chief` | Turning a confirmed editorial assignment into a reviewed edit without creating general marketing strategy. |
| [Humanize](skills/a1-humanize/)<br>`a1-humanize` | Remove recognizable AI-writing patterns from supplied copy without inventing facts or flattening its voice. |
| [Marketing Context](skills/a1-marketing-context/)<br>`a1-marketing-context` | Creating or incrementally updating one repository-local context from confirmed marketing information. |

Use this quick rule:

- Have a marketing idea, decision, or plan that still needs pressure-testing? Explicitly invoke **A1 Grill**.
- Want the current repository to remember confirmed product, audience, voice, or proof for future work? Explicitly ask **Marketing Context** to save or update it.
- Already have text and know what should change? Use **Editor**.
- Want to remove recognizable AI-writing patterns from existing copy? Use **Humanize**.
- Have confirmed product and marketing inputs, but need to decide the editorial reader focus, message emphasis, angle, structure, or voice? Explicitly invoke **Editor in Chief**.

Marketing Context is useful for repeated work, but A1 Grill and Editor can work from current material without it. A1 Grill asks before reading an existing context.

## Meet the skills

<details>
<summary><strong>A1 Grill</strong></summary>

**What it does:** constructively pressure-tests one marketing idea, decision, or plan through an adaptive decision tree. Each turn gives one concrete recommendation and asks one question. The session ends only after you confirm shared understanding, then returns a concise decision summary.

**Use it when:** you want to sharpen positioning, an audience choice, an offer, pricing, messaging, a channel, campaign, funnel, retention decision, or marketing measurement before anyone executes it. Invoke `a1-grill` explicitly; ordinary marketing discussion does not start the interview.

Questions and recommendations use your instruction language, and summary labels are localized naturally in it. Supplied quotations, product names, and explicit terms stay in their original language unless you request translation.

**Try:**

```text
Use a1-grill. Grill this idea one decision at a time: launch a Telegram channel to generate qualified leads for our marketplace analytics service.
```

A1 Grill derives the questions from the active decision instead of running a fixed marketing checklist. It examines supplied materials and readily available facts, asks permission before reading an existing `.agents/marketing-context.md`, and lets you stop with a clearly partial summary. It does not execute the decision, create marketing materials, or conduct full market research.

</details>

<details>
<summary><strong>Marketing Context</strong></summary>

**What it does:** creates or incrementally updates one shared `.agents/marketing-context.md` in the current repository. Auto-draft records only confirmed user information and direct facts from authoritative project material. A one-section partial context is valid; unrelated additions survive later updates.

**Use it when:** you explicitly want the repository to remember or update approved product facts, audience, positioning, voice, proof, terminology, examples, or goals.

**Try:**

```text
Set up marketing context from confirmed information in this repository.

Remember our approved tone of voice: practical, calm, and direct.

Update only the audience: marketplace operations managers.
```

For guided setup, ask naturally: “Interview me to set up marketing context.” Questions arrive one at a time, stop after at most seven in one pass, and confirmed partial progress is saved if you stop early.

The context belongs only to the current repository: there is no global or private profile. Installation, opening a project, mentioning marketing, or another skill finding no context never causes a write. Marketing Context records completed facts and decisions; it does not create or evaluate hypotheses.

</details>

<details>
<summary><strong>Editor</strong></summary>

**What it does:** improves text you already have by shortening, clarifying, strengthening, or restructuring it. It also repairs grammar, grammatical government, and unnatural word combinations even when the source meaning remains understandable. It preserves facts, numbers, and your voice without adding new promises.

**Use it when:** the text already exists and you know what should change. Include the complete text and state any important constraints up front.

Marketing Context is useful for repeated work, but ordinary editing does not require it.

Response headings and option labels are localized naturally in the language of your instruction, and explanations use that language. The edited copy keeps the source language unless you ask to translate it.

**Try:**

```text
Make this landing-page section clearer and shorter. Keep every number and do not add new promises:

[your text]
```

For information-style editing, ask for it explicitly: “Edit this in information style” or “по Ильяхову.” A generic request such as “clean this up” keeps the standard, more conservative editing behavior.

Requests to create or rethink positioning, an offer, an audience, campaign messaging, or a landing-page structure are outside Editor's text-editing boundary, and Editor in Chief does not create them either. When those strategic inputs are already approved and you want bounded editorial direction before execution, Editor can recommend that you explicitly invoke `a1-editor-in-chief`; it does not start the chief workflow automatically.

</details>

<details>
<summary><strong>Humanize</strong></summary>

**What it does:** removes recognizable AI-writing patterns from copy you already have while preserving its meaning, facts, language, and useful voice. It works in English, Russian, and other input languages; it does not add a personal reaction, a product claim, or other new content.

**Use it when:** you explicitly want existing copy to sound less AI-generated. Invoke `a1-humanize` by name or ask naturally to humanize the text. By default, it returns only the final rewrite.

**Try:**

```text
Humanize this paragraph. Keep every fact and return only the final rewrite:

[your text]
```

Humanize works only with text supplied in the conversation. It does not read or overwrite files or Marketing Context. A request to create an offer, CTA, positioning, audience, campaign, or other marketing strategy is outside its boundary; a request that mixes that work with humanization stops before any partial rewrite.

</details>

<details>
<summary><strong>Editor in Chief</strong></summary>

**What it does:** sets bounded editorial direction inside confirmed product and marketing inputs. It resolves available sources, asks one decision question only when necessary, creates an internal Editor Brief, delegates all text work to Editor, and reviews the result with at most one corrective pass.

**Use it when:** you already have the source material and approved marketing strategy, but the reader focus, message emphasis, editorial angle, argument order, structure, or voice still needs chief-editor judgment. Invoke Editor in Chief by name; the skill starts only when you explicitly invoke it.

Final headings and option labels are localized naturally in the language of your instruction; explanations, assumptions, and warnings use that language. The reviewed copy keeps the source language unless you ask to translate it, and a request for final text only remains wrapper-free.

**Try:**

```text
Use a1-editor-in-chief. The audience and positioning below are approved. Choose the strongest editorial angle and argument order for this email, have Editor rewrite it, and review the result.

Approved strategy: [audience and positioning]
Source text: [your text]
```

Editor in Chief does not create market research, segmentation, pricing, positioning, GTM, product strategy, or general marketing strategy. You can supply those completed decisions as source material for an editorial assignment.

</details>

## Install

Claude Code can install the functional collections from its marketplace. The `npx skills` path remains available for Claude Code and the other supported clients below.

<p>
  <img src="./assets/codex.webp" alt="Codex" width="16" height="16"> Codex &nbsp;&nbsp;
  <img src="./assets/claude.webp" alt="Claude Code" width="16" height="16"> Claude Code &nbsp;&nbsp;
  <img src="./assets/cursor.webp" alt="Cursor" width="16" height="16"> Cursor &nbsp;&nbsp;
  <img src="./assets/antigravity.webp" alt="Antigravity" width="16" height="16"> Antigravity
</p>

<details open>
<summary><strong>Install in Claude Code</strong></summary>

In Claude Code, add the marketplace once:

```text
/plugin marketplace add ztemerbekov/a1-marketing-skills
```

For the complete collection, install Marketing Suite:

```text
/plugin install a1-marketing-suite@a1-marketing-skills
```

Marketing Suite installs Core and Editorial automatically. It has no skills or commands of its own: invoke the installed skills through their collection namespaces, such as `/a1-core:a1-grill` and `/a1-editorial:a1-editor`.

Alternatively, install either independent collection:

```text
/plugin install a1-core@a1-marketing-skills
/plugin install a1-editorial@a1-marketing-skills
```

Core provides Marketing Context and A1 Grill; invoke them as `/a1-core:a1-marketing-context` and `/a1-core:a1-grill`. Editorial provides Editor, Editor in Chief, and Humanize; invoke them as `/a1-editorial:a1-editor`, `/a1-editorial:a1-editor-in-chief`, and `/a1-editorial:a1-humanize`.

</details>

<details>
<summary><strong>Install globally with npx skills</strong></summary>

Run from any directory:

```bash
npx skills@latest add ztemerbekov/a1-marketing-skills -g
```

The installer shows the five real skills and detected AI clients. Select the clients you already use and choose the skills you want; they retain their unnamespaced names, such as `/a1-editor`, in clients that expose slash invocation.

</details>

<details>
<summary><strong>Install only in the current project</strong></summary>

Open a terminal in the project and omit `-g`:

```bash
npx skills@latest add ztemerbekov/a1-marketing-skills
```

Use this when the project must carry its own skill versions. Otherwise prefer the global installation.

</details>

<details>
<summary><strong>Remove A1 Marketing Skills</strong></summary>

Remove the current global collection from every connected client:

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

</details>

## Update

Update the installed global skills with the official CLI:

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

For a project-only installation, run the command in that project and omit `--global`. To discover newly published skills, run the installation command again and select what you want to add.

## Help and feedback

Questions, improvement ideas, or something that did not work as expected? Join the discussion in [A1 Marketing Skills](https://t.me/a1_marketing_skills). Remove confidential information before posting. Every completed skill result includes the same link.

## For contributors

Developing or maintaining this repository? See [Contributing](./CONTRIBUTING.md).
