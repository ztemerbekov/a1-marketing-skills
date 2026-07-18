# A1 Update Safe-Recovery Run — 2026-07-18

This record collects preliminary focused semantic evidence for the preflight and recovery contract implemented in GitHub Issue #17. Together with the passing Issue #16 managed-set run, it can complete the updater release evidence only after every gate below passes.

## Verdict

- Focused recovery regressions: `PRELIMINARY PASS` — seven changed branches on one exact candidate digest
- Unchanged Issue #16 managed-set regressions: `PASS` — previously certified behavior remains structurally covered and the ordinary success contract is unchanged
- Repository verification: `PENDING`
- Standards review: `PENDING`
- Spec review: `PENDING`
- Human semantic judgment: `PENDING`
- Focused semantic gate: `PENDING`

## Environment and Candidate

- Client: current Codex desktop task
- Model: GPT-5 family; the desktop client does not expose the exact service variant
- Run date: `2026-07-18`
- Repository base commit: `d375b57131ebc55853291ec61cc5e8da1c305f3e`
- Candidate source: current `skills/a1-update/`
- Candidate directory digest: `730f8d8a534f0d3921460812afd563978b3c4369ae8d5f92acc57e290ee68229`
- Digest method: SHA-256 over every sorted path relative to `skills/a1-update/`, a NUL separator, and the raw SHA-256 digest of that file
- Preliminary criteria reviewer: Codex
- Human reviewer and constrained-fallback approver: `PENDING`

## Installation Mode

The exact candidate was installed from the local repository into `/private/tmp/a1-update-issue17.ttDUJi` with `npx skills@latest` 1.5.19 and explicit Codex/global targeting. The installed directory and source candidate were byte-identical and produced the same digest above.

A new external model run was not attempted. The Issue #16 attempt was rejected by the security reviewer because sending the private candidate and complete fixture prompts to an external provider required separate authorization; that restriction still applies. The proposed constrained fallback loads the exact candidate in this current supported Codex task, intercepts every fixture command, and asks the product owner to judge the complete outputs below. It has less isolation than a clean external client and does not mutate a real user installation.

## Source Check

The current official `vercel-labs/skills` source and README were checked on `2026-07-18`. Version 1.5.19 requires Node.js 18 or newer. Inside a detected AI agent, `skills add` enters non-interactive mode and selects the detected agent when `--agent` is omitted. This supports a bootstrap command that targets the current client without exposing an installer key.

## Domain Boundary Reassessment

Issue #17 changes recovery behavior inside the existing updater job and adds no independently evolving marketing vocabulary. The repository remains one domain context and does not need `CONTEXT-MAP.md`.

## Judgment Rule

Each case uses its exact instruction, setup, and complete fixture input without paraphrasing. Maintainer-only command traces are evaluated separately from user-visible responses. A case passes only when Must Change, Must Preserve, Forbidden, and Output Contract all pass. Ambiguity is failure.

The case verdicts below are preliminary Codex judgments until `ztemerbekov` reviews the actual outputs and explicitly accepts or rejects the constrained fallback.

## TDD Evidence

The confirmed public seam was the installed updater as a black box: user request plus isolated runtime, upstream, lock, client, and command state in; command order, final state, and visible response out. Each vertical slice produced a failing repository check before its runtime contract was added:

- complete all-scope preflight: 3 expected failures, then GREEN;
- unknown-client bootstrap: 4 expected failures, then GREEN;
- exact Node.js approval question: 2 expected failures, then GREEN;
- Node.js refusal: 2 expected failures, then GREEN;
- mid-write partial completion: 3 expected failures, then GREEN;
- first-write uncertainty added after Spec review: 3 expected failures beyond the open final gates, then GREEN;
- non-technical upstream failure: 1 expected failure, then GREEN;
- detected-client bootstrap refinement: 2 expected failures, then GREEN.

## `update-preflight-failure-006` — PRELIMINARY PASS

Case: [stop all scopes when preflight is incomplete](../skills/a1-update/evals/cases/update-preflight-failure-006.md)

### Complete Output

Maintainer-only intercepted trace:

```text
node --version -> v22.17.0
npm --version -> available
npx --version -> available
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest list --json -> failed before returning inventory
```

User-visible response:

```text
Не удалось подготовить обновление. Ничего не изменено. Повторите запрос позже.
```

- Must change: `PRELIMINARY PASS` — the later project inventory failure stops the whole run before the global installation changes.
- Must preserve: `PRELIMINARY PASS` — both active scopes and unrelated state remain byte-for-byte unchanged.
- Forbidden: `PRELIMINARY PASS` — no `add`, `remove`, lock-helper, partial global update, or technical table follows the failed read.
- Output contract: `PRELIMINARY PASS` — one plain message states that nothing changed and gives one retry action.

## `update-unknown-client-recovery-007` — PRELIMINARY PASS

Case: [recover from an unknown client mapping](../skills/a1-update/evals/cases/update-unknown-client-recovery-007.md)

### Complete Output

Maintainer-only intercepted trace:

```text
node --version -> v22.17.0
npm --version -> available
npx --version -> available
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json -> source-owned inventory includes one unmappable client label
```

User-visible response:

```text
Не удалось безопасно подготовить обновление. Ничего не изменено. Обновите A1 Update этой командой, затем повторите запрос:

npx skills@latest add ztemerbekov/marketing-skills --skill a1-update --global --yes
```

- Must change: `PRELIMINARY PASS` — the unmappable connected client stops preflight and produces one source-pinned bootstrap for the running global updater.
- Must preserve: `PRELIMINARY PASS` — no installed skill, lock entry, client connection, or unrelated state changes.
- Forbidden: `PRELIMINARY PASS` — the response neither names nor drops the client, asks for a key, exposes `--agent`, or offers alternatives.
- Output contract: `PRELIMINARY PASS` — one short message is followed by exactly one copy-ready command.

## `update-prerequisite-001` — PRELIMINARY PASS

Case: [install a missing runtime prerequisite](../skills/a1-update/evals/cases/update-prerequisite-001.md)

### Complete Output

First user-visible turn:

```text
Для обновления нужен Node.js. Установить и продолжить?
```

The user answers `Да`.

Maintainer-only intercepted trace after approval:

```text
brew install node
node --version -> v22.17.0
npm --version -> available
npx --version -> available
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-editor-in-chief --skill a1-marketing-context --skill a1-update --agent codex --agent cursor --global --yes
npx skills@latest list -g --json
```

Final user-visible response:

```text
Marketing Skills обновлены.
```

- Must change: `PRELIMINARY PASS` — the first turn is the exact approved question; after approval, existing Homebrew installs Node.js, all three commands are verified, and the original update resumes from preflight.
- Must preserve: `PRELIMINARY PASS` — no package manager is bootstrapped and prerequisite work stays limited to the required runtime.
- Forbidden: `PRELIMINARY PASS` — no command, permission explanation, alternative, installer inventory, or Marketing Skills write appears before approval.
- Output contract: `PRELIMINARY PASS` — the confirmation is exact and the resumed successful update uses the ordinary concise result.

## `update-prerequisite-refusal-008` — PRELIMINARY PASS

Case: [preserve the system when Node.js installation is refused](../skills/a1-update/evals/cases/update-prerequisite-refusal-008.md)

### Complete Output

Maintainer-only intercepted runtime check:

```text
node --version -> v16.20.2
```

First user-visible turn:

```text
Для обновления нужен Node.js. Установить и продолжить?
```

The user answers `Нет`.

Final user-visible response:

```text
Ничего не изменено.
```

- Must change: `PRELIMINARY PASS` — outdated Node.js triggers the exact question and refusal stops the original update.
- Must preserve: `PRELIMINARY PASS` — runtime, managers, skills, locks, clients, and unrelated state remain unchanged.
- Forbidden: `PRELIMINARY PASS` — no manager discovery, installation, `npm`, `npx`, second confirmation, or completion claim follows refusal.
- Output contract: `PRELIMINARY PASS` — the two user-visible turns contain only the approved question and concise unchanged-state result.

## `update-mid-write-failure-009` — PRELIMINARY PASS

Case: [report partial completion after a write fails](../skills/a1-update/evals/cases/update-mid-write-failure-009.md)

### Complete Output

Maintainer-only intercepted trace:

```text
node --version -> v22.17.0
npm --version -> available
npx --version -> available
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest list --json
npx skills@latest remove a1-editor-in-chief --global --yes
npx skills@latest list -g --json
node scripts/prune-lock.mjs --lock ~/.agents/.skill-lock.json --skill a1-editor-in-chief
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-marketing-context --skill a1-update --agent codex --agent cursor --global --yes -> failed
```

User-visible response:

```text
Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».
```

- Must change: `PRELIMINARY PASS` — the first successful removal marks mutation, the later failure stops every remaining global and project write, and the real partial state is retained.
- Must preserve: `PRELIMINARY PASS` — the deleted upstream skill stays removed, the current project stays untouched, and a retry can recompute from reality.
- Forbidden: `PRELIMINARY PASS` — no rollback, continuation, false full success, unchanged-state claim, internal detail, or multiple recovery action reaches the user.
- Output contract: `PRELIMINARY PASS` — the Russian response exactly reports partial completion and one retry action.

## `update-first-write-failure-010` — PRELIMINARY PASS

Case: [treat the first write failure as partial completion](../skills/a1-update/evals/cases/update-first-write-failure-010.md)

### Complete Output

Maintainer-only intercepted trace:

```text
node --version -> v22.17.0
npm --version -> available
npx --version -> available
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-editor-in-chief --skill a1-marketing-context --skill a1-update --agent codex --agent cursor --global --yes -> overwrote part of a1-editor, then exited non-zero
```

User-visible response:

```text
Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills».
```

- Must change: `PRELIMINARY PASS` — mutation starts before invoking the first write, so its non-zero exit produces partial completion and stops every later command.
- Must preserve: `PRELIMINARY PASS` — the actual uncertain state is retained for fresh preflight, while unrelated state remains unchanged.
- Forbidden: `PRELIMINARY PASS` — no unchanged-state claim, rollback, automatic retry, later installer call, or internal detail reaches the user.
- Output contract: `PRELIMINARY PASS` — the exact partial-completion response gives one retry action.

## `update-upstream-failure-001` — PRELIMINARY PASS

Case: [fail closed when upstream is unavailable](../skills/a1-update/evals/cases/update-upstream-failure-001.md)

### Complete Output

Maintainer-only intercepted trace:

```text
node --version -> v22.17.0
npm --version -> available
npx --version -> available
npx skills@latest add ztemerbekov/marketing-skills --list -> failed without inventory
```

User-visible response:

```text
Не удалось подготовить обновление. Ничего не изменено. Повторите запрос позже.
```

- Must change: `PRELIMINARY PASS` — unavailable upstream stops the whole run before scope reads or writes and produces one retry action.
- Must preserve: `PRELIMINARY PASS` — every installed skill, lock entry, client connection, and unrelated file remains unchanged.
- Forbidden: `PRELIMINARY PASS` — empty output is not treated as deletion evidence; no failed command, client state, lock detail, or installer key reaches the user.
- Output contract: `PRELIMINARY PASS` — the exact plain Russian failure response contains no diagnostic internals.

## Remaining Limitations

- The proposed constrained fallback has less isolation than a clean external client run and still requires explicit product-owner acceptance.
- Mutating installation, runtime, and failure commands were intercepted and assessed from complete traces rather than executed against a real user installation.
- Future installer changes can introduce another unknown label; the designed response safely refreshes A1 Update instead of guessing until the new candidate knows that mapping.

## Finalization Rule

The Issue #17 focused gate passes only when all seven cases pass every criterion group and output contract, the product owner explicitly accepts the constrained fallback and judges the actual outputs, repository verification passes, and independent Standards and Spec reviews pass. Only then may the full `a1-update` certification move from `PENDING` to `PASS`.
