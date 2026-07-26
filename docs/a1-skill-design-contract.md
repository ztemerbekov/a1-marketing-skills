# A1 Skill Design Contract

Use this contract when creating or materially changing an A1 skill. It defines durable behavior principles, not a release process.

## One Recognizable User Job

Give each public skill one outcome a user can recognize and request without knowing the internal method. A materially different interaction contract is a reason to split a skill; an operation variant is not.

## Client Presentation

Treat client-facing metadata as part of the public skill contract. The display name identifies the skill; the short description states its one recognizable user job in plain language and must not broaden its scope or imply unsupported outcomes.

Use only metadata fields the client officially supports. When the schema provides one global string, use one concise English default rather than inventing locale variants. Keep presentation and invocation metadata consistent with the skill's runtime contract.

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

## Language and Output

Define one language-selection rule for rewritten material, explanations, and other user-facing runtime messages. Preserve user constraints and make the output contract clear enough to review without forcing one golden wording.

Keep locale-specific text co-located with a locale-specific contract, such as supplied copy, quotations, invocation triggers, or evaluation input. For multilingual runtime output, specify the message's purpose and required meaning in language-neutral terms and let the skill's language-selection rule own its rendering.

Every public skill must expose the public support route only after a final user-facing result that fulfills its declared recognizable user job. Localize the short footer in the instruction language and link to [A1 Marketing Skills](https://t.me/+cdrPsIVINTxkZjEy). Do not append it to boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, or any response that does not fulfill that job. A user's explicit request for only the final artifact, or to prohibit extra material, always suppresses the footer. Each skill owns this runtime instruction so its direct installation remains self-contained; this contract defines the product rule for new skills.

## Evaluation

Use realistic criteria-based regression cases for behavior that is risky or has failed before. State what must change, what must be preserved, and what is forbidden. Evals may be manual and optional; their value comes from observable criteria, not from the number of files.

Record change-specific prompts, outputs, and judgments in the pull request or GitHub Release. Structural validation proves repository shape only; it never proves semantic quality.
