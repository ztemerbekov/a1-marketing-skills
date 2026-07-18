![Marketing Skills](./assets/marketing-skills-evolution.png)

# Marketing Skills

**English** | [Русский](./README.ru.md)

Marketing Skills helps marketers, founders, and writers work with AI agents in ordinary language. The collection can remember product context, improve existing copy, clarify complex editorial assignments, and keep itself up to date without changing unrelated skills.

## Contents

- [Start here](#start-here)
- [Choose a skill](#choose-a-skill)
- [Meet the skills](#meet-the-skills)
- [Install](#install)
- [Update](#update)
- [Help and feedback](#help-and-feedback)

## Start here

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

## Choose a skill

If this is your first time using Marketing Skills, start with [Marketing Context](skills/a1-marketing-context/). It saves product information that the other skills can reuse.

<!-- SKILLS:START -->
| Skill | Best for |
|-------|----------|
| [Editor](skills/a1-editor/)<br>`a1-editor` | Improve existing text: shorten, clarify, strengthen, or restructure it without inventing facts. |
| [Editor in Chief](skills/a1-editor-in-chief/)<br>`a1-editor-in-chief` | Turning a confirmed editorial assignment into a reviewed edit without creating general marketing strategy. |
| [Marketing Context](skills/a1-marketing-context/)<br>`a1-marketing-context` | Creating or incrementally updating one repository-local context from confirmed marketing information. |
| [Update](skills/a1-update/)<br>`a1-update` | Synchronize the complete Marketing Skills collection without changing unrelated skills or connecting new clients. |
<!-- SKILLS:END -->

Use this quick rule:

- Want the current repository to remember confirmed product, audience, voice, or proof for future work? Explicitly ask **Marketing Context** to save or update it.
- Already have text and know what should change? Use **Editor**.
- Have confirmed product and marketing inputs, but need to decide the editorial reader focus, message emphasis, angle, structure, or voice? Explicitly invoke **Editor in Chief**.

Marketing Context is useful for repeated work, but Editor does not require it to improve a supplied text.

## Meet the skills

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

**What it does:** improves text you already have by shortening, clarifying, strengthening, or restructuring it. It preserves facts, numbers, and your voice without adding new promises.

**Use it when:** the text already exists and you know what should change. Include the complete text and state any important constraints up front.

Marketing Context is useful for repeated work, but ordinary editing does not require it.

Response headings, option labels, and explanations follow the language of your instruction. The edited copy keeps the source language unless you ask to translate it.

**Try:**

```text
Make this landing-page section clearer and shorter. Keep every number and do not add new promises:

[your text]
```

For information-style editing, ask for it explicitly: “Edit this in information style” or “по Ильяхову.” A generic request such as “clean this up” keeps the standard, more conservative editing behavior.

Requests to create or rethink positioning, an offer, an audience, campaign messaging, or a landing-page structure are outside Editor's text-editing boundary, and Editor in Chief does not create them either. When those strategic inputs are already approved and you want bounded editorial direction before execution, Editor can recommend that you explicitly invoke `a1-editor-in-chief`; it does not start the chief workflow automatically.

</details>

<details>
<summary><strong>Editor in Chief</strong></summary>

**What it does:** sets bounded editorial direction inside confirmed product and marketing inputs. It resolves available sources, asks one decision question only when necessary, creates an internal Editor Brief, delegates all text work to Editor, and reviews the result with at most one corrective pass.

**Use it when:** you already have the source material and approved marketing strategy, but the reader focus, message emphasis, editorial angle, argument order, structure, or voice still needs chief-editor judgment. Invoke Editor in Chief by name; the skill starts only when you explicitly invoke it.

Final headings, option labels, explanations, assumptions, and warnings follow the language of your instruction. The reviewed copy keeps the source language unless you ask to translate it, and a request for final text only remains wrapper-free.

**Try:**

```text
Use a1-editor-in-chief. The audience and positioning below are approved. Choose the strongest editorial angle and argument order for this email, have Editor rewrite it, and review the result.

Approved strategy: [audience and positioning]
Source text: [your text]
```

Editor in Chief does not create market research, segmentation, pricing, positioning, GTM, product strategy, or general marketing strategy. You can supply those completed decisions as source material for an editorial assignment.

</details>

<details>
<summary><strong>Update</strong></summary>

**What it does:** installs the latest Marketing Skills in every app where you use them. It does not change skills from other collections.

**Use it when:** you want fixes and new capabilities. New skills are installed automatically everywhere the collection is already connected.

**Try:**

```text
Update Marketing Skills.
```

See [Update](#update) for details.

</details>

## Install

The same `npx skills` installer works with the supported clients below. This repository no longer uses separate client plugins, rules, or manual-copy installers.

<p>
  <img src="./assets/codex.webp" alt="Codex" width="16" height="16"> Codex &nbsp;&nbsp;
  <img src="./assets/claude.webp" alt="Claude Code" width="16" height="16"> Claude Code &nbsp;&nbsp;
  <img src="./assets/cursor.webp" alt="Cursor" width="16" height="16"> Cursor &nbsp;&nbsp;
  <img src="./assets/antigravity.webp" alt="Antigravity" width="16" height="16"> Antigravity
</p>

<details open>
<summary><strong>Install globally with npx skills</strong></summary>

Run from any directory:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

The installer shows the available skills and detected AI clients. Select the clients you already use and choose the skills you want; installing the complete collection is recommended.

If the terminal says it cannot find `npx`, install [Node.js](https://nodejs.org/en/download), reopen the terminal, and run the command again.

</details>

<details>
<summary><strong>Install only in the current project</strong></summary>

Open a terminal in the project and omit `-g`:

```bash
npx skills@latest add ztemerbekov/marketing-skills
```

Use this when the project must carry its own skill versions. Otherwise prefer the global installation.

</details>

<details>
<summary><strong>Remove Marketing Skills</strong></summary>

Remove the current global collection from every connected client:

```bash
npx skills@latest remove \
  a1-editor \
  a1-editor-in-chief \
  a1-marketing-context \
  a1-update \
  --global \
  --yes
```

</details>

## Update

<details>
<summary><strong>Moving from the previous skill names</strong></summary>

If you installed Marketing Skills before the names changed, remove the two previous skills and install the current collection:

```bash
npx skills@latest remove \
  a1-setup-marketing-context \
  a1-update-marketing-skills \
  --global \
  --yes
npx skills@latest add ztemerbekov/marketing-skills -g
```

For a project-only installation, run both commands in that project, omit `--global` from the removal command, and omit `-g` from the installation command.

</details>

The easiest way to update is to ask your AI agent:

```text
Update Marketing Skills.
```

Here is what happens:

- installed Marketing Skills are updated in every app where you use them;
- new skills are installed automatically in those same apps;
- skills that are no longer part of the collection are removed automatically;
- skills from other collections do not change;
- manual changes inside installed skill files are lost.

Before changing an installation, Update verifies the complete source, installation, and connected-app state. If it cannot prepare the whole update safely, nothing changes and you receive one recovery action instead of a technical choice. If Node.js is unavailable or too old, it asks only “Node.js is required for the update. Install it and continue?” and, after approval, uses an already available trusted installer before resuming. A failure after changes begin is reported as partial completion with one instruction to retry; Update does not attempt an unsafe rollback.

You can also update from the terminal. Run the installation command again and select the skills and apps you want to update:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

## Help and feedback

If a skill produces a bad result, remove confidential information and email the input, instruction, output, and expected behavior to [z.temerbekov@gmail.com](mailto:z.temerbekov@gmail.com).

## For contributors

Developing or maintaining this repository? See [Contributing](./CONTRIBUTING.md).
