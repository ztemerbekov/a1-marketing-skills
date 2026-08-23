# A1 Marketing Context Evaluation

This self-contained manual suite protects invocation, incremental writes, interview limits, source safety, merge behavior, repository isolation, consumption semantics, and output shape.

Evaluation files are maintainer material. Runtime instructions do not load them during an ordinary context run.

## Case Format

Each case embeds the exact user instruction, repository state, authoritative input, interaction harness when needed, and observable criteria. Every case must include:

1. stable ID, mode, risk, and applicable scope scenario;
2. complete setup and repository state;
3. exact user instruction and input;
4. **Must change**, **Must preserve**, and **Forbidden** criteria;
5. the applicable output contract.

Use [the case template](case-template.md). Name every file exactly `<ID>.md`.

## Suite

- [natural Auto-draft invocation](cases/context-natural-invocation-001.md)
- [passive events cause no write](cases/context-passive-noop-002.md)
- [direct field update](cases/context-direct-update-003.md)
- [explicit platform-neutral interview](cases/context-interview-explicit-004.md)
- [seven-question interview limit](cases/context-interview-limit-005.md)
- [early interview stop saves partial progress](cases/context-interview-stop-006.md)
- [sparse repository asks one question](cases/context-sparse-repo-007.md)
- [one-section partial context is valid](cases/context-partial-file-008.md)
- [pure hypothesis request is refused](cases/context-no-hypotheses-009.md)
- [Auto-draft preserves unrelated additions](cases/context-merge-preservation-010.md)
- [material conflict stops the write](cases/context-conflict-011.md)
- [write stays isolated to the current repository](cases/context-repository-isolation-012.md)
- [defaults and protected inputs remain distinct](cases/context-protected-facts-013.md)
- [default output is concise](cases/context-output-shape-014.md)
- [confirmed wording is stored exactly](cases/context-stored-wording-015.md)
- [mixed context and hypothesis job is fully refused](cases/context-mixed-hypothesis-016.md)
- [legacy fallback migration is explicit and lossless](cases/context-legacy-migration-021.md)
- [immediate interview stop creates no empty context](cases/context-interview-empty-stop-022.md)
- [two legacy contexts stop migration](cases/context-legacy-precedence-023.md)
- [non-marketing remember request stays outside context](cases/context-nonmarketing-memory-024.md)

Consumer integration regressions live in the self-contained evaluation packages of the consumers they evaluate.

Across the suite, scope coverage includes `In scope`, `Out of scope`, `Mixed job`, and `Completed external input`.
