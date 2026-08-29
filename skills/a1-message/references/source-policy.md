# Source Policy

## Allowed sources and precedence

Use only four source classes:

1. the current user instruction;
2. the user-selected material, including a selected draft;
3. clearly applicable facts established earlier in the conversation;
4. the first eligible repository Marketing Context source, when the current task permits it, checked in this order: `.agents/marketing-context.md`, `.claude/marketing-context.md` only when the canonical path is absent, then `marketing-context.md` at the repository root only when both earlier paths are absent.

Current instructions control purpose, recipient, tone, channel, and output form. Supplied material controls its facts, figures, options, decisions, recommendations, owners, deadlines, quotations, and causal claims. Earlier conversation facts must be clearly applicable. Marketing Context supplies defaults and confirmed context only when relevant; a conflict with current instructions or supplied material remains unresolved rather than silently merged. Read only the first existing Marketing Context path.

## Message map

Before drafting, map each eligible substantive element to one of these fields and mark its status:

- main point;
- necessary context;
- facts and figures;
- problem or dependency;
- supplied options;
- recommendation and its rationale;
- decision status;
- requested action or reply;
- owner;
- deadline or timing;
- risk or consequence;
- unknowns;
- supporting detail;
- source support.

Use `supplied fact`, `supplied option`, `supplied recommendation`, `decided action`, `awaiting approval`, `unresolved`, or `unknown` where applicable. Keep a recommendation visibly a recommendation, a proposal visibly proposed, an approval visibly pending, and an unresolved choice visibly unresolved. A source may say that an option is recommended without saying it is approved or decided.

## Derivation and invention boundary

Derive only a narrow consequence when explicit source criteria make the conclusion non-arbitrary and the derivation remains transparent in the message. Do not manufacture substantive options, causes, costs, estimates, owners, deadlines, risks, approvals, quotations, or certainty to make the message feel complete. Preserve material unknowns as unknowns.

Treat a generic diagnostic or recovery step as a substantive proposed action: investigating a cause, restoring data, rerunning an export, reconciling output, or checking logs is source-supported only when the allowed sources supply that action. When the sources contain no solution, options, or decision criteria, state that absence explicitly and request only source-supported decision, diagnostic input, or assignment; never fill the missing solution slot with a plausible process.

Ask one concise blocking question only when every accurate result would otherwise invent a material fact or choose between materially different meanings or decisions. If a safe useful message remains possible, proceed. State one material limitation outside the artifact only when the gap affects the recipient's use of the message. Keep the limitation out of artifact-only output.

## Source-faithful compression

Compress correspondence, documents, and selected drafts into the facts and operational meaning the recipient needs. Preserve source-specific amounts, dates, names, events, statuses, dependencies, and decision distinctions whenever they affect what the recipient can understand, decide, act on, or reply to. For readiness or current-state claims, retain concrete operational identifiers supplied as evidence, such as analytics event names, test names, system fields, version markers, or release markers; a generic summary such as “analytics is ready” is insufficient when those identifiers let the recipient verify the claim. Omit source trail and decorative detail without changing meaning; ordinary wording and formatting may assemble the supplied meaning but may not add facts.
