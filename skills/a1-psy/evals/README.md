# A1 Psychology Evaluation

This manual suite tests `a1-psy` through its installed public interaction.
Each case is a non-canonical regression fixture: runtime instructions must not
copy its scenario, wording, or expected model choice.

## Manual Run Protocol

1. Install the candidate skill in a clean agent session.
2. Reproduce only the setup written in the case.
3. Submit the exact user instruction and input without paraphrasing.
4. Judge every `Must Change`, `Must Preserve`, and `Forbidden` criterion.
5. Treat ambiguous evidence as failure and record the case ID, client, model,
   revision, evidence, and limitations in the pull request or release.

Structural validation confirms package shape only. It does not replace this
semantic evaluation.
