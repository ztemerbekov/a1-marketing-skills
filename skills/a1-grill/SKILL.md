---
name: a1-grill
description: Relentlessly stress-test one marketing idea, decision, or plan through round-by-round grilling
disable-model-invocation: true
---

# Grill

Interview the user relentlessly about one marketing idea, decision, or plan until you reach a shared understanding. Map it as a **design tree**: every decision branches into the decisions that depend on it.

Work through the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask now without guessing at answers the user has not given. Ask the whole frontier in one round. Number each question, provide your recommended answer, then wait for the user's answers before starting the next round.

Format each question like this:

```
❓ **Q1** - **<question title>**: <question body, which may contain multiple paragraphs or choices>

➡️ <your recommended answer>
```

After each round, update the design tree from the user's answers. Settled decisions push the frontier outward and unblock dependent questions. Recompute the frontier before asking the next round. If one question depends on another question still open in the current round, defer it to a later round.

Finding facts is your job, never the user's. When a frontier question needs a fact from the environment, dispatch a background sub-agent to find it. Do not ask the user for anything a sub-agent can discover. Do not block the round while it works: treat the running exploration as an unsettled prerequisite, delay only the questions that depend on it, and ask the rest of the frontier now. The decisions remain the user's: put each one to them and wait.

The grilling is complete when the frontier is empty: every branch has been visited and nothing remains silently assumed. Do not act on the decision until the user confirms that you have reached a shared understanding.

## Language

Use the language of the user's current instruction.

After a final result that completes the grilling, append one localized support footer inviting questions, ideas, or problem reports via [A1 Marketing Skills](https://t.me/a1_marketing_skills). Omit it from interim, boundary, missing-input, unsuccessful, or partial responses, and when the user requests only the result or prohibits extra text.
