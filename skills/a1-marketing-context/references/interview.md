# Explicit Interview

Interview is a deliberate branch inside the same context-maintenance user job. Start it only after explicit natural-language interview intent.

## Required Notice

Before the first question, tell the user in their language:

- questions will arrive one at a time;
- confirmed progress is saved after each answer;
- they may stop at any point and keep a valid partial context.

Then ask exactly one question.

## Question Rule

Ask only for missing confirmed information. Never ask the user to invent a strategy, speculate, rank hypotheses, or fill every canonical section.

Use this order only as a default when each item is still missing and material to the user's setup goal:

1. product facts;
2. approved audience;
3. approved positioning;
4. brand voice;
5. claims and evidence;
6. vocabulary or explicit prohibitions;
7. current business goal.

Phrase strategic fields as confirmation questions, for example: `Has positioning already been approved? If yes, what exact wording should I record?` Do not offer options or create an answer.

Ask at most seven questions in one interview pass. End earlier when the user's stated setup goal is satisfied or no other confirmed information is available.

## Incremental Save

Treat each user answer as a new complete pass through the context spine. Resolve its source, build the schema patch, merge, and write before stage 7 asks the next question. Save the confirmed answer immediately when safe; never claim it was saved before the write stage completes.

If the user says `stop`, `enough`, `finish`, or an equivalent instruction, ask nothing else. Keep every safely saved answer. When the current interview session has saved at least one answer, return the normal update confirmation and list the sections saved across that session even though the final stop pass makes no write.

If the user stops before any confirmed answer was supplied, traverse the empty no-write path and close briefly: `Stopped. No marketing context was created because no confirmed answers were saved.` Translate this response to the user's language. Do not create a directory or file, link a nonexistent context, list changed sections, describe the result as incomplete, or ask another question.

After seven questions, process and save the seventh answer through the full spine, return the normal confirmation, and stop the pass without an eighth question. The user may explicitly start another interview later.

**Complete when:** the pre-interview notice precedes the first of no more than seven one-at-a-time questions, and every safe confirmed answer survives an early or limit stop in a valid partial context.
