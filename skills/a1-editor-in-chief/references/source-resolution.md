# Source Resolution

Resolve the assignment from available sources in this order:

1. Current user instructions and current task materials.
2. Clearly applicable facts and decisions already supplied in the conversation.
3. `.agents/marketing-context.md`, when present; otherwise optionally `.claude/marketing-context.md` or `marketing-context.md`.

Resolve repository paths only inside the current repository. Never read a global marketing profile, a last-used pointer, or context from another or previously active repository.

Current instructions and task materials override repository context defaults and non-protected assignment decisions. They may select a different reader, voice, or business goal for this task without changing the context file. Do not merge contradictory values or silently let older defaults replace the current assignment.

Treat canonical `Product Facts`, `Claims and Evidence`, and `Explicit Prohibitions` as protected inputs; equivalent legacy `Product`, `Claims and Proof`, and prohibitions in `Words to Avoid` have the same protection. Current material must not silently override them. Leave a material protected-input conflict for the adaptive gate's single decision question and name both concrete values and sources. If the current material merely overrides a context default or a non-protected decision, follow the current material and record a warning only when the ignored conflict could matter to the user. When two current sources conflict and the difference changes editorial direction, also leave the conflict for the adaptive gate.

Marketing context may supply reader, goal, channel or format, and constraints. Its absence, or any missing section, never blocks the run. Do not use missing context as permission to infer product facts, marketing strategy, or proof.

Build an internal source map containing the source text, confirmed product and marketing inputs, assignment fields, constraints, and any material conflict.

**Complete when:** every assignment input and factual element has one winning source, explicit task values override defaults, protected conflicts remain explicit, and unresolved material conflicts are identified without being guessed away.
