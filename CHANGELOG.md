# Changelog

Notable user-facing changes to A1 Marketing Skills are recorded here. Git tags and GitHub Releases identify published versions.

## Unreleased

### Changed

- Add native Codex and Cursor marketplace manifests and use `a1-marketing-skills` as the marketplace and full-plugin slug across Claude Code, Codex, and Cursor.
- Add A1 Humanize for removing recognizable AI-writing patterns from supplied copy while preserving its supported content and voice.
- Rename the collection and repository to A1 Marketing Skills.
- Use the official `npx skills` CLI for installation and updates.
- Keep Editor in Chief explicitly invoked across supported clients.
- Simplify repository validation and contributor guidance around structural checks and pull-request evidence.
- Rename A1 Editor to A1 Copy Editing, recognize ordinary Russian editing requests, and support review-only feedback without silently rewriting the source.
- Make A1 Copy Editing repair incorrect grammar, grammatical government, and lexical collocations even when the source meaning remains understandable.
- Let A1 Grill, A1 Copy Editing, and Editor in Chief localize output labels naturally instead of requiring exact English or Russian wording.

### Removed

- Remove the custom `a1-update` skill and its updater-specific tooling.
- Remove generated README inventory and permanent certification or run reports.
