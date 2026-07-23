# A1 Humanize Evaluation

This manual suite checks the public prompt contract without a single golden rewrite. Cases are maintainer material, not runtime dependencies.

Run each case in a clean session using only its instruction and input. Judge every **Must Change**, **Must Preserve**, and **Forbidden** criterion from saved output; ambiguity fails. Record the model, client, revision, evidence, and limitations in the pull request or release notes.

## Cases

- [English AI-pattern cluster](cases/humanize-patterns-001.md)
- [Russian equivalents](cases/humanize-russian-002.md)
- [source fidelity](cases/humanize-source-fidelity-003.md)
- [voice sample](cases/humanize-voice-sample-004.md)
- [false-positive guard](cases/humanize-false-positive-005.md)
- [final-only output](cases/humanize-output-006.md)
- [mixed strategy boundary](cases/humanize-boundary-007.md)
- [completed external input](cases/humanize-completed-input-008.md)
