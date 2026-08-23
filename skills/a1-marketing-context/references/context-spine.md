# Context Spine

Every invoked context-maintenance run follows these stages in order. The stages are invariant; Auto-draft and Interview adapt the depth.

## 1. Classify Invocation and Scope

Read [invocation-and-scope.md](invocation-and-scope.md). Confirm explicit context-maintenance intent, classify the whole request, and select Auto-draft or the explicitly requested Interview branch.

**Complete when:** the request is accepted as an in-scope explicit run, or the process has stopped without any file or directory write.

## 2. Locate Repository State

Work only in the current repository. Locate context paths in this order: `.agents/marketing-context.md`, then `.claude/marketing-context.md`, then root `marketing-context.md`. Treat the first existing path as the active candidate for ordinary context resolution and `.agents/marketing-context.md` as the sole writable marketing context. A canonical file makes lower-priority legacy files inactive for the run. When canonical context is absent and both legacy paths exist, identify both for the migration gate but do not read, merge, migrate, or remove either one before the user resolves that gate. Do not search for a global profile or choose a last-used repository.

**Complete when:** the current repository and the presence of the canonical and repository-local legacy files are known without creating any state.

## 3. Resolve Confirmed Sources

Read [source-policy.md](source-policy.md). Build a source map from direct user confirmations, authoritative project material, and the existing context. Exclude hypotheses and unsupported inference.

**Complete when:** every candidate value is traceable to a confirmed source, or a sparse run has stopped with one concrete question and no write.

## 4. Gather Only Required Information

For Auto-draft, use the confirmed source map without a questionnaire. For an explicit Interview, read [interview.md](interview.md), give the pre-interview notice on the first pass, and gather only the next missing confirmed item. Treat each later user answer as a new ordered pass through this spine.

**Complete when:** Auto-draft has a confirmed patch; the initial Interview pass has asked one question and stopped; or a later Interview pass has one confirmed answer ready to map, or a stop instruction ready to end the interview.

## 5. Build the Context Patch

Read [context-schema.md](context-schema.md). Map only confirmed values to the predictable structure. Omit empty sections and placeholders.

For an Interview stop instruction with no new confirmed value, build an explicit empty no-write patch. It preserves the prior saved state and lets the stop pass continue through the invariant stages without inventing content.

**Complete when:** the patch contains only requested changes or missing confirmed information and distinguishes defaults from protected inputs, or an Interview stop pass has an explicit empty patch.

## 6. Merge and Write

Read [merge-and-conflicts.md](merge-and-conflicts.md). Stop on an unresolved material conflict. Otherwise apply the smallest targeted patch, preserve unrelated content, and write only `.agents/marketing-context.md`.

For the empty Interview stop patch, make no write and carry the sections already saved during this interview session to the confirmation stage.

**Complete when:** one canonical file is safely created or updated, a confirmed legacy migration has left only the canonical file, an Interview stop pass has preserved prior state with zero writes, or one concrete conflict or migration question has stopped the run without a write.

## 7. Confirm Simply

Use the output contract in `../SKILL.md`. Link the canonical file, list changed sections briefly, and hide the full file unless requested. During Interview, either end with the normal confirmation, including the sections safely saved across the current interview session, or briefly confirm the saved section and ask exactly one next question; that question is the end of this pass, not a jump back to an earlier stage. An empty-session stop instead returns the short zero-write close response from `interview.md`, with no link or section list.

**Complete when:** the user receives a concise creation or update confirmation, an empty-session stop receives its short zero-write close response, or the active stopping condition has already produced its one question.
