# Source Resolution

Resolve the assignment from available sources in this order:

1. Current user instructions and current task materials.
2. Clearly applicable facts and decisions already supplied in the conversation.
3. `.agents/marketing-context.md`, when present; otherwise optionally `.claude/marketing-context.md` or `marketing-context.md`.

Current instructions and task materials always override repository marketing context. Do not merge contradictory values or silently let older context replace the current assignment.

When current material conflicts with marketing context, follow the current material and record a warning only when the ignored conflict could matter to the user. When two current sources conflict and the difference changes editorial direction, leave the conflict for the adaptive gate's single decision question.

Marketing context may supply reader, goal, channel or format, and constraints. Its absence never blocks the run. Do not use missing context as permission to infer product facts, marketing strategy, or proof.

Build an internal source map containing the source text, confirmed product and marketing inputs, assignment fields, constraints, and any material conflict.

**Complete when:** every assignment input and factual element has one winning source, current instructions have precedence, and unresolved material conflicts are identified without being guessed away.
