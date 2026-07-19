# Chief Spine

Every invoked `a1-editor-in-chief` run follows these stages in order. The stages are invariant; depth is adaptive.

## 1. Classify Scope

Read [chief-scope.md](chief-scope.md) and classify the whole request before any other work. Stop on a pure out-of-scope or mixed-job request.

**Complete when:** the request is accepted as in scope or completed external input, or a full refusal has stopped the run without partial work.

## 2. Verify Editor Dependency

Verify that the sibling `../a1-editor/SKILL.md` is available. Do not inspect Editor's internal references.

If missing, tell the user to install `a1-editor` alongside this skill and stop before context reads or questions. Do not emulate Editor or edit the text locally.

**Complete when:** the Editor entrypoint is available, or a missing-dependency response has stopped the run without an interview or text work.

## 3. Resolve Sources

Read [source-resolution.md](source-resolution.md). Resolve current instructions, task materials, conversation facts, and available marketing context in precedence order.

**Complete when:** the source map has one winning source for every used input and every material conflict is either resolved by precedence or marked for the gate.

## 4. Apply the Adaptive Gate

Read [chief-gate.md](chief-gate.md). Use available sources to fill the assignment. Ask one decision question only when materially different editorial directions remain, then stop.

**Complete when:** one safe editorial direction is available, or one decisive question has stopped the run.

## 5. Diagnose Editorially

Read [editorial-diagnosis.md](editorial-diagnosis.md). Decide the bounded editorial direction and select the primary Editor operation.

**Complete when:** editorial decisions and review criteria are explicit and contain no unconfirmed marketing strategy.

## 6. Create the Editor Brief

Build the internal handoff from [editor-brief.md](editor-brief.md). Show it only when the user explicitly asks.

**Complete when:** the brief contains the source material, bounded decisions, operation label, allowed and forbidden moves, and observable acceptance criteria.

## 7. Delegate to Editor

Invoke `a1-editor` with the exact source material and Editor Brief. Delegate all text execution; do not draft, revise, or apply Editor canon inside the chief role.

**Complete when:** the first Editor result and its change notes are available for review.

## 8. Review as Chief

Read [chief-review.md](chief-review.md). Review against the brief. Allow at most one corrective Editor pass.

**Complete when:** the Editor result passes, or the single corrective pass has been reviewed and any unresolved failure is explicit.

## 9. Deliver Simply

Return the reviewed result under the output contract in `../SKILL.md`.

**Complete when:** the user receives the reviewed text and concise change summary without internal process sections, or an unresolved unsafe failure is reported without presenting the unsafe draft.
