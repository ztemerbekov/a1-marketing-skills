# Maintainer Guide

This is the technical entry point for people who design, develop, validate, and release Marketing Skills. The root READMEs are intentionally written for marketers and other skill users.

## Canonical Design Records

- [A1 skill design contract](../a1-skill-design-contract.md) — interaction boundaries, invocation choices, self-contained runtime, and evaluation design.
- [A1 marketing glossary](../a1-marketing-glossary.md) — canonical domain vocabulary.
- [A1 skill completion checklist](../a1-skill-completion-checklist.md) — the reusable completion and release gate.
- [A1 Editor pilot certification](../a1-editor-pilot-certification.md) — certified pre-#7 runtime revision, environment, case inventory, limitations, and release evidence.
- [Complete A1 Editor pilot run](../a1-editor-pilot-run-2026-07-15.md) — prompts, outputs, and judgments behind the certification record.
- [A1 Editor localization run](../a1-editor-localization-run-2026-07-16.md) — Issue #14 mixed-language output-contract evidence and release verdict.
- [A1 scope-boundary focused run](../a1-scope-boundary-run-2026-07-16.md) — Issue #7 boundary outputs, human criteria verdict, and the explicitly accepted constrained fallback.
- [A1 Editor in Chief refactor run](../a1-editor-in-chief-run-2026-07-16.md) — Issue #8 outputs, criteria evidence, and release verdict for the bounded orchestration spine.
- [A1 Editor in Chief localization run](../a1-editor-in-chief-localization-run-2026-07-17.md) — Issue #15 mixed-language delivery evidence and focused verdict.
- [A1 Marketing Context incremental workflow run](../a1-marketing-context-run-2026-07-16.md) — Issue #9 write traces, criteria evidence, and release verdict for repository-local incremental context maintenance.
- [A1 integrated release run](../a1-integrated-release-run-2026-07-16.md) — Issue #10 full-suite and cross-skill semantic evidence for the final integrated candidate.
- [A1 Editor in Chief completion checklist](../a1-editor-in-chief-completion-2026-07-16.md) — separate Chief completion verdict and limitations.
- [A1 Marketing Context completion checklist](../a1-marketing-context-completion-2026-07-16.md) — separate context-setup completion verdict and limitations.
- [A1 Update certification](../a1-update-certification.md) — updater release gate, current evidence, and remaining semantic work.
- [A1 Update managed-set run](../a1-update-managed-set-run-2026-07-18.md) — Issue #16 zero-choice synchronization traces, criteria evidence, and constrained-fallback disclosure.
- [A1 Update safe-recovery run](../a1-update-recovery-run-2026-07-18.md) — Issue #17 preflight, prerequisite, recovery, and partial-completion evidence.

## Repository Architecture

Canonical, directly installable skills live under `skills/`. Marketing Context incrementally stores confirmed repository-local inputs without passive writes or hypotheses; Editor performs source-faithful text editing; Editor in Chief sets bounded editorial direction inside confirmed strategy, delegates all text work to Editor, and reviews the result; Update maintains source-scoped installations from the repository's `main`.

Public distribution uses `npx skills` for Codex, Claude Code, Cursor, Antigravity, and other compatible clients. The repository does not maintain client-specific plugin metadata, rules, or copied skill trees.

- `scripts/` contains maintainer tooling and is not required after installation.

The domain-boundary reassessment for `a1-update` keeps it in the existing single repository context: it manages the collection lifecycle and introduces no independently evolving marketing vocabulary. A `CONTEXT-MAP.md` is not needed.

## A1 Update Safety Contract

Before the first ordinary collection write, A1 Update verifies the runtime, upstream inventory, exact-source locks, installed inventory, active scopes, and complete managed client sets. An unresolved newer client is the sole bounded recovery exception: after every other read-only check succeeds, the updater refreshes its own current-client copy once, reloads the refreshed instructions, and restarts the original request from a complete preflight. The bootstrap command and installer internals never reach ordinary user output.

If Node.js is unavailable or outdated, A1 Update asks one approved confirmation question before using an already installed trusted package manager or the official installer. A refusal leaves the system unchanged. Any command failure after a collection write or automatic updater refresh begins is treated as potentially partial; A1 Update stops later writes and does not attempt an unsafe rollback.

## Compatibility Policy

The repository follows the Agent Skills folder format and prefers behavior over strict specification purity when a narrow extension protects critical runtime behavior. The accepted extension is `disable-model-invocation: true` for command-only skills such as `a1-editor-in-chief`, where accidental automatic invocation would start the wrong interaction.

Any additional non-standard field must be documented in `AGENTS.md`, accepted by repository validation, and limited to a concrete cross-platform behavior need.

## Repository Operations

- [Contribution workflow](../../CONTRIBUTING.md)
- [Agent rules](../../AGENTS.md)
- [Issue tracker](../agents/issue-tracker.md)
- [Triage labels](../agents/triage-labels.md)
- [Domain documentation rules](../agents/domain.md)

Use GitHub Issues for implementation work. Keep the English and Russian user READMEs synchronized, run `node scripts/sync-readmes.js` when the skill inventory changes, and finish every change with the repository validator.
