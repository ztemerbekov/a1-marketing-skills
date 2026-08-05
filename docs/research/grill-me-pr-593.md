# Grill Me PR #593: findings for A1 Grill

Research date: 2026-08-05
Tracking issue: [ztemerbekov/a1-marketing-skills#208](https://github.com/ztemerbekov/a1-marketing-skills/issues/208)

## Facts

### Outcome and release status

- [mattpocock/skills PR #593](https://github.com/mattpocock/skills/pull/593), titled `Release v1.2`, was opened by Matt Pocock on 2026-07-16 and merged into `main` on 2026-08-05. Its merge commit is [`b405fe0`](https://github.com/mattpocock/skills/commit/b405fe0a2e5550bb7f54d6c7b44ba7cd251a5243).
- The PR was a broad release branch, not a Grill-only change: its final file list covered 46 files and also contained work on `prototype`, `to-questionnaire`, and `writing-for-agents`. The PR body nevertheless names the Grilling rework as the headline change.
- The new behavior is present in the current [`grilling/SKILL.md` on `main`](https://github.com/mattpocock/skills/blob/main/skills/productivity/grilling/SKILL.md), and the separate `batch-grill-me` experiment has been removed.
- At the research cutoff, v1.2 had not yet been formally published. The [latest GitHub release](https://github.com/mattpocock/skills/releases) was v1.1.0, `package.json` on `main` still reported `1.1.0`, and the automated [version PR #503](https://github.com/mattpocock/skills/pull/503) remained open with the proposed `1.2.0` release notes. The merged source and the published release were therefore temporarily at different versions.

### What changed in Grilling

The pre-change skill at [`170ad48`](https://github.com/mattpocock/skills/blob/170ad48655825783d0193e850e31a9aac957bb95/skills/productivity/grilling/SKILL.md) used this interaction contract:

- walk the decision tree one dependency at a time;
- ask one question per turn and wait;
- give a recommended answer with every question;
- look up accessible facts instead of asking the user;
- leave decisions to the user;
- do not act until the user confirms shared understanding.

The main behavior commit, [`a4b2009`](https://github.com/mattpocock/skills/commit/a4b2009a1a3ac9575506c10b4c84f08f9bba7a38), changed that contract from one-question-at-a-time to round-by-round:

1. Model the subject as a **design tree**, where later decisions depend on earlier decisions.
2. Define the **frontier** as all decisions whose prerequisites are already settled.
3. Ask the whole frontier in one numbered round, then wait for the user's answers.
4. Recompute the tree and frontier after every round. A question that depends on another still-open question must wait for a later round.
5. Dispatch discoverable fact-finding to background sub-agents. A running exploration is an unsettled prerequisite, so it delays only dependent questions; unrelated frontier questions can proceed.
6. Finish only when the frontier is empty and the user confirms shared understanding. The no-action-before-confirmation gate remains.

This mechanism came from the separate `batch-grill-me` experiment. Immediately before #593, [PR #586](https://github.com/mattpocock/skills/pull/586) had added granular, non-blocking fact-finding to that experiment. PR #593 then folded the experiment into the canonical `grilling` primitive and deleted the duplicate skill.

On 2026-07-29, several follow-up commits fixed the presentation contract for a batched round. The final format is a numbered, titled question behind `❓`, followed by the recommendation on its own `➡️` line. See the [initial format commit](https://github.com/mattpocock/skills/commit/294a2c97c58f11cf1ffc029fb6d1ac46db658353), [emoji commit](https://github.com/mattpocock/skills/commit/5626acd11aee1ab38642963f14c00c605331461c), and [bold-title commit](https://github.com/mattpocock/skills/commit/1495d014303e041c51c29f9e442485ba06f5878d).

### Primitive, wrappers, and configuration

- Upstream keeps `grilling` as the model-invoked primitive. The user-invoked [`grill-me`](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md) wrapper still contains only `Run a /grilling session.` It therefore inherits the round-by-round default.
- `grill-with-docs` and `triage` also inherit the primitive. Commit [`bfdaef8`](https://github.com/mattpocock/skills/commit/bfdaef8e989a5c81160e74bc5043bd434da49cac) synchronized those consumers and their docs from “one question at a time” to “a round of questions at a time.”
- Upstream did not ship a first-class mode selector. Its documented opt-out is a global Claude instruction: `When grilling, ask one question at a time.` The instruction is described on the current [Grilling docs page](https://github.com/mattpocock/skills/blob/main/docs/productivity/grilling.md).

### Review and discussion

- The only formal review requested changes. The reviewer accepted the value of the design tree and frontier, but argued that batching is cognitively heavier, changes the spirit of Grill Me, and should not silently replace the widely used one-question flow. The review received seven positive reactions: [review on PR #593](https://github.com/mattpocock/skills/pull/593#pullrequestreview-4767515664).
- Matt moved mode discussion to [issue #663](https://github.com/mattpocock/skills/issues/663). A contributor proposed first-class `single` and `batch` modes; Matt instead recommended the global `CLAUDE.md` override and closed the issue as completed: [maintainer response](https://github.com/mattpocock/skills/issues/663#issuecomment-5115852239). After a discoverability objection concerning non-engineers, he retained that position: [follow-up response](https://github.com/mattpocock/skills/issues/663#issuecomment-5135623426).
- Discussion feedback was mixed and anecdotal, not a controlled evaluation. One user reported that rounds were faster and reduced accidental rabbit holes: [positive report](https://github.com/mattpocock/skills/pull/593#issuecomment-5072312675). Another found batch useful when the answer was already fairly clear, but one-at-a-time better when the picture was less clear, and asked for a progress indicator: [mode comparison](https://github.com/mattpocock/skills/pull/593#issuecomment-5075992984). Another warned that apparently independent questions can reveal hidden coupling after an answer or fact arrives: [coupling warning](https://github.com/mattpocock/skills/pull/593#issuecomment-5027079869).
- [Issue #597](https://github.com/mattpocock/skills/issues/597), requesting a `Question N of ~M` progress header, remained open and was not part of the merged skill.
- PR #593 merged despite the unresolved `CHANGES_REQUESTED` review. Merge proves the maintainer's chosen upstream default; it does not resolve the product trade-off for other audiences or clients.

## A1 Grill comparison

The current [`skills/a1-grill/SKILL.md`](../../skills/a1-grill/SKILL.md) is a direct marketing adaptation of the old upstream mechanics. That was an explicit maintainer decision in [A1 issue #134](https://github.com/ztemerbekov/a1-marketing-skills/issues/134), implemented by [A1 PR #140](https://github.com/ztemerbekov/a1-marketing-skills/pull/140). Notably, the A1 change merged on 2026-07-26, while upstream release PR #593 had already been open since 2026-07-16 but had not yet merged.

| Concern | Upstream `grilling` on current `main` | Current A1 Grill |
| --- | --- | --- |
| Cadence | Whole dependency-safe frontier per round | Exactly one question per turn |
| Dependency model | Explicit design tree and recomputed frontier | Decision tree resolved one dependency at a time |
| Question presentation | Fixed numbered/title/recommendation shape | One recommendation and one question; natural localized wording |
| Fact-finding | Background sub-agents; only dependent questions wait | Explore the environment before asking; no required delegation model |
| Completion | Empty frontier, then explicit user confirmation | Shared understanding, then explicit user confirmation |
| Scope | Any plan, decision, or idea | One marketing idea, decision, or plan |
| Invocation architecture | Model-invoked primitive plus user-invoked wrappers | One user-invoked public skill; no separate primitive |
| Language and support | No A1-specific contract | Instruction-language output plus localized support footer |

A1's English and Russian READMEs also promise one recommendation and one precise question per step. Changing the cadence would therefore be a public interaction-contract change, not an internal wording cleanup.

The local [issue #134 decision](https://github.com/ztemerbekov/a1-marketing-skills/issues/134) also removed the previous A1 Grill evaluation suite because it encoded a retired custom workflow. It says future criteria-based cases should be added only after an observed product bug. Any new evaluation proposal should respect that decision or explicitly supersede it with maintainer approval.

## Implications for A1 Grill

The following are repository-specific conclusions, not claims made by upstream:

1. **The most reusable change is the frontier model, not necessarily batch cadence.** A decision tree and its frontier define which questions are safe to ask now. Presentation cadence is a separate choice: one safe frontier question per turn or the whole safe frontier per round.
2. **A blind upstream sync would break A1's current promise.** A1's manifest description and both READMEs explicitly encode one-question-at-a-time behavior. Adopting upstream wholesale would require coordinated runtime, metadata, and bilingual documentation changes.
3. **Upstream evidence does not establish one universal best default.** The PR offers a clear efficiency rationale and favorable field reports, but the review and discussion identify cognitive-load, hidden-coupling, and discoverability costs. There is no published benchmark or criteria-based evaluation comparing modes.
4. **A Claude-only global override is a poor portability mechanism for A1.** A1 is distributed as a multi-client Agent Skill. A behavior users must discover and place in global `CLAUDE.md` does not transfer cleanly to Codex, Cursor, or other clients.
5. **Mandatory sub-agent delegation would narrow client compatibility.** The existing A1 rule—find accessible facts rather than ask the user—captures the durable responsibility split. Background delegation can be an optimization when supported, but should not become a runtime dependency without a concrete cross-client design.
6. **The upstream primitive/wrapper split does not yet earn its cost here.** A1 has one Grill entry point and no other local skill currently consumes a shared grilling primitive. Adding another public skill or internal adapter would duplicate structure without a demonstrated second consumer.
7. **A persistent design-tree file was discussed but did not ship upstream.** It should not be presented as part of PR #593. In A1 it would also turn a stateless interview into a writing workflow and add a maintenance mechanism, requiring a separate product decision under this repository's simplicity guardrails.

## Recommendations

### Recommended next change

Preserve one-question-at-a-time as A1's default, but consider a narrowly scoped runtime change that adopts the dependency-quality improvements:

- explicitly model the interview as a design tree;
- define the current frontier as decisions whose prerequisites are settled;
- choose the next question only from that frontier;
- recompute after each answer;
- reopen downstream branches when an upstream answer invalidates them;
- treat an empty frontier plus explicit user confirmation as completion.

This keeps A1's established low-cognitive-load interaction while importing the strongest upstream control against skipped dependencies and silent assumptions. It is also smaller than introducing modes, wrappers, scratch files, or mandatory agents.

### Optional speed experiment

If maintainers want to test round-based speed, test it as an explicit per-session operation variant of `a1-grill`, not as a second skill and not through a client-specific global file. The experiment should compare at least:

- a mature plan with several genuinely independent decisions;
- a fuzzy early-stage idea whose answers substantially reshape later questions;
- a round where a discovered fact invalidates a question already asked;
- a large frontier that may create cognitive overload;
- Russian and English interaction quality.

The decision should measure both convergence cost (turns and time) and correction cost (stale questions, reopened branches, misunderstood answers). Do not treat the upstream “13 questions in about 3 rounds” release-note example as a benchmark.

### Changes not recommended now

- Do not copy the `❓`/`➡️` format unless A1 adopts multi-question rounds; it solves batch scanability and adds little to the current one-question flow.
- Do not add a separate `a1-batch-grill` or split primitive/wrapper architecture without another real consumer.
- Do not require a temporary design-tree artifact or background sub-agents as part of this research issue.
- Do not change runtime behavior in issue #208; open a separately scoped implementation issue with acceptance criteria if the maintainer accepts one of the recommendations above.
