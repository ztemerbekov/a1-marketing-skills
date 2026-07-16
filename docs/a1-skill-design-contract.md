# A1 Skill Design Contract

This document is the canonical maintainer contract for designing A1 marketing skills. It governs cross-skill behavior; each installed skill remains the source of truth for its own runtime behavior.

## Public Surface

### One skill per user job

A public skill represents one understandable job a user is trying to complete. Keep operation variants inside the skill while they share the same inputs, gate, working relationship, and output expectations. Split a skill only when a variant needs a materially different interaction contract.

The user-facing prompt should stay simpler than the internal method. Do not expose rubrics, passes, routing tables, or evaluation mechanics unless they help the user make a necessary choice.

### Scope before helpfulness

Every skill must declare one user job and classify the whole request against that job before dependency checks, context gathering, interviews, or artifact creation. Its scope boundary must name:

- work the skill may perform;
- work it must not perform;
- completed external inputs it may accept;
- how it responds when one request combines its user job with another job.

Reject a mixed-job request before doing either part. Do not produce a helpful in-scope fragment while declining the rest: that partial execution hides the boundary and can commit the user to an unintended workflow. Partial execution is allowed only when orchestration or routing is the skill's explicitly declared user job.

Scope applies to production, not subject matter. A skill may accept a completed external input without gaining permission to create or rethink that artifact. State this direction explicitly wherever the same artifact can be an allowed input but a forbidden output.

### Invocation rule

Use the **Model-invoked** mode for safe, natural-language entry points where a reasonable default can produce a reversible result. Use the **User-invoked** mode or command-only behavior for deliberate interviews, consequential workflows, or processes whose hard gate would be surprising when auto-triggered.

If the User-invoked surface becomes difficult to discover, add a router rather than weakening the invocation contracts of individual skills.

### Context rule

Fast skills must remain useful without `.agents/marketing-context.md`; read it when present and proceed safely when absent. A strategic skill may require missing context only when continuing would invent facts or make a materially different product, audience, positioning, or business choice.

Brand-specific product facts, audiences, positioning, voice, proof, examples, vocabulary, and business goals belong in marketing context, not in the shared design canon.

Marketing context must distinguish overridable defaults from protected inputs. Current task instructions may override defaults such as audience, voice, or business goal without updating the file. Product facts, evidence, and explicit prohibitions must not be silently contradicted, weakened, or replaced; a consumer follows its conflict rule when they disagree with current material.

## Internal Behavior

### Predictable process, not fixed output

Make the method repeatable without forcing identical prose. A skill should produce outputs suited to the user's material while following a stable decision process and safety boundary.

### Short invariant spine, adaptive depth

Define a short sequence that every run follows. The exact stages are skill-specific, but the spine should cover the essential routing, context, execution, self-check, and response decisions in as few steps as the job allows.

Adapt depth within that spine. A simple request should finish quickly; an ambiguous or risky request may inspect more context, apply more checks, or use a stricter gate. Do not turn optional depth into mandatory ceremony.

### Progressive disclosure

Keep `SKILL.md` concise and route to detailed references only when a branch needs them. A runtime agent should not load every rubric, example, or eval case for every request. Maintainer-only evaluation material can live inside the skill without being part of its runtime reading path.

### Single sources of truth

Use these ownership boundaries:

- This document owns cross-skill design rules.
- `docs/a1-marketing-glossary.md` owns shared authoring terminology.
- Each canonical `skills/<name>/SKILL.md` and its references own that skill's runtime behavior.
- `.agents/marketing-context.md` owns brand-specific facts for the target repository.
- Platform adapters point to canonical skills and do not redefine them.

An installable skill must not depend on repository-level maintainer docs at runtime. When a shared rule or term materially affects runtime behavior, include only the minimum required wording inside the skill; that local wording becomes the runtime source for that installed skill.

### Self-contained installation

Every directory under `skills/` must be directly installable from GitHub. Include every runtime reference, template, script, and asset that the skill needs. Do not require a build, sync step, sibling skill, repository doc, or platform adapter unless the skill explicitly declares and safely handles that dependency.

## Evaluation Contract

### Criteria-based regressions

Protect each important operation or high-risk boundary with realistic eval cases. Cases describe acceptable behavior rather than a single golden rewrite, because good marketing output can vary while still satisfying the contract.

Each case must contain the complete instruction, input, optional context, and three criteria groups:

- **Must change**: observable problems the result must correct.
- **Must preserve**: meanings, facts, voice, structure, or constraints the result must keep.
- **Forbidden**: inventions, transformations, or boundary violations that must not appear.

Keep cases inside the skill they evaluate so the evaluation package travels with a direct installation.

For every materially changed scope boundary, cover four scenarios across the regression suite: an in-scope request, an out-of-scope request, a mixed-job request, and a request that supplies a completed external input. Out-of-scope and mixed-job cases must name the partial artifact or other work that is forbidden, so a superficially helpful partial response cannot pass.

### Manual semantics, automated structure

Run semantic evals manually during the pilot. A human reviewer records evidence for every criterion and marks the case pass only when all criteria pass. Do not add an automated LLM judge.

Prefer a clean supported client with the exact candidate installed. If security policy blocks that mode, the completion checklist's explicitly accepted constrained fallback may load the exact candidate in the current supported client. Record the policy block, candidate digest, exact prompts, complete outputs, criteria evidence, reviewer, fallback approver, and isolation difference. Structural validation alone never satisfies this fallback.

Repository automation may validate structure: required files, headings, frontmatter, links, and template sections. It must not pretend to score marketing quality.

## Future-Skill Checklist

Use the operational [A1 skill completion checklist](a1-skill-completion-checklist.md) to apply this contract, run the installed semantic gate, and record a release verdict.

Before merging a new or materially changed skill, confirm that:

1. Its user job and interaction contract are explicit.
2. Its invocation mode follows the invocation rule.
3. Its invariant spine is short and its depth is adaptive.
4. Its `SKILL.md` uses progressive disclosure.
5. Runtime instructions and installation are self-contained.
6. Brand facts remain in marketing context.
7. Important behavior has realistic criteria-based eval coverage.
8. Structural validation passes without an automated semantic judge.
9. Adding the skill triggered a domain-boundary reassessment before any `CONTEXT-MAP.md` decision.
