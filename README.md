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
- [Use the skills](#use-the-skills)
- [Help and feedback](#help-and-feedback)

## Start here

1. Make sure [Node.js](https://nodejs.org/en/download) is installed. Choose an active LTS release; it includes `npm` and `npx`.
2. Open a terminal anywhere and install Marketing Skills globally:

   ```bash
   npx skills@latest add ztemerbekov/marketing-skills -g
   ```

3. Select the skills and AI clients you use. Installing all four skills is recommended. If the installer asks for a method, choose **Symlink**.
4. Open or reload your AI client, then describe the task in ordinary words:

   ```text
   Shorten this text, keep the facts and the calm tone:

   [your text]
   ```

The global installation makes the skills available across your projects. A project-only option is available in [Install](#install).

## Choose a skill

<!-- SKILLS:START -->
| Skill | Best for |
|-------|----------|
| [Marketing Context](skills/a1-setup-marketing-context/) (`a1-setup-marketing-context`) | Giving future marketing work reusable product, audience, positioning, voice, proof, vocabulary, examples, and goals. |
| [Editor](skills/a1-editor/) (`a1-editor`) | Improving existing text immediately: edit, shorten, clarify, strengthen, or restructure without inventing facts. |
| [Editor in Chief](skills/a1-editor-in-chief/) (`a1-editor-in-chief`) | Defining a strategic or editorial assignment through focused questions before Editor rewrites the text. |
| [Update Marketing Skills](skills/a1-update-marketing-skills/) (`a1-update-marketing-skills`) | Updating only this collection across already connected AI clients and offering newly available skills before installing them. |
<!-- SKILLS:END -->

Use this quick rule:

- Want the agent to remember your product, audience, voice, or proof for future work? Start with **Marketing Context**.
- Already have text and know what should change? Use **Editor**.
- Need to work out the reader, goal, format, constraints, positioning, or message before editing? Explicitly invoke **Editor in Chief**.
- Want the latest version of this collection without updating unrelated skills? Ask **Update Marketing Skills**.

Marketing Context is useful for repeated work, but Editor does not require it to improve supplied text.

## Meet the skills

<details>
<summary><strong>Marketing Context</strong></summary>

**What it does:** saves reusable facts about the product, audience, positioning, voice, proof, vocabulary, examples, and business goals in the current project. Other marketing skills can use this context in later tasks.

**Use it when:** you start marketing work in a project or when important product facts, audiences, proof, terminology, or voice guidelines change.

**Try:**

```text
Save our product, audience, positioning, voice, proof, preferred words, and business goals for future marketing work.
```

</details>

<details>
<summary><strong>Editor</strong></summary>

**What it does:** improves text you already have. It can edit, shorten, clarify, strengthen, or restructure the material while preserving supported facts, qualifications, and useful voice. It starts immediately when you provide text and an editing request.

**Use it when:** the underlying marketing decision is already made and you want a clearer, tighter, or better-organized version of the existing copy.

**Try:**

```text
Make this landing-page section clearer and shorter. Keep every number and do not add new promises:

[your text]
```

For information-style editing, ask for it explicitly: “Edit this in information style” or “по Ильяхову.” A generic request such as “clean this up” keeps the standard, more conservative editing behavior.

Requests to create or rethink positioning, an offer, an audience, campaign messaging, or a landing-page structure are outside Editor's text-editing boundary. Editor recommends that you explicitly invoke `a1-editor-in-chief`; it does not start the chief interview automatically.

</details>

<details>
<summary><strong>Editor in Chief</strong></summary>

**What it does:** helps define a strategic or demanding editorial assignment before rewriting begins. It asks only the questions that block the work, creates an Editor Brief, and then hands the selected editing operation to Editor.

**Use it when:** the reader, goal, format, constraints, positioning, message, or editing operation still needs to be decided. This skill starts only when you explicitly invoke it.

**Try:**

```text
Use a1-editor-in-chief. Help me define the audience, goal, message, and constraints for this page, then edit the supplied text.
```

</details>

<details>
<summary><strong>Update Marketing Skills</strong></summary>

**What it does:** updates only the skills installed from this repository. It refreshes existing skills in their already connected clients, removes skills that disappeared from `main`, and shows newly available skills before installing them.

**Use it when:** you want the latest Marketing Skills without updating unrelated collections. Installed files are replaced by the published version, including any manual changes made inside those files.

**Try:**

```text
Update Marketing Skills.
```

</details>

## Install

The same `npx skills` installer works with the supported clients below. This repository no longer uses separate client plugins, rules, or manual-copy installers.

<p>
  <img src="./assets/codex.webp" alt="Codex" width="18" height="18"> Codex &nbsp;&nbsp;
  <img src="./assets/claude.webp" alt="Claude Code" width="18" height="18"> Claude Code &nbsp;&nbsp;
  <img src="./assets/cursor.webp" alt="Cursor" width="18" height="18"> Cursor &nbsp;&nbsp;
  <img src="./assets/antigravity.webp" alt="Antigravity" width="18" height="18"> Antigravity
</p>

<details open>
<summary><img src="./assets/vercel.webp" alt="skills CLI" width="16" height="16"> <strong>Install globally with npx skills</strong></summary>

Run from any directory:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

The installer shows the available skills and detected AI clients. Select the clients you already use and choose the skills you want; installing the complete collection is recommended.

</details>

<details>
<summary>📁 <strong>Install only in the current project</strong></summary>

Open a terminal in the project and omit `-g`:

```bash
npx skills@latest add ztemerbekov/marketing-skills
```

Use this when the project must carry its own skill versions. Otherwise prefer the global installation.

</details>

<details>
<summary>🗑️ <strong>Remove Marketing Skills</strong></summary>

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

The recommended update is conversational. Ask your AI agent:

```text
Update Marketing Skills.
```

`a1-update-marketing-skills` then:

- updates existing Marketing Skills from the latest `main` in all already connected clients;
- also updates a project installation when it exists in the current directory;
- overwrites manual edits inside installed skill files without creating a backup;
- removes skills deleted or renamed upstream without asking;
- shows new skills in one list and asks before installing all or a selected subset;
- leaves every skill from another repository unchanged.

Declined new skills are offered again on the next update. The updater does not scan other project folders or connect a new AI client without permission.

If you prefer the terminal, rerun the source-scoped install command and select the skills and clients to refresh:

```bash
npx skills@latest add ztemerbekov/marketing-skills -g
```

The conversational updater is recommended when you want the complete source check, automatic cleanup, and new-skill review.

## Use the skills

- Write requests in the language you normally use. The skills answer in that language by default and preserve the language of supplied copy.
- Give Editor the complete text and a concrete intent such as “shorten,” “clarify,” “strengthen,” or “restructure.”
- State important constraints directly: preserve the numbers, keep the voice, keep the structure, or return only the edited text.
- Set up Marketing Context when you want consistent product facts and voice across repeated tasks. Missing context does not block an ordinary edit.
- Invoke Editor in Chief by name when you want the assignment clarified before editing.
- Ask Update Marketing Skills to refresh only this collection.

## Help and feedback

If a skill produces a bad result, remove confidential information and email the input, instruction, output, and expected behavior to [z.temerbekov@gmail.com](mailto:z.temerbekov@gmail.com).

## For contributors

Developing or maintaining this repository? See [Contributing](./CONTRIBUTING.md).
