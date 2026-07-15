# Domain Docs

The repository currently uses a single domain context.

Before working, read root `CONTEXT.md` and relevant ADRs under `docs/adr/` when they exist. Their absence does not block work.

Use canonical glossary terms in issue titles, specifications, tests, and skill instructions. Surface conflicts with existing terminology or ADRs instead of silently overriding them.

## Reassess When Adding Skills

Whenever a new skill is added, determine whether it belongs to the existing marketing-skills domain or introduces an independently evolving domain with its own vocabulary and decisions.

If multiple contexts would make the boundaries clearer, raise the question with the user and recommend `CONTEXT-MAP.md`. Do not create or migrate to a multi-context layout without discussing it first.
