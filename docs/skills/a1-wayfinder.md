# A1 Wayfinder

**English** | [Русский](./a1-wayfinder.ru.md)

## What it does

A1 Wayfinder turns a large, unclear marketing initiative into one shared decision map and works through its decisions one at a time until the route to a brief, strategy, or plan is clear.

The defining constraint is separation from execution. Research, discussion, comparison, or a disposable prototype may support a decision, but the skill does not turn the map into a campaign backlog or produce the destination itself.

## When to use it

Invoke A1 Wayfinder deliberately with `/a1-wayfinder`; the agent does not start it automatically. Use it when an initiative is too broad or uncertain to brief or plan directly—for example, entering a market, repositioning a product, designing a launch, or choosing a new acquisition model.

The first run charts the initiative. Later runs continue the same map and resolve at most one decision each, keeping the reasoning useful across conversations.

Use [A1 Grill](./a1-grill.md) when one existing idea, decision, or plan needs an intensive stress test rather than a multi-session map. Use [Marketing Context](./a1-marketing-context.md) to preserve confirmed reusable inputs rather than work through open choices.

## One marketer-readable map

The skill keeps the destination, confirmed decisions, current frontier, blocked questions, unresolved fog, and out-of-scope boundary in one document. It uses a document the user names or creates a visible `wayfinder-<topic>.md` file in a writable workspace. When no writable workspace is available, it returns the complete map in the conversation.

The map contains decision questions, not GitHub issues, tracker labels, assignments, engineering tickets, or an execution backlog.

## Common questions

**Does it create project tasks?**

No. It records the choices that must be made before planning or execution. Delivery tasks belong in the downstream plan after the route is clear.

**Does the agent make marketing decisions for me?**

It gathers discoverable facts and gives concrete recommendations. Consequential choices about audience, positioning, promises, budget, risk, or brand remain open until you confirm them or an authoritative supplied source already settles them.

**Can it use our existing marketing context?**

Yes. In a repository it may read the first supported Marketing Context file as defaults, but it never edits that context or turns its own assumptions into confirmed facts.

**When is the map finished?**

The route is clear when no material frontier, blocked question, or fog remains before the destination can be handed to the appropriate person, planning process, or execution skill.

## It's working if

- The destination is observable and fixes the scope of the map.
- Every open entry is a decision question rather than a production task.
- Confirmed decisions are visibly separated from recommendations and assumptions.
- Each continuation resolves at most one decision and recomputes what becomes possible next.
- The map remains one readable document and never requires an issue tracker.
- Completion produces a clear downstream handoff rather than silent execution.

## Where it fits

A1 Wayfinder is a user-invoked decision-mapping skill in A1 Core. It sits upstream of a marketing brief, strategy, or execution plan. It does not replace market research, project management, campaign production, or Marketing Context maintenance.

A1 Wayfinder is adapted from Matt Pocock's [`wayfinder`](https://github.com/mattpocock/skills/blob/38d62e71ed01fc05d5ae63b0807172e9546049d5/skills/engineering/wayfinder/SKILL.md) under the MIT License. See the skill's [license and attribution](../../skills/a1-wayfinder/references/license-and-attribution.md).
