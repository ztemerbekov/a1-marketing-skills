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

If this is your first time using Marketing Skills, start with [Marketing Context](skills/a1-setup-marketing-context/). It saves product information that the other skills can reuse.

<!-- SKILLS:START -->
| Skill | Best for |
|-------|----------|
| [Editor](skills/a1-editor/)<br>`a1-editor` | Improve existing text: shorten, clarify, strengthen, or restructure it without inventing facts. |
| [Editor in Chief](skills/a1-editor-in-chief/)<br>`a1-editor-in-chief` | Define the reader, goal, format, constraints, and message before editing the text. |
| [Marketing Context](skills/a1-setup-marketing-context/)<br>`a1-setup-marketing-context` | Save product, audience, and voice information for future work. |
| [Update Marketing Skills](skills/a1-update-marketing-skills/)<br>`a1-update-marketing-skills` | Update only Marketing Skills and decide separately whether to install new skills from the collection. |
<!-- SKILLS:END -->

## Meet the skills

Write to the skills in the language you normally use. They answer in that language and preserve the language of your original text.

<details>
<summary><strong>Editor</strong></summary>

**What it does:** improves text you already have by shortening, clarifying, strengthening, or restructuring it. It preserves facts, numbers, and your voice without adding new promises.

**Use it when:** the text already exists and you know what should change. Include the complete text and state any important constraints up front.

Marketing Context is useful for repeated work, but ordinary editing does not require it.

**Try:**

```text
Make this landing-page section clearer and shorter. Keep every number and do not add new promises:

[your text]
```

If you want information-style editing, say so directly. If you need to rethink the audience, positioning, offer, or page structure, Editor suggests Editor in Chief but does not start it automatically.

</details>

<details>
<summary><strong>Editor in Chief</strong></summary>

**What it does:** helps define the assignment before handing the text to Editor. It asks only for what is needed to begin: the reader, goal, format, constraints, and type of edit.

**Use it when:** you are not yet sure who the text is for, what it should achieve, or which message it should carry. Invoke Editor in Chief by name.

**Try:**

```text
Use a1-editor-in-chief. Help me define the audience, goal, message, and constraints for this page, then edit the text.
```

</details>

<details>
<summary><strong>Marketing Context</strong></summary>

**What it does:** saves information about your product, audience, positioning, voice, proof, and goals. The other marketing skills can reuse it in future work.

**Use it when:** you start working on a project or when the product, audience, important facts, or voice guidelines change.

**Try:**

```text
Save our product, audience, positioning, voice, proof, and business goals for future marketing work.
```

</details>

<details>
<summary><strong>Update Marketing Skills</strong></summary>

**What it does:** installs the latest Marketing Skills in every app where you use them. It does not change skills from other collections.

**Use it when:** you want fixes and new capabilities. If the collection includes new skills, you decide whether to install them.

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
  a1-setup-marketing-context \
  a1-editor \
  a1-editor-in-chief \
  a1-update-marketing-skills \
  --global \
  --yes
```

For a project-only installation, run the command from that project and omit `--global`.

</details>

## Update

The easiest way to update is to ask your AI agent:

```text
Update Marketing Skills.
```

Here is what happens:

- installed Marketing Skills are updated in every app where you use them;
- skills that are no longer part of the collection are removed automatically;
- if new skills are available, the agent shows them and asks which ones to install;
- skills from other collections do not change;
- manual changes inside installed skill files are lost.

You can also update from the terminal. Run the installation command again and select the skills and apps you want to update:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

## Help and feedback

If a skill produces a bad result, remove confidential information and email the input, instruction, output, and expected behavior to [z.temerbekov@gmail.com](mailto:z.temerbekov@gmail.com).

## For contributors

Developing or maintaining this repository? See [Contributing](./CONTRIBUTING.md).
