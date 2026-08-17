# Wayfinder map format

Use one document as both the high-level map and the detailed decision record. Preserve its existing headings and order when continuing it.

```markdown
# Wayfinder — <short initiative name>

**Status:** Active | Clear
**Updated:** <YYYY-MM-DD>

## Destination

<One or two sentences describing the observable brief, strategy, decision, or plan that will be ready when wayfinding ends.>

## Notes

- <standing constraint, authoritative source, linked Marketing Context, or downstream handoff>

## Decisions

### <decision title>

- **Decision:** <confirmed choice or source-determined conclusion>
- **Why:** <short rationale>
- **Evidence:** <source, linked artifact, or `User decision`>
- **Consequences:** <what this choice enables, changes, or rules out>
- **Uncertainty:** <material caveat, or `None recorded`>

## Frontier

### <decision title>

- **Question:** <one precise decision to resolve>
- **Why now:** <what this answer unlocks>
- **Needed:** <available evidence or conversation required>

## Blocked

### <decision title>

- **Question:** <one precise decision to resolve>
- **Blocked by:** <named unresolved decision or unavailable input>
- **Needed:** <specific evidence or human input that removes the block>

## Fog

- <relevant area whose decision question is not yet precise>

## Out of scope

- <excluded area and why it lies beyond the destination>
```

## Invariants

- Keep exactly one Destination and one Status.
- Store each meaning once. A question lives in Frontier, Blocked, or Fog; a resolved decision lives only in Decisions.
- Use names rather than anonymous numbers as the primary identity of decisions. Numbering may aid navigation but never replaces the name.
- List only standing constraints and source pointers in Notes. Put conclusions in Decisions.
- Link supporting research or prototypes from Evidence instead of pasting large artifacts into the map.
- Preserve unresolved uncertainty beside the decision it qualifies.
- Set Status to `Clear` only when Frontier, Blocked, and Fog are empty and the Destination is ready for handoff.
- Update the date only after a substantive map change.

Localize the headings and field labels naturally when creating a new map in a language other than English. When continuing a map, preserve its existing labels and semantic structure.
