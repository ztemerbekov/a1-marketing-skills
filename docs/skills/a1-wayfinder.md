# A1 Wayfinder

**English** | [Русский](./a1-wayfinder.ru.md)

Use A1 Wayfinder when a marketing initiative is too large or unclear to brief directly and you need a shared route from uncertainty to a decision-ready brief, strategy, or plan.

## The job

You have a broad initiative such as entering a market, repositioning a product, preparing a launch, or changing an acquisition model. You want to see what must be decided, what is blocked, and what can be resolved next without losing the reasoning between conversations.

The skill creates one decision map and works through it one consequential choice at a time. It may research, compare, or build a disposable prototype to support a decision, but it does not execute the destination or turn the map into a delivery backlog.

## When to use it

Invoke the skill deliberately with `/a1-wayfinder`; it does not start automatically. The first run charts the initiative and stops before resolving the first new decision. Later runs continue the same map and resolve at most one decision each.

Use [A1 Grill](./a1-grill.md) when one existing idea, decision, or plan needs an intensive stress test in a conversation. Use [A1 Marketing Context](./a1-marketing-context.md) when the job is to store confirmed reusable inputs rather than resolve open choices.

## What you get

One readable `wayfinder-<topic>.md` document contains:

- the observable destination;
- confirmed decisions and their rationale;
- the current frontier of answerable questions;
- questions blocked by missing prerequisites;
- relevant uncertainty that is not sharp enough to become a question;
- the out-of-scope boundary.

The map contains decision questions, not GitHub issues, assignments, engineering tickets, or production tasks. If no writable workspace exists, the complete map is returned in the conversation.

## Common questions

**Does it create a project plan?**

No. It identifies and resolves the choices required before a reliable brief, strategy, or execution plan can exist.

**Does the agent make decisions for me?**

It establishes discoverable facts and makes concrete recommendations. Consequential choices remain open until you confirm them or an authoritative supplied source settles them.

**Can it use Marketing Context?**

Yes, as confirmed defaults when a supported repository file exists. It never edits that context or converts its own assumptions into confirmed decisions.

**When is the map complete?**

When no material frontier, blocked question, or unresolved fog remains before the destination can move to its downstream owner.

## How to recognize success

- The destination is concrete enough to define completion.
- Every open item is a decision question rather than an execution task.
- Facts, recommendations, assumptions, and confirmed decisions remain distinct.
- Each continuation resolves at most one consequential decision.
- The map remains one readable source of truth across sessions.
- Completion ends with a clear downstream handoff.

## Related skills

[A1 Grill](./a1-grill.md) pressure-tests one focused direction. [A1 Marketing Context](./a1-marketing-context.md) stores confirmed reusable inputs. A1 Wayfinder sits upstream of research, planning, and execution.

A1 Wayfinder is adapted from Matt Pocock's [`wayfinder`](https://github.com/mattpocock/skills/blob/38d62e71ed01fc05d5ae63b0807172e9546049d5/skills/engineering/wayfinder/SKILL.md) under the MIT License. See the local [license and attribution](../../skills/a1-wayfinder/references/license-and-attribution.md).
