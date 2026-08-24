# <img src="./assets/logos/a1-logo.svg" alt="A1" width="40">&nbsp;Marketing Skills

**English** | [Русский](./README.ru.md)

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Hand over the routine to AI agents — freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

[Install the skills](#quick-start) · [See the skills](#skills) · [Learn more about each skill](#about-the-skills)

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

| Skill | Use it to |
| --- | --- |
| [Wayfinder](./docs/skills/a1-wayfinder.md)<br>`/a1-wayfinder` | Map an unclear marketing initiative and resolve its decisions one at a time. |
| [Grill](./docs/skills/a1-grill.md)<br>`/a1-grill` | Pressure-test a marketing idea, decision, or plan through a structured interview. |
| [Consumer Psychology](./docs/skills/a1-consumer-psy.md)<br>`/a1-consumer-psy` | Audit consumer hypotheses and interpret test outcomes using peer-reviewed research. |
| [Marketing Context](./docs/skills/a1-marketing-context.md)<br>`/a1-marketing-context` | Store confirmed marketing inputs for reuse by compatible skills. |
| [Copy Editing](./docs/skills/a1-copy-editing.md)<br>`/a1-copy-editing` | Edit or review an existing draft without inventing facts. |
| [Article Writing](./docs/skills/a1-article-writing.md)<br>`/a1-article-writing` | Turn a topic or source material into an article, guide, case study, or newsletter. |
| [Decision Memo](./docs/skills/a1-decision-memo.md)<br>`/a1-decision-memo` | Organize supplied material into a memo for a specific decision-maker. |
| [Promo Page](./docs/skills/a1-promo-page.md)<br>`/a1-promo-page` | Create the structure or copy for one promotional page, audience, and action. |
| [Press Release](./docs/skills/a1-press-release.md)<br>`/a1-press-release` | Draft a routine announcement and surface anything that still needs verification. |
| [Humanize](./docs/skills/a1-humanize.md)<br>`/a1-humanize` | Remove recognizable AI-writing patterns while preserving the author's voice and details. |

## About the skills

Choose a skill by the result you need. Each description explains when to start it, what it returns, and where it stops.

<details>
<summary><strong>Wayfinder — turns an unclear initiative into a decision map</strong></summary>

<br>

Wayfinder is for initiatives that are still too broad or uncertain for a useful brief or plan, such as entering a new market, repositioning a product, or preparing a launch. It defines the destination, separates confirmed decisions from open questions, and shows what blocks progress.

**What you get:** one document containing the destination, confirmed decisions, current questions, blockers, and scope boundary. Each continuation resolves at most one decision and updates the map. Wayfinder does not turn the map into a production plan or execute the work for the team.

> **Try asking:**
>
> `/a1-wayfinder`
>
> We want to enter a new market, but we cannot write a useful brief yet. Build a map of the decisions we need to make before choosing a route.

[Learn more about Wayfinder](./docs/skills/a1-wayfinder.md)

</details>

<details>
<summary><strong>Grill — finds weak assumptions before work begins</strong></summary>

<br>

Grill helps test a marketing idea, decision, or plan before the team spends time and budget. It breaks the subject into dependent decisions and runs the interview in rounds. Each round contains only questions that can already be answered.

**What you get:** a decision tree with numbered questions and a separate recommendation for each one. Your answers reshape the next round, while the final choice remains yours. Grill does not move into execution without confirmation.

> **Try asking:**
>
> `/a1-grill`
>
> We want to launch a Telegram channel for B2B lead generation. Find the weak points, hidden assumptions, and decisions we need to make before launch.

[Learn more about Grill](./docs/skills/a1-grill.md)

</details>

<details>
<summary><strong>Consumer Psychology — tests behavioral hypotheses against scientific research</strong></summary>

<br>

Consumer Psychology is for a specific hypothesis about customer behavior or a marketing-test result that needs an explanation. It separates observations from assumptions and checks possible mechanisms against peer-reviewed research.

**What you get:** an explanation with evidence limits, credible alternatives, and one falsifiable next test with metrics and countermetrics. The skill does not replace analytics, attribution, or technical diagnosis. For risky interventions, it adds a warning and offers a transparent alternative.

> **Try asking:**
>
> `/a1-consumer-psy`
>
> Conversion to plan selection fell after we changed the page. Separate facts from hypotheses and propose a test that could verify the most plausible explanation.

[Learn more about Consumer Psychology](./docs/skills/a1-consumer-psy.md)

</details>

<details>
<summary><strong>Marketing Context — keeps confirmed inputs for future work</strong></summary>

<br>

Marketing Context stores product facts, audience, positioning, brand voice, evidence, vocabulary, and prohibitions in one `.agents/marketing-context.md` file. Compatible skills can reuse these inputs instead of collecting them again.

**What you get:** a file containing only confirmed facts and approved decisions. During updates, the skill preserves unrelated content, never turns hypotheses into facts, and does not invent strategy.

> **Try asking:**
>
> `/a1-marketing-context`
>
> Extract the confirmed product, audience, brand-voice, and prohibited-language inputs from the attached documents. Save them in Marketing Context.

[Learn more about Marketing Context](./docs/skills/a1-marketing-context.md)

</details>

<details>
<summary><strong>Copy Editing — improves an existing draft without adding facts</strong></summary>

<br>

Copy Editing works with a selected draft: it shortens, clarifies, restructures, or reviews the text. When explicitly requested, it can apply information-style editing or return feedback without rewriting.

**What you get:** edited copy or a prioritized review. Facts, names, numbers, qualifications, meaning, and useful characteristics of the author's voice stay intact. The skill does not create positioning, an offer, or strategy from scratch.

> **Try asking:**
>
> `/a1-copy-editing`
>
> Make this text clearer and shorter. Preserve every fact and return only the final version.
>
> `[paste your draft]`

[Learn more about Copy Editing](./docs/skills/a1-copy-editing.md)

</details>

<details>
<summary><strong>Article Writing — turns source material into new long-form work</strong></summary>

<br>

Article Writing creates an article, guide, case study, expert piece, or newsletter issue from a topic, brief, notes, interview, or source pack. Its structure follows the reader's job and the available evidence rather than one universal formula.

**What you get:** a reviewable outline or a finished draft. The material helps the reader reach the stated outcome, claims and quotations stay connected to their sources, and evidence gaps remain visible. The skill does not fill those gaps with plausible prose.

> **Try asking:**
>
> `/a1-article-writing`
>
> Turn these interviews and product data into a practical article for operations directors. Separately identify any missing evidence.

[Learn more about Article Writing](./docs/skills/a1-article-writing.md)

</details>

<details>
<summary><strong>Decision Memo — turns complex inputs into a decision-ready document</strong></summary>

<br>

Decision Memo turns reports, correspondence, notes, analysis, or chronology into one internal memo for a specific reader. The opening makes clear what happened, why it matters, and whether the reader must decide, respond, approve, or act.

**What you get:** a self-contained summary followed by conclusions, options, risks, unknowns, next steps, and the necessary background. The skill organizes completed specialist input but does not redo legal, financial, or technical analysis or invent the decision.

> **Try asking:**
>
> `/a1-decision-memo`
>
> Turn the launch notes, finance-team comments, and risk list into a memo for the COO, who must approve or postpone the launch.

[Learn more about Decision Memo](./docs/skills/a1-decision-memo.md)

</details>

<details>
<summary><strong>Promo Page — presents one offer to one audience with one action</strong></summary>

<br>

Promo Page creates the structure or copy for a landing, product, service, course, event, or signup page. It helps one audience understand the offer, evaluate its supporting evidence, and take the next step.

**What you get:** an ordered page blueprint or finished copy with the message, evidence, conditions, call to action, and requirements for useful visuals. The skill does not invent product strategy, testimonials, results, prices, guarantees, urgency, or scarcity.

> **Try asking:**
>
> `/a1-promo-page`
>
> Write a page for this B2B service using the attached offer, customer evidence, price, and implementation terms.

[Learn more about Promo Page](./docs/skills/a1-promo-page.md)

</details>

<details>
<summary><strong>Press Release — turns a confirmed event into media-ready copy</strong></summary>

<br>

Press Release covers routine launches, openings, partnerships, programs, events, research publications, and customer-relevant changes. The opening states what happened and why it matters to the intended media audience; dates, assets, and the press contact are easy to find.

**What you get:** a distribution-ready release or a working draft listing what still needs confirmation or approval. The skill never presents proposed quotations as approved and does not handle crisis, legal-response, regulatory, earnings, securities, or investor-relations statements.

> **Try asking:**
>
> `/a1-press-release`
>
> Write a press release from these launch facts. Determine whether it is ready for distribution and separately list everything that still needs verification.

[Learn more about Press Release](./docs/skills/a1-press-release.md)

</details>

<details>
<summary><strong>Humanize — removes recognizable AI-writing patterns without losing the author's voice</strong></summary>

<br>

Humanize rewrites prose with recognizable signs of AI generation. It changes structure and rhythm while preserving facts, meaning, names, numbers, dates, quotations, and citations. A writing sample helps it match the author's voice more closely.

**What you get:** natural prose without the patterns that made it sound generated. By default, the skill shows a working rewrite, a short audit, and the final version; on request, it returns only the result. Paste the text into the conversation because the skill does not read or overwrite project files.

> **Try asking:**
>
> `/a1-humanize`
>
> Remove the recognizable AI-writing patterns while preserving every fact, the meaning, and my voice. Return only the final text.
>
> `[paste your text]`

[Learn more about Humanize](./docs/skills/a1-humanize.md)

</details>

---

## Install through marketplaces

Choose the AI app where you want to use the skills. Each option installs the complete collection.

If the installation method does not matter, use the [quick start](#quick-start) — it takes one command.

<details>
<summary><strong>Codex — install through Marketplace</strong></summary>

<br>

1. Add the marketplace and install the collection:

   ```bash
   codex plugin marketplace add ztemerbekov/a1-marketing-skills
   codex plugin add a1-marketing-skills@a1-marketing-skills
   ```

2. Start a new Codex task to load the installed skills.

</details>

<details>
<summary><strong>Cursor — install through Marketplace</strong></summary>

<br>

1. Add the marketplace:

   ```bash
   cursor-agent plugin marketplace add https://github.com/ztemerbekov/a1-marketing-skills
   ```

2. Start Cursor Agent, open `/plugin`, and choose the **A1 Marketing Skills** marketplace.

3. Install the **A1 Marketing Skills** plugin for your user account or project.

</details>

<details>
<summary><strong>Claude Code — install through Marketplace</strong></summary>

<br>

1. Add the marketplace and install the collection:

   ```text
   /plugin marketplace add ztemerbekov/a1-marketing-skills
   /plugin install a1-marketing-skills@a1-marketing-skills
   ```

2. Load the installed skills:

   ```text
   /reload-plugins
   ```

</details>

## Help and feedback

Questions, improvement ideas, or something that did not work as expected?<br>
Join the discussion in <img src="./assets/logos/a1-logo.svg" alt="A1" width="20">&nbsp;[Marketing&nbsp;Skills](https://t.me/a1_marketing_skills).
