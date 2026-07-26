# Domain Docs

## Before exploring, read these

- `CONTEXT.md` at the repo root; or
- `CONTEXT-MAP.md` at the repo root if it exists; and
- relevant ADRs under `docs/adr/`.

If these files do not exist, proceed silently. Domain-modeling work creates them only when terms or decisions are genuinely resolved.

## File structure

This is a single-context repository:

```
/
├── CONTEXT.md
├── docs/adr/
└── src/
```

## Use the glossary's vocabulary

When naming a domain concept, use the term defined in `CONTEXT.md`. If it conflicts with an ADR, surface that conflict rather than silently overriding it.
