# Strategy Boundary

This boundary runs before the editor soft gate. It decides whether `a1-editor` can edit supplied material or must stop before an editing run begins.

## Strategic Requests

Identify strategy by meaning, not by one keyword. A request is strategic when it asks the agent to create, choose, or rethink an underlying marketing decision such as:

- positioning, category, differentiation, or the idea the product should own;
- an offer, packaging, commercial proposition, or offer architecture;
- a target audience, segment, or priority reader;
- campaign messaging, a campaign concept, or a message system;
- landing-page structure or another new marketing architecture.

Editing existing wording about one of these subjects is still editing when the user supplies the strategic material and asks only to shorten, clarify, strengthen, restructure, or otherwise revise it. The boundary is crossed when completing the request requires choosing or inventing the underlying decision.

## Editing Requests Stay Here

Start the ordinary editor run when the user supplies editable material and an editing intent. Missing audience, channel, goal, constraints, or marketing context does not turn that request into strategy and does not justify routing it elsewhere.

If a mixed request contains a safe, separable edit and a strategic decision, never create the strategy silently. Perform the edit only when a partial result is clearly useful; name the omitted strategic part and use the boundary response for it.

## Boundary Response

Respond concisely in the user's language:

1. State that A1 Editor edits existing material and does not create or rethink the specific strategic decision requested.
2. Recommend that the user explicitly invoke `a1-editor-in-chief` for the strategic workflow.
3. Stop without asking for reader, goal, channel or format, constraints, editing operation, or marketing context.

Do not load or emulate the chief workflow, start its hard gate, create an Editor Brief, propose strategic options, or draft the missing positioning, offer, audience, campaign, or structure. Only a later explicit invocation by the user can start `a1-editor-in-chief`.

**Complete when:** the response names the relevant boundary, recommends explicit invocation, asks no chief-gate questions, and contains no invented strategy.
