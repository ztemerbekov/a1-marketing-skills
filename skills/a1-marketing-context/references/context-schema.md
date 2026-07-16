# Context Schema and Consumption Semantics

Create new files with this predictable structure. The title, update date, and semantics note are fixed schema text; include only populated content sections.

```markdown
# Marketing Context

Last updated: YYYY-MM-DD

## How to Use This Context

- Defaults in Audience Defaults, Brand Voice Defaults, and Business Goal Defaults guide a task only when the current request is silent.
- Protected inputs in Product Facts, Claims and Evidence, and Explicit Prohibitions must not be contradicted, weakened, or silently replaced. A material conflict requires clarification.
- Other populated sections are confirmed reusable decisions. Missing sections never block another skill.

## Product Facts

## Audience Defaults

## Positioning

## Market and Alternatives

## Jobs, Pains, and Motivations

## Brand Voice Defaults

## Messaging Rules

## Claims and Evidence

## Words to Use

## Explicit Prohibitions

## Examples

## Business Goal Defaults
```

## Semantics

- **Overridable defaults:** `Audience Defaults`, `Brand Voice Defaults`, and `Business Goal Defaults` guide downstream work when the current task is silent. An explicit current task may use a different reader, voice, or goal without updating the stored context.
- **Protected inputs:** `Product Facts`, `Claims and Evidence`, and `Explicit Prohibitions` constrain downstream work. A consumer must preserve them or surface a material conflict; ordinary task wording must not silently replace them.
- **Confirmed decisions:** `Positioning`, `Market and Alternatives`, `Jobs, Pains, and Motivations`, `Messaging Rules`, `Words to Use`, and `Examples` are reusable approved inputs. They may be changed in the file only through an explicit context update.

The setup skill changes protected inputs or confirmed decisions only when the user explicitly updates them or explicitly designates an authoritative replacement source.

## Partial Files

A file with one populated content section is valid and immediately usable. Do not add empty headings, `Unknown`, `TBD`, question lists, speculative filler, or prose explaining that a section is missing.

For an existing context, recognize an equivalent legacy heading such as `Product`, `Audience`, `Brand Voice`, `Claims and Proof`, `Words to Avoid`, or `Business Goals`. Update that section in place rather than duplicating or renaming unrelated content. Use the canonical headings for new sections and new files. When a migrated file retains legacy headings, its `How to Use This Context` note must name the headings actually present or explicitly map each legacy heading to its default or protected meaning; never insert a note that leaves the retained sections semantically ambiguous.

**Complete when:** every stored value is in one fitting section, the file itself names default and protected sections, and no empty or invented material pads the file.
