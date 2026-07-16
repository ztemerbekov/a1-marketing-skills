# Invocation and Scope

Classify invocation and the whole request before reading repository content, asking questions, creating `.agents/`, or writing a file.

## Explicit Auto-draft Intent

Start Auto-draft when the user explicitly asks to create, save, remember, or update reusable marketing context. Match meaning, not one exact phrase. Examples include:

- `set up marketing context`;
- `remember our tone of voice`;
- `save this approved audience for future marketing work`;
- `update the positioning in our marketing context`.

An ordinary explicit request authorizes a direct write after source and conflict checks. A preview is not mandatory.

## Passive No-op Boundary

Do not invoke or write when the only event is:

- skill or plugin installation;
- opening, indexing, or switching to a repository;
- a generic mention of marketing, audience, tone, or positioning without save or update intent;
- another skill finding no context or saying context is optional;
- discovering that `.agents/marketing-context.md` exists or is missing.

Do not turn passive no-op behavior into an offer, questionnaire, directory creation, or empty context file.

## Explicit Interview Intent

Start Interview only when the user explicitly asks for an interview, guided questions, or one-question-at-a-time setup. The request may be ordinary natural language. Do not require `/commands`, client metadata, or platform-specific syntax.

## Declared Scope

- **In scope:** extract, normalize, create, and incrementally update confirmed reusable product, audience, positioning, voice, proof, vocabulary, examples, and business-goal information.
- **Out of scope:** create, propose, compare, score, test, or evaluate marketing hypotheses; perform research; choose strategy; write campaign copy; or infer facts from model knowledge.
- **Completed external inputs:** approved decisions and authoritative facts may be stored as confirmed source material. Accepting them does not authorize this skill to produce or rethink them.
- **Mixed-job behavior:** if one request combines context maintenance with hypothesis creation, evaluation, research, strategy selection, or copy production, refuse the whole request before writing either part.

For an out-of-scope or mixed request, name the unsupported job and state that this skill records completed confirmed inputs but does not create or evaluate them. Stop without inspecting the repository, asking setup questions, saving an in-scope fragment, or creating files.

**Complete when:** explicit Auto-draft or Interview intent is accepted, or a passive, out-of-scope, or mixed request has stopped without side effects.
