# Changelog

Notable user-facing changes to A1 Marketing Skills are recorded here. Git tags and GitHub Releases identify published versions.

## Unreleased

### Changed

- Give every OpenAI skill a vivid, outcome-focused starter prompt built around a concrete use case.
- Restore Marketing Context to its skills.sh group, order the skills CLI groups as Marketing Strategies then Editorial, and align the Claude package display names.
- Add A1 Copywriting for creating new marketing materials in the format a user's goal requires, together with A1 Cold Email, A1 Presentation Copy, and A1 Company Profile.
- Add native Codex and Cursor marketplace manifests and use `a1-marketing-skills` as the marketplace and full-plugin slug across Claude Code, Codex, and Cursor.
- Add A1 Humanize for removing recognizable AI-writing patterns from supplied copy while preserving its supported content and voice.
- Rename the collection and repository to A1 Marketing Skills.
- Use the official `npx skills` CLI for installation and updates.
- Simplify repository validation and contributor guidance around structural checks and pull-request evidence.
- Rename A1 Editor to A1 Copy Editing, recognize ordinary Russian editing requests, and support review-only feedback without silently rewriting the source.
- Make A1 Copy Editing repair incorrect grammar, grammatical government, and lexical collocations even when the source meaning remains understandable.
- Let A1 Grill and A1 Copy Editing localize output labels naturally instead of requiring exact English or Russian wording.

### Removed

- Remove the A1 Redaktura command alias; A1 Copy Editing continues to support Russian-language editing requests.
- Remove the custom `a1-update` skill and its updater-specific tooling.
- Remove generated README inventory and permanent certification or run reports.
- Remove the unreleased editorial-orchestration skill and its installation, routing, documentation, and evaluation surfaces.
