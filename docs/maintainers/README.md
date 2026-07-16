# Maintainer Guide

This is the technical entry point for people who design, develop, validate, and release Marketing Skills. The root READMEs are intentionally written for marketers and other skill users.

## Canonical Design Records

- [A1 skill design contract](../a1-skill-design-contract.md) — interaction boundaries, invocation choices, self-contained runtime, and evaluation design.
- [A1 marketing glossary](../a1-marketing-glossary.md) — canonical domain vocabulary.
- [A1 skill completion checklist](../a1-skill-completion-checklist.md) — the reusable completion and release gate.
- [A1 Editor pilot certification](../a1-editor-pilot-certification.md) — certified pre-#7 runtime revision, environment, case inventory, limitations, and release evidence.
- [Complete A1 Editor pilot run](../a1-editor-pilot-run-2026-07-15.md) — prompts, outputs, and judgments behind the certification record.
- [A1 scope-boundary focused run](../a1-scope-boundary-run-2026-07-16.md) — Issue #7 boundary outputs, human criteria verdict, and the explicitly accepted constrained fallback.

## Repository Architecture

Canonical, directly installable skills live under `skills/`. The shared marketing context skill stores reusable project facts; Editor performs source-faithful text editing; Editor in Chief runs the explicit strategic assignment workflow and hands editing back to Editor.

Platform-specific directories are adapters:

- `.claude-plugin/` contains Claude Code plugin metadata.
- `.cursor/rules/` bridges Cursor to the canonical skills.
- `.agents/skills/` is the target-project convention used by cross-agent installation and Antigravity.
- `scripts/` contains maintainer tooling and is not required after installation.

Adapters may expose the canonical skills to a client, but they must not redefine skill behavior.

## Compatibility Policy

The repository follows the Agent Skills folder format and prefers behavior over strict specification purity when a narrow extension protects critical runtime behavior. The accepted extension is `disable-model-invocation: true` for command-only skills such as `a1-editor-in-chief`, where accidental automatic invocation would start the wrong interaction.

Any additional non-standard field must be documented in `AGENTS.md`, accepted by repository validation, and limited to a concrete cross-platform behavior need.

## Repository Operations

- [Contribution workflow](../../CONTRIBUTING.md)
- [Agent rules](../../AGENTS.md)
- [Issue tracker](../agents/issue-tracker.md)
- [Triage labels](../agents/triage-labels.md)
- [Domain documentation rules](../agents/domain.md)

Use GitHub Issues for implementation work. Keep the English and Russian user READMEs synchronized, run the metadata synchronization tool when applicable, and finish every change with the repository validator.
