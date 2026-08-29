# A1 Message Design

## Summary

Add `a1-message` as a standalone, model-invoked public skill. It creates or rewrites one self-contained workplace message for an existing business relationship. The recipient should be able to understand the situation, distinguish the proposed or decided action, and respond or proceed without avoidable follow-up.

The skill is distinct from a decision memo because its artifact is one compact operational message rather than a layered internal document. It is distinct from copy editing because it owns the finished workplace-message job whether the user supplies raw material or a selected draft.

## Recognizable User Job

Turn supplied facts, notes, correspondence, documents, transcript material, or a selected draft into one finished message for a manager, colleague, employee, contractor, partner, or existing client.

The message may inform, request, recommend, escalate, ask for approval, record a decision, or set a next step. Every accepted request produces one message for one communication job.

## Invocation

`a1-message` is model-invoked. Its description is the always-loaded context pointer and must name the two genuine entry branches without synonym lists:

1. creating one workplace message from supplied source material;
2. rewriting a selected workplace-message draft into the finished message.

Proposed frontmatter:

```yaml
---
name: a1-message
description: Draft or rewrite one self-contained workplace message from supplied facts, source material, or a selected draft when an existing business contact needs to understand, decide, act, or reply without avoidable follow-up.
metadata:
  author: Zinnur Temerbekov
---
```

The skill omits user-invocation controls. Natural-language intent and explicit `$a1-message` invocation are both supported.

## Scope

### In scope

- One new workplace message assembled from supplied material.
- One selected workplace-message draft rewritten for the same source-supported job.
- Messenger messages and ordinary business-email messages.
- Existing business relationships, including internal and external recipients.
- Supplied correspondence, documents, notes, tables, and transcript material as completed inputs.

### Outside scope

- Cold first-contact outreach, sequences, bulk campaigns, or merge-field templates.
- Public marketing, editorial, media, or social copy.
- A layered decision memo, report, meeting record, project plan, or other long internal artifact.
- Performing specialist, strategic, financial, legal, technical, or operational analysis that the message would merely communicate.
- Multiple unrelated messages in one run.

### Neighbor boundaries

- `a1-cold-email` owns one new cold first-contact email.
- `a1-decision-memo` owns layered internal documents built for decision, approval, response, or awareness.
- `a1-copy-editing` owns editing or reviewing selected marketing and editorial drafts that are not workplace-message jobs.

For a mixed request, identify the incompatible job and stop before producing a partial message. Completed analysis may be consumed, but accepting it does not authorize the skill to perform or rethink that analysis.

## Source Boundary

The message may use the current instruction, user-selected material, clearly applicable earlier conversation facts, and the first eligible repository Marketing Context selected by the standard precedence rule.

Facts, figures, decisions, recommendations, owners, deadlines, quotations, and causal claims must remain traceable to those sources. A recommendation may be foregrounded when supplied, or derived narrowly when explicit criteria make the conclusion non-arbitrary. The skill does not manufacture substantive options or choose among materially different decisions to make a message appear complete.

Missing optional detail does not block a useful message. Ask one concise question only when every accurate result would otherwise invent a material fact or choose between materially different meanings or decisions. Otherwise produce the safest complete message and state a material limitation outside it only when the limitation affects use.

## Runtime Architecture

`SKILL.md` owns the entry contract, reference routing, and output contract. It points every accepted run to `references/message-spine.md`, which owns stage order and completion criteria.

### Stage 1: Confirm the communication job

Identify one recipient, the message purpose, the required awareness, decision, action, or reply, and any explicit channel or format constraint.

**Complete when:** one recipient and one source-supported communication job determine what the message must enable.

### Stage 2: Build the message map

Load `references/source-policy.md`. Separate the main point, necessary context, facts, problem, supplied options, recommendation, decision status, requested action, owner, deadline, risks, unknowns, and supporting detail.

**Complete when:** every substantive element eligible for the message has a source status and unsupported completion details are excluded.

### Stage 3: Design the reading path

Load `references/message-structure.md`. Order the content by recipient value rather than chronology: main point, necessary context, proposed or decided response, timing, then supporting detail. Select only the blocks the job needs.

**Complete when:** the opening can stand alone and the remaining content answers the recipient's likely operational questions without repeating the source trail.

### Stage 4: Draft or rewrite

Create one compact message. Process forwarded material into a short conclusion-bearing summary. Preserve the selected draft's supported meaning while replacing its reading path when rewriting. Use bold only for real scanning anchors such as the requested decision, amount, deadline, or action.

**Complete when:** the message makes what happened, what matters, what is proposed or decided, what is required, and the supported next step recoverable at a glance.

### Stage 5: Recipient check

Load `references/final-qa.md` and revise until every applicable criterion passes.

**Complete when:** the recipient can act, decide, reply, or remain informed without an avoidable clarification caused by the message, and every substantive statement remains source-faithful.

## Information Hierarchy

The runtime package has four disclosed references, each with one owner:

- `message-spine.md`: invariant stage order and completion criteria;
- `source-policy.md`: allowed sources, message map, recommendation limits, Marketing Context, and source gaps;
- `message-structure.md`: ordering, context density, blocks, brevity, emphasis, and next-step construction;
- `final-qa.md`: exhaustive user-visible completion check.

The main file does not restate reference rules. Each reference co-locates a concept's definition, rules, limits, and completion test. Evaluation cases are maintainer material and are never runtime dependencies.

## Output Contract

Lead with the finished message. Include an email subject only when the user requests one or the selected email artifact requires it.

Add a source gap or assumption only when it materially affects safe use. Add process commentary only when the user asks for it. Return only the artifact when the user requests message-only output.

Append the standard A1 support footer only after a successful final result and suppress it for artifact-only output, boundary responses, clarification prompts, or unsuccessful runs.

## Public Package

Create the canonical package at `skills/a1-message/` with:

- `SKILL.md`;
- `references/message-spine.md`;
- `references/source-policy.md`;
- `references/message-structure.md`;
- `references/final-qa.md`;
- `agents/openai.yaml`;
- `assets/icon-small.svg` and `assets/icon-large.svg` derived from the canonical A1 logo;
- `evals/README.md` and focused criteria-based cases.

Proposed OpenAI presentation:

```yaml
interface:
  display_name: "A1 Message"
  short_description: "Turn working context into one actionable message"
  icon_small: "./assets/icon-small.svg"
  icon_large: "./assets/icon-large.svg"
  brand_color: "#FF6A00"
  default_prompt: "Use $a1-message to turn the warehouse delay notes, two recovery options, and Friday cutoff into one message the operations director can approve without chasing details."
```

Add paired English and Russian pages under `docs/skills/`. Add the skill to both README catalogs, `skills.sh.json`, every applicable plugin manifest and marketplace catalog, and all client-facing inventory surfaces required by the repository design contract. Marketplace catalogs must expose the same intended skill set, group, slug, description, and visibility.

## Evaluation Design

Add realistic criteria-based cases for the following risks:

1. **New approval message:** raw project facts and supplied options become one conclusion-first message with a recommendation and supported next step.
2. **Selected draft:** a chronological workplace draft is rewritten without changing its facts, decision status, or tone constraints.
3. **Raw forward:** a long correspondence chain is processed into a short summary; the source trail is not pasted into the message.
4. **Problem without a solution:** absent options or decision criteria remain visible; the skill does not manufacture a substantive recommendation.
5. **Missing owner or deadline:** a useful message proceeds when safe, while a material gap remains explicit rather than invented.
6. **Neighbor boundary:** cold outreach, a layered memo, and public copy are rejected before partial drafting.

Each case scores `Must Change`, `Must Preserve`, and `Forbidden` behavior. No case asserts exact prose, headings, or private runtime layout.

## Validation

During implementation, run the narrowest relevant checks after coherent edit batches. Before the pull request, run:

```bash
bash -n scripts/validate-skills.sh
./scripts/validate-skills.sh
git diff --check
```

Manually compare every public catalog and review the final `default_prompt` for a concrete user outcome. The new-skill manifest must be presented for explicit maintainer approval before the change is released to `main`.

## Acceptance Criteria

- `a1-message` is a standalone model-invoked public skill with the approved name and scope.
- Both raw-source creation and selected-draft rewriting produce one finished workplace message.
- The invariant spine has checkable completion criteria for every stage.
- Runtime rules have one canonical owner and stage-specific references load only when reached.
- The message is conclusion-first, source-faithful, compact, scannable, and operational about the supported response or next step.
- Missing material is handled without invention or unnecessary blocking.
- Neighbor skills retain clear, documented boundaries.
- English and Russian documentation, manifests, catalogs, icons, and evaluation cases are complete and synchronized.
- Every deterministic validation passes after the final edit.
