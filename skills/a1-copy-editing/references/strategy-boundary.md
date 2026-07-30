# Strategy Boundary

This boundary runs before the entry contract, context gathering, or any editing or review work. It classifies the whole request before deciding whether `a1-copy-editing` may begin a run.

## Declared Scope

- **User job and in-scope work:** edit or review existing marketing text through the operations declared by `a1-copy-editing`.
- **Out-of-scope work:** create, choose, or rethink positioning, offers, audiences, campaign messaging, landing-page structure, or other marketing strategy.
- **Allowed external inputs:** completed strategic decisions and approved wording may be accepted as source material for an editing or review request. Accepting them does not permit Copy Editing to create or rethink them.
- **Mixed-job behavior:** if one request combines editing or review with out-of-scope strategy work, reject the whole mixed request before execution. Name the boundary, state that `a1-editor-in-chief` also does not create general marketing strategy, and do not return a partial result.

## Strategic Requests

Identify strategy by meaning, not by one keyword. A request is strategic when it asks the agent to create, choose, or rethink an underlying marketing decision such as:

- positioning, category, differentiation, or the idea the product should own;
- an offer, packaging, commercial proposition, or offer architecture;
- a target audience, segment, or priority reader;
- campaign messaging, a campaign concept, or a message system;
- landing-page structure or another new marketing architecture.

Editing existing wording about one of these subjects is still editing when the user supplies the strategic material and asks only to shorten, clarify, strengthen, restructure, or otherwise revise it. The boundary is crossed when completing the request requires choosing or inventing the underlying decision.

## Editing and Review Requests Stay Here

Start the ordinary Copy Editing run when the user selects editable material and directs an editing or review intent at it. Missing audience, channel, goal, constraints, or marketing context does not turn that request into strategy and does not justify routing it elsewhere.

If a request combines a safe edit or review with a strategic decision, do not perform either part. A1 Copy Editing's user job is editing and review, not orchestration, so even a useful separable result would be forbidden partial execution.

## Completed-Strategy Chief Handoff

Completed product and marketing decisions do not force a handoff. If the user supplies them and asks to shorten, clarify, strengthen, restructure, review, or otherwise work on existing text, keep the request in A1 Copy Editing.

Recommend that the user explicitly invoke `a1-editor-in-chief` only when both conditions are true:

1. the necessary product and marketing strategy is already completed and supplied or confirmed;
2. the user wants bounded editorial direction—reader focus, message emphasis, editorial angle, argument hierarchy, structure, or voice—before A1 Copy Editing executes the text.

Do not recommend Chief as a way to create, choose, research, or rethink positioning, offers, audiences, segmentation, pricing, campaign strategy, GTM, product strategy, or general marketing strategy. Chief may accept those completed decisions only as source material for an editorial assignment.

## Boundary Response

Respond concisely in the user's language:

1. State that A1 Copy Editing edits or reviews existing material and does not create or rethink the specific strategic decision requested.
2. If the request creates or rethinks strategy, state that `a1-editor-in-chief` cannot create it either; do not recommend Chief as the solution.
3. Only for a completed-strategy chief handoff, recommend that the user explicitly invoke `a1-editor-in-chief` for the bounded editorial workflow.
4. Stop without asking for reader, goal, channel or format, constraints, editing operation, or marketing context.

Do not load or emulate the chief workflow, start its adaptive gate, create a Copy Editing Brief, propose strategic options, draft the missing positioning, offer, audience, campaign, or structure, or return an edited fragment or partial review from a mixed request. Only a later explicit invocation by the user can start `a1-editor-in-chief`.

**Complete when:** the response names the relevant boundary, routes to Chief only when the completed-strategy handoff rule applies, asks no chief-gate questions, contains no invented strategy, and returns no partial edit for a mixed request.
