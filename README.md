# <img src="./assets/logos/a1-logo.svg" alt="A1" width="40">&nbsp;Marketing Skills

**English** | [Русский](./README.ru.md)

[![skills.sh](https://skills.sh/b/ztemerbekov/a1-marketing-skills)](https://skills.sh/ztemerbekov/a1-marketing-skills)

**Hand over the routine to AI agents — freeing marketing teams to focus on strategy, vision, and growth-driving decisions.**

[Install](#quick-start) · [See the skills](#skills) · [Learn more](#about-the-skills)

---

## Quick start

1. Open a terminal and install the collection:

   ```bash
   npx skills@latest add ztemerbekov/a1-marketing-skills -g
   ```

   To update the installed skills later, run `npx skills update`.

2. Select the AI agents you use and the skills you need.

3. Start a new session and try:

   > `/a1-copy-editing`
   >
   > Make this paragraph clearer and shorter. Preserve every fact and do not add new claims.
   >
   > `[paste your draft]`

## Skills

### Marketing Strategies

| Skill | Use it to |
| --- | --- |
| [Wayfinder](./docs/skills/a1-wayfinder.md)<br>`/a1-wayfinder` | Break an unclear marketing initiative into the decisions needed for a brief, strategy, or plan. |
| [Grill](./docs/skills/a1-grill.md)<br>`/a1-grill` | Find weak points in a marketing idea, decision, or plan before work begins. |
| [Consumer Psychology](./docs/skills/a1-consumer-psy.md)<br>`/a1-consumer-psy` | Test a consumer hypothesis or explain a test result using scientific research. |
| [Marketing Context](./docs/skills/a1-marketing-context.md)<br>`/a1-marketing-context` | Save confirmed product, audience, and brand-voice inputs for future work. |

### Writing & Editing

| Skill | Use it to |
| --- | --- |
| [Copywriting](./docs/skills/a1-copywriting.md)<br>`/a1-copywriting` | Turn a communication goal, facts, and source material into finished written communication in the right format. |
| [Copy Editing](./docs/skills/a1-copy-editing.md)<br>`/a1-copy-editing` | Edit an existing draft without adding facts or losing the author's voice. |
| [Article Writing](./docs/skills/a1-article-writing.md)<br>`/a1-article-writing` | Create an article, guide, case study, or newsletter from supplied material and verified sources. |
| [Decision Memo](./docs/skills/a1-decision-memo.md)<br>`/a1-decision-memo` | Build an internal memo that makes clear what happened and what decision is needed. |
| [Business Message](./docs/skills/a1-business-message.md)<br>`/a1-business-message` | Turn working context or a selected draft into one workplace message that is easy to understand and answer. |
| [Landing Page Copy](./docs/skills/a1-landing-page-copy.md)<br>`/a1-landing-page-copy` | Create landing-page copy for one audience with a clear offer, evidence, and next step. |
| [Press Release](./docs/skills/a1-press-release.md)<br>`/a1-press-release` | Prepare a press release with confirmed facts for distribution or approval. |
| [Cold Email](./docs/skills/a1-cold-email.md)<br>`/a1-cold-email` | Write one personalized first-contact email from supplied recipient, offer, and proof facts. |
| [Presentation Copy](./docs/skills/a1-presentation-copy.md)<br>`/a1-presentation-copy` | Structure a new presentation or write its slide-by-slide message from supplied material. |
| [Company Profile](./docs/skills/a1-company-profile.md)<br>`/a1-company-profile` | Create a factual public company profile or About page for one primary audience. |
| [Humanize](./docs/skills/a1-humanize.md)<br>`/a1-humanize` | Remove visible signs of AI generation without losing facts, meaning, or the author's voice. |

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
<summary><strong>Copywriting — turns your inputs into finished written communication</strong></summary>

<br>

Copywriting turns a goal, audience, facts, and source material into finished written communication. It can create landing-page copy, press releases, articles, decision memos, business messages, cold emails, presentation copy, and company profiles while applying the requirements of each format.

**What you get:** one finished text in the format that fits the stated goal. If the request contains several independent texts, the skill asks which one to create first. A selected existing draft remains a separate editing job.

> **Try asking:**
>
> `/a1-copywriting`
>
> Write new marketing copy for a page that explains one consulting offer to operations leaders and asks them to book a diagnostic call. Use the attached offer, proof, price, and implementation terms.

[Learn more about Copywriting](./docs/skills/a1-copywriting.md)

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
<summary><strong>Business Message — turns working context into one answerable workplace message</strong></summary>

<br>

Business Message turns supplied working context or a selected workplace-message draft into one compact message for an existing business contact. It supports two input branches: assemble from facts, notes, correspondence, documents, tables, or transcript material; or rewrite one selected draft for the same source-supported communication job.

**What you get:** one message with the point first, enough context, clear recommendation or decision status, and an operational next step. It does not invent facts, solutions, owners, deadlines, approvals, or decisions; when the sources contain no solution or deadline, that gap remains visible.

> **Try asking:**
>
> `/a1-business-message`
>
> Use the campaign report and performance-contractor thread to write one message to Elon Musk explaining why a fictional campaign to recruit the first wave of Mars travelers missed its target. Lead with the cause, preserve the source-supported impact of pausing the ads and the status of the new creative assets, recommend a recovery plan grounded in the materials, and ask him to approve it by Friday at 4:00 p.m.

[Learn more about Business Message](./docs/skills/a1-business-message.md)

</details>

<details>
<summary><strong>Landing Page Copy — presents one offer to one audience with one action</strong></summary>

<br>

Landing Page Copy creates the structure or copy for a landing, product, service, course, event, or signup page. It helps one audience understand the offer, evaluate its supporting evidence, and take the next step.

**What you get:** an ordered page blueprint or finished copy with the message, evidence, conditions, call to action, and requirements for useful visuals. The skill does not invent product strategy, testimonials, results, prices, guarantees, urgency, or scarcity.

> **Try asking:**
>
> `/a1-landing-page-copy`
>
> Write a page for this B2B service using the attached offer, customer evidence, price, and implementation terms.

[Learn more about Landing Page Copy](./docs/skills/a1-landing-page-copy.md)

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
<summary><strong>Cold Email — writes one relevant first-contact message</strong></summary>

<br>

Cold Email turns supplied recipient, relationship, sender, offer, and proof facts into one personalized outreach email. It establishes why this recipient should hear from this sender now and asks for a proportionate next step.

**What you get:** one subject line and one short finished email. The skill does not research prospects, create sequences or bulk templates, continue an existing conversation, edit a selected draft, or invent familiarity, pain points, proof, urgency, or scarcity.

> **Try asking:**
>
> `/a1-cold-email`
>
> Write one cold email to the COO of Northwind Logistics using the attached recipient dossier, our implementation offer, and two confirmed customer results.

[Learn more about Cold Email](./docs/skills/a1-cold-email.md)

</details>

<details>
<summary><strong>Presentation Copy — turns supplied material into a coherent slide sequence</strong></summary>

<br>

Presentation Copy builds the message architecture or slide-by-slide copy for one new presentation. It works from a defined audience, occasion, next step, and completed source material, with different density for live and standalone decks.

**What you get:** an outline or a draft with one takeaway per slide, concise on-slide content, and supported visual instructions. It does not create a deck file, design slides, conduct research, invent data, or edit a selected existing deck.

> **Try asking:**
>
> `/a1-presentation-copy`
>
> Create a 10-slide live presentation for the COO from the attached pilot report. The goal is approval for a six-week rollout.

[Learn more about Presentation Copy](./docs/skills/a1-presentation-copy.md)

</details>

<details>
<summary><strong>Company Profile — explains a company through supported facts and practices</strong></summary>

<br>

Company Profile creates one public company profile or About page for a primary audience and context. It answers what the company does, for whom, how it works, why it is credible, and what the reader should do next.

**What you get:** an evidence-mapped outline or a finished profile with material source gaps kept visible. The skill does not invent positioning, mission, values, history, credentials, social impact, or culture; mission and values require confirmed decisions and observable practices.

> **Try asking:**
>
> `/a1-company-profile`
>
> Draft an About page for procurement leaders using the attached company history, service model, security policy, and approved customer evidence.

[Learn more about Company Profile](./docs/skills/a1-company-profile.md)

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

Have questions or did something not work as expected? Message us on [Telegram](https://t.me/a1_marketing_skills).
