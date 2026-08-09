# A1 Grill

**English** | [Русский](./a1-grill.ru.md)

## What it does

A1 Grill stress-tests one marketing idea, decision, or plan through a round-by-round interview. It maps the subject as a design tree and asks the current **frontier**: every question whose prerequisites are already settled.

The defining constraint is ownership. The agent researches discoverable facts and recommends answers, but the decisions remain yours. It does not act on the result until you confirm that you and the agent share the same understanding.

## When to use it

Invoke A1 Grill deliberately with `/a1-grill`; the agent does not start it automatically. Use it before committing to a consequential marketing direction when assumptions, dependencies, trade-offs, or blind spots may still be hidden.

Use [Consumer Psychology](./a1-consumer-psy.md) when the central question is whether a behavioral hypothesis is supported by research or what a completed test may mean. Use [Marketing Context](./a1-marketing-context.md) when the job is to preserve confirmed inputs for later work.

## The round and the frontier

Each round contains only questions that can be answered without first resolving another question in that same round. Every question is numbered, titled, and paired with the agent's recommended answer, so you can respond to the whole round by number.

Your answers reshape the design tree. The next round is recomputed from what has been settled rather than taken from a fixed questionnaire.

## Common questions

**Why does it ask several questions at once?**

A round is not a bulk questionnaire. It contains only the independent questions on the current frontier. A question that depends on another open answer waits for a later round.

**Will the agent make the decision for me?**

No. Recommendations give you something concrete to react to, but the skill must put every decision to you and wait. Emptying the frontier is not permission to act; your final confirmation is still required.

**What happens when a question depends on a fact I do not know?**

If the environment can answer it, the skill sends a background sub-agent to investigate. Independent questions continue while that research runs; only dependent questions wait.

## It's working if

- A round is numbered and each question has a separate recommendation.
- No question in a round depends on another unanswered question in that round.
- Later rounds clearly follow from decisions made earlier.
- Discoverable facts are investigated instead of delegated back to you.
- The session stops for your confirmation instead of moving into execution.

## Where it fits

A1 Grill is a user-invoked decision-support skill in A1 Core. It sharpens a marketing decision before execution; it does not store reusable context, perform a consumer-psychology diagnosis, or implement the resulting plan.
