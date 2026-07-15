![Marketing Skills](./assets/marketing-skills-evolution.png)

# Marketing Skills

**English** | [Русский](./README.ru.md)

Marketing Skills is a small team of AI skills for marketers, founders, and anyone who works with marketing copy. The skills help your agent remember product context, improve existing text, and prepare complex editorial assignments without inventing facts about the product.

You do not need to learn a special command language. Install the skills, describe the task in ordinary words, and include the text when you want it edited.

## Contents

- [Start here](#start-here)
- [Choose a skill](#choose-a-skill)
- [Meet the skills](#meet-the-skills)
- [Install](#install)
- [Use the skills](#use-the-skills)
- [Help and feedback](#help-and-feedback)

## Start here

1. Open a terminal in the project where you want to use the skills.
2. Install all current Marketing Skills:

   ```bash
   npx skills@latest add ztemerbekov/marketing-skills
   ```

3. Open or reload your AI client. Codex users should restart Codex after installation.
4. Paste your text and ask for the change you need:

   ```text
   Shorten this text, keep the facts and the calm tone:

   [your text]
   ```

The recommended installer is the simplest option for a project shared across different AI clients. Client-specific alternatives are available in [Install](#install).

## Choose a skill

<!-- SKILLS:START -->
| Skill | Best for |
|-------|----------|
| [Marketing Context](skills/a1-setup-marketing-context/) (`a1-setup-marketing-context`) | Giving future marketing work reusable product, audience, positioning, voice, proof, vocabulary, examples, and goals. |
| [Editor](skills/a1-editor/) (`a1-editor`) | Improving existing text immediately: edit, shorten, clarify, strengthen, or restructure without inventing facts. |
| [Editor in Chief](skills/a1-editor-in-chief/) (`a1-editor-in-chief`) | Defining a strategic or editorial assignment through focused questions before Editor rewrites the text. |
<!-- SKILLS:END -->

Use this quick rule:

- Want the agent to remember your product, audience, voice, or proof for future work? Start with **Marketing Context**.
- Already have text and know what should change? Use **Editor**.
- Need to work out the reader, goal, format, constraints, positioning, or message before editing? Explicitly invoke **Editor in Chief**.

Marketing Context is useful for repeated work, but Editor does not require it to improve a supplied text.

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

## Install

### Recommended project installation

Run this command from the project where you want the skills:

```bash
npx skills@latest add ztemerbekov/marketing-skills
```

It installs all current skills into the project using the cross-agent convention. Use one of the alternatives below only when you prefer a client-native installation or your client needs its adapter.

<details>
<summary><img src="./assets/codex.webp" alt="Codex" width="16" height="16"> <strong>Codex: install from GitHub</strong></summary>

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo ztemerbekov/marketing-skills \
  --path skills/a1-setup-marketing-context skills/a1-editor skills/a1-editor-in-chief
```

Restart Codex after installation.

</details>

<details>
<summary><img src="./assets/claude.webp" alt="Claude Code" width="16" height="16"> <strong>Claude Code: install as a plugin</strong></summary>

```text
/plugin marketplace add ztemerbekov/marketing-skills
/plugin install marketing-skills
```

To install only the editorial team bundle:

```text
/plugin install editorial-team
```

</details>

<details>
<summary><img src="./assets/cursor.webp" alt="Cursor" width="16" height="16"> <strong>Cursor: copy the skills and Cursor rule</strong></summary>

Clone this repository, open a terminal in its root, set the target project path, and run:

```bash
TARGET_PROJECT=/path/to/your/project
mkdir -p "$TARGET_PROJECT/.cursor/rules" "$TARGET_PROJECT/skills"
cp -R skills/a1-* "$TARGET_PROJECT/skills/"
cp .cursor/rules/marketing-skills.mdc "$TARGET_PROJECT/.cursor/rules/"
```

</details>

<details>
<summary><img src="./assets/antigravity.webp" alt="Antigravity" width="16" height="16"> <strong>Antigravity: copy skills into the project</strong></summary>

Clone this repository, open a terminal in its root, set the target project path, and run:

```bash
TARGET_PROJECT=/path/to/your/project
mkdir -p "$TARGET_PROJECT/.agents/skills"
cp -R skills/a1-* "$TARGET_PROJECT/.agents/skills/"
```

</details>

<details>
<summary>🗑️ <strong>Remove installed skills</strong></summary>

Remove a project installation:

```bash
rm -rf .agents/skills/a1-setup-marketing-context \
       .agents/skills/a1-editor \
       .agents/skills/a1-editor-in-chief \
       .claude/skills/a1-setup-marketing-context \
       .claude/skills/a1-editor \
       .claude/skills/a1-editor-in-chief
```

Remove a global Codex installation:

```bash
rm -rf ~/.codex/skills/a1-setup-marketing-context \
       ~/.codex/skills/a1-editor \
       ~/.codex/skills/a1-editor-in-chief
```

</details>

## Use the skills

- Write requests in the language you normally use. The skills answer in that language by default and preserve the language of the supplied copy.
- Give Editor the complete text and a concrete intent such as “shorten,” “clarify,” “strengthen,” or “restructure.”
- State important constraints directly: preserve the numbers, keep the voice, keep the structure, or return only the edited text.
- Set up Marketing Context when you want consistent product facts and voice across repeated tasks. Missing context does not block an ordinary edit.
- Invoke Editor in Chief by name when you want the assignment clarified before editing.

## Help and feedback

If a skill produces a bad result, remove confidential information and email the input, instruction, output, and expected behavior to [z.temerbekov@gmail.com](mailto:z.temerbekov@gmail.com).

## For contributors

Developing or maintaining this repository? See [Contributing](./CONTRIBUTING.md).
