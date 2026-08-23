# A1 Skill Design Contract

Use this contract when creating or materially changing an A1 skill. It defines durable behavior principles, not a release process.

## One Recognizable User Job

Give each public skill one outcome a user can recognize and request without knowing the internal method. A materially different interaction contract is a reason to split a skill; an operation variant is not.

## Client Presentation

Treat client-facing metadata as part of the public skill contract. The display name identifies the skill; the short description states its one recognizable user job in plain language and must not broaden its scope or imply unsupported outcomes.

Use only metadata fields the client officially supports. When the schema provides one global string, use one concise English default rather than inventing locale variants. Keep presentation and invocation metadata consistent with the skill's runtime contract.

English is this repository's primary language and the default language for client metadata. Write `description`, `shortDescription`, `longDescription`, and the `description` in `SKILL.md` frontmatter as one English value. Do not add a Russian translation or a bilingual product-name parenthetical to a description. A skill description may quote a non-English user phrase only when the literal phrase defines a real invocation trigger rather than an alternate translated metadata value.

Every public A1 skill must include OpenAI client icons at `assets/icon-small.svg` and `assets/icon-large.svg` and reference those paths from `agents/openai.yaml`. Derive both from the canonical `assets/logos/a1-logo.svg`: preserve its vector paths, gradients, and proportions; center the visible logo bounds on a transparent square canvas; and add no background or decorative shape. Use a `192×192` canvas for the small icon and a `1024×1024` canvas for the large icon.

## Plugin Packaging and Bilingual Discoverability

Treat plugin packaging and Marketplace discoverability as part of the public skill contract. A public skill collection is complete only when its skills and all applicable client packaging work together.

Create and maintain the applicable client manifests together:

- `plugin.json` for the Agent Plugins v1 portable identity;
- `.codex-plugin/plugin.json`;
- `.agents/plugins/marketplace.json`;
- `.claude-plugin/marketplace.json`;
- `.cursor-plugin/plugin.json`;
- `.cursor-plugin/marketplace.json`;
- `agents/openai.yaml` inside every public skill.

The root `plugin.json` owns the collection's portable identity and contains only fields supported by the Agent Plugins v1 schema. Portable skills remain immediate children of `skills/`; do not declare a custom skills path in the portable manifest. Client manifests and marketplace catalogs remain adapters for client-owned presentation, installation, policy, and distribution behavior. Do not remove an adapter until its consumer and replacement are verified.

Use only fields supported by each client's schema. Keep Marketplace files free of unsupported search fields; put search metadata in that client's plugin manifest when the schema supports it.

Use these canonical product names for this repository's public collection:

- Russian: `A1 Маркетинговые скиллы`;
- English: `A1 Marketing Skills`.

Apply the canonical names consistently:

- Global client display names and English-language surfaces use `A1 Marketing Skills`; Russian-language surfaces use `A1 Маркетинговые скиллы`.
- Client, plugin, and skill descriptions that mention the collection use the English form `A1 Marketing Skills` only.
- Use the canonical forms rather than mixed-script or improvised name variants.
- Add the concise Russian and English search forms below to every supported `keywords` field. They deliberately omit the `A1` prefix, which remains part of product and display names. Keep `tags` limited to category terms; do not duplicate these collection-name search forms there.

```json
[
  "Маркетинговые скиллы",
  "Marketing Skills"
]
```

## Human-Facing Skill Documentation

Document each public skill for people in a paired English and Russian page under `docs/skills/`:

- `docs/skills/<skill-name>.md` is the English page;
- `docs/skills/<skill-name>.ru.md` is the Russian page.

Keep the language switcher near the top of both files:

- English: `**English** | [Русский](./<skill-name>.ru.md)`;
- Russian: `[English](./<skill-name>.md) | **Русский**`.

The page helps a person decide when to use the skill and recognize whether it worked. It is not a runtime instruction and must not reproduce the procedure, templates, or detailed canon owned by `SKILL.md` and its local references.

Cover the skill's one recognizable user job and defining constraint; when to use it, including its invocation mode and trigger boundary; common questions supported by real user questions, issues, or change history; user-observable signs that it is working; and its boundaries with neighboring skills. Size common questions to the available evidence rather than padding the section, and write headings naturally in each language.

Update the English and Russian pages together when documented behavior changes. `README.md` and `README.ru.md` remain landing pages and catalogs: keep their catalog entries concise and link each skill to the matching language page. The paired pages own the detailed human-facing contract. While an extended skill overview remains in either README, treat it as a non-canonical summary and keep both README versions aligned with the paired pages.

Add both pages when introducing a new public skill. When renaming or removing a skill, move or remove both pages and update both README links in the same change. Use complete content rather than empty placeholders.

## Invocation

Choose invocation from user expectations:

- A model-invoked skill may start from matching natural-language intent when doing so is safe and unsurprising.
- A user-invoked skill starts only when the user deliberately names or commands it. Apply the supported client controls together.

Explicit work intent is not the same as naming a skill. A model-invoked workflow may still require an explicit request before writing files or changing state.

## Scope Before Work

Classify the complete request before gathering optional context or producing an artifact:

- in scope;
- out of scope;
- mixed job;
- completed external input.

Declare what the skill may perform, what it must not perform, which completed inputs it may consume, and how it handles mixed requests. Accepting a completed input does not authorize the skill to create or rethink it.

## Gates and Sources

Use the lightest gate that makes execution safe. Missing optional context must not block a useful result. Ask only for information whose absence would make the next step unsafe or materially arbitrary.

Prefer current user instructions and supplied material. Treat repository context as defaults unless its facts, evidence, or explicit prohibitions are protected. Never invent facts, proof, claims, decisions, or source authority.

## Repository Marketing Context Resolution

When a skill is explicitly permitted to consume repository Marketing Context, resolve exactly one source in the current repository, in this order:

1. `.agents/marketing-context.md`;
2. `.claude/marketing-context.md`, only when the canonical path is absent;
3. `marketing-context.md` at the repository root, only when both earlier paths are absent.

Read only the first existing path. Do not inspect, merge, or let a lower-priority context affect an ordinary run. This order selects an eligible source; it does not replace a skill-specific gate. A skill may require consent before reading, and context maintenance may require explicit authorization before migration or legacy-file removal. A material conflict between confirmed facts remains a user decision regardless of path precedence.

Skills that are not permitted to consume repository Marketing Context must state that boundary and must not apply this resolution rule. Each installable skill owns its self-contained runtime instruction; this contract is the canonical design rule rather than a runtime dependency.

## Self-Contained Runtime

An installed skill must contain everything required for its behavior. Keep the main instruction concise, load detailed local references only when the active branch needs them, and never depend on maintainer evals or repository-level process documents at runtime.

If one skill depends on another, invoke that skill through its public interface. Do not copy or deep-link its private canon.

## Output

Describe output by its purpose and required content. Prescribe exact labels or headings only when an external artifact format requires them.

Every public skill must expose the public support route only after a final user-facing result that fulfills its declared recognizable user job. Link the short footer to [A1 Marketing Skills](https://t.me/a1_marketing_skills). Do not append it to boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, or any response that does not fulfill that job. A user's explicit request for only the final artifact, or to prohibit extra material, always suppresses the footer. Each skill owns this runtime instruction so its direct installation remains self-contained; this contract defines the product rule for new skills.

## Evaluation

Use realistic criteria-based regression cases for behavior that is risky or has failed before. State what must change, what must be preserved, and what is forbidden. Test user-visible meaning and behavior rather than generated wording or headings. Evals may be manual and optional; their value comes from observable criteria, not from the number of files.

Record change-specific prompts, outputs, and judgments in the pull request or GitHub Release. Structural validation proves repository shape only; it never proves semantic quality.
