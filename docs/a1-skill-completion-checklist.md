# A1 Skill Completion Checklist

Use this checklist before declaring a new or materially changed A1 marketing skill ready for human review or release. It operationalizes the [A1 skill design contract](a1-skill-design-contract.md); it does not replace that contract, the [A1 marketing glossary](a1-marketing-glossary.md), or the skill's own runtime instructions.

## Domain Boundary Reassessment

- [ ] Read root `CONTEXT.md` and relevant ADRs under `docs/adr/` when they exist.
- [ ] Decide whether the skill belongs to the existing domain context or introduces independently evolving vocabulary and decisions.
- [ ] If a distinct context may be needed, raise `CONTEXT-MAP.md` with the user before creating or migrating one.
- [ ] Record the decision. Absence of `CONTEXT.md` or ADRs is not itself a blocker.

## Design Canon

- [ ] State one recognizable user job and the interaction contract that serves it.
- [ ] Keep operation variants inside one skill while their gate, inputs, working relationship, and output remain the same.
- [ ] Keep brand-specific facts, audiences, positioning, proof, voice, examples, vocabulary, and business goals in marketing context rather than shared canon.
- [ ] Use glossary terms consistently in the issue, skill instructions, evals, and release record.

## Invocation and Interaction Contract

- [ ] Declare one recognizable user job and classify the whole request before dependency checks, context gathering, interviews, or artifact creation.
- [ ] Declare the work the skill may perform and the work it must not perform.
- [ ] Declare which completed external inputs the skill may accept without producing or rethinking them.
- [ ] Declare mixed-job behavior and forbid partial execution unless orchestration or routing is the skill's explicitly declared user job.
- [ ] Choose **Model-invoked** for a safe natural-language entry point with a reversible default.
- [ ] Choose **User-invoked** or command-only for a deliberate interview, consequential workflow, or surprising hard gate.
- [ ] Put trigger phrases and scope boundaries in frontmatter so supported clients can select the skill reliably.
- [ ] Define the minimum soft or hard gate and distinguish required inputs from optional context.
- [ ] Define the normal output contract and the exact conditions that change it.

## Invariant Spine and Progressive Disclosure

- [ ] Define the shortest decision sequence every run follows.
- [ ] Keep adaptive detail in local references and load it only when the active branch needs it.
- [ ] Keep `SKILL.md` concise and make one canonical file own each runtime decision.
- [ ] Keep evaluation material out of the normal runtime reading path.

## Self-Contained Runtime

- [ ] Install the skill directory directly from GitHub without a build or sync step.
- [ ] Include every runtime reference, template, script, and asset inside the skill directory.
- [ ] Use relative links and verify that every runtime link resolves from the installed directory.
- [ ] Do not depend on repository docs, adapters, or sibling skills at runtime unless the dependency is explicit and missing-dependency behavior is safe and tested.
- [ ] Keep Claude, Cursor, Codex, and other platform adapters as pointers to canonical skill behavior rather than alternate sources of truth.

## Criteria-Based Evaluation

- [ ] Cover in-scope, out-of-scope, mixed-job, and completed external input scenarios for every materially changed scope boundary.
- [ ] In out-of-scope and mixed-job cases, name every forbidden partial output explicitly.
- [ ] Add realistic cases for every important operation and high-risk boundary.
- [ ] Make each case self-contained with exact instruction, input, setup, and marketing context.
- [ ] Define observable **Must change**, **Must preserve**, and **Forbidden** criteria plus the applicable output contract.
- [ ] Test routing false positives, missing context, constraints, source fidelity, declared dependencies, and explicit invocation where relevant.
- [ ] Do not use golden copy or an automated LLM judge for semantic quality during the pilot.

## Installed Semantic Release Gate

- [ ] Prefer installing the exact candidate revision in a clean supported client.
- [ ] If security policy blocks a clean run, use an **explicitly accepted constrained fallback** only after the product owner accepts that mode: load the exact candidate in the current supported client and record the policy block, candidate digest, isolation difference, and fallback approver.
- [ ] Structural validation alone does not satisfy the constrained fallback; record exact prompts, complete outputs, and semantic evidence for every required case.
- [ ] Record client, model, run date, skill revision, reviewer, fallback mode when used, and any case-specific installation difference.
- [ ] Submit every case's exact instruction and input without paraphrasing.
- [ ] Judge every case against the three criteria groups — Must change, Must preserve, and Forbidden — then verify the applicable output contract separately.
- [ ] Treat ambiguous evidence as failure and record concise evidence for every verdict.
- [ ] For a significant failure, fix the smallest runtime cause, add or strengthen a permanent regression case, reload the exact candidate under the selected mode, and restart the full suite.

## Repository Verification

- [ ] Synchronize README skill lists and plugin metadata with `node scripts/sync-readme-and-plugin.js` before and after relevant metadata changes.
- [ ] Keep English and Russian workflow documentation aligned.
- [ ] Run `./scripts/validate-skills.sh` and any focused syntax checks.
- [ ] Run `git diff --check` and verify relative Markdown links.
- [ ] Review the complete diff against both repository standards and the originating issue or PRD.

## Remaining Limitations

- [ ] Record every known limitation, deferred case, unsupported client, dependency issue, and follow-up task.
- [ ] Distinguish a blocked or pending semantic gate from a passing structural check.
- [ ] Treat the unavailable clean-client mode as a disclosed limitation, not a failure, only when the explicitly accepted constrained fallback has complete semantic evidence.
- [ ] Do not hide unresolved failures inside a qualified pass verdict.

## Completion Verdict

- [ ] Mark `PASS` only when every required semantic case and repository check passes on the recorded candidate revision under either the clean-client mode or an explicitly accepted constrained fallback.
- [ ] Mark `FAIL` when a required case has an unresolved failure.
- [ ] Mark `PENDING` when neither allowed semantic mode is complete, or when its environment record, evidence, or required verification is incomplete.
- [ ] Do not close or otherwise declare the work complete until the verdict accurately represents the evidence.
