# A1 Skill Design Contract

Use this contract when creating or materially changing an A1 skill. It defines durable behavior principles, not a release process.

## One Recognizable User Job

Give each public skill one outcome a user can recognize and request without knowing the internal method. A materially different interaction contract is a reason to split a skill; an operation variant is not.

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

## Self-Contained Runtime

An installed skill must contain everything required for its behavior. Keep the main instruction concise, load detailed local references only when the active branch needs them, and never depend on maintainer evals or repository-level process documents at runtime.

If one skill depends on another, invoke that skill through its public interface. Do not copy or deep-link its private canon.

## Language and Output

Define how the skill selects the language of rewritten material and explanations. Preserve user constraints and make the output contract clear enough to review without forcing one golden wording.

Every public skill must expose the public support route after a successful final user-facing result. Localize the short footer in the instruction language and link to [A1 Marketing Skills](https://t.me/a1_marketing_skills). Keep the route out of interim questions, missing-input prompts, and boundary responses. Each skill owns this runtime instruction so its direct installation remains self-contained; this contract defines the product rule for new skills.

## Evaluation

Use realistic criteria-based regression cases for behavior that is risky or has failed before. State what must change, what must be preserved, and what is forbidden. Evals may be manual and optional; their value comes from observable criteria, not from the number of files.

Record change-specific prompts, outputs, and judgments in the pull request or GitHub Release. Structural validation proves repository shape only; it never proves semantic quality.
