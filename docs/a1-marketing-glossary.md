# A1 Marketing Glossary

This is a compact authoring glossary for A1 skill maintainers. Add a term only when its definition changes agent behavior. It is not a runtime dependency: copy only the minimum vocabulary a self-contained skill needs into that skill.

Do not put brand-specific products, audiences, positioning, voice, proof, examples, preferred words, or business goals here. Those facts belong in `.agents/marketing-context.md`.

| Term | Operational definition | Behavior it controls |
|------|------------------------|----------------------|
| User job | One outcome a user can recognize and ask for without knowing the internal method. | Defines the boundary of one public skill. |
| Interaction contract | The expected input, gate, working relationship, and output for a user job. | A materially different contract is a reason to split a skill; an operation variant alone is not. |
| Model-invoked | A safe skill the agent may select from natural-language intent. | The skill should start from a reasonable default and avoid surprising hard gates. |
| User-invoked | A skill the user deliberately starts by name or command. | Use for interviews, consequential workflows, and other processes where an automatic start would be surprising. |
| Soft gate | The minimum input needed to produce a safe, useful result; missing optional context does not block execution. | Proceed with safe assumptions and disclose them when relevant. |
| Hard gate | Required information that must be clear before execution can be safe or strategically valid. | Ask only for the blocking information and do not execute past the gate. |
| Invariant spine | The shortest sequence of decisions every run of a skill follows. | Keeps the process predictable across simple and complex inputs. |
| Adaptive depth | More context, references, or checks only when ambiguity, risk, or task complexity requires them. | Prevents simple requests from inheriting the heaviest workflow. |
| Progressive disclosure | Loading detailed instructions only when the active branch needs them. | Keeps `SKILL.md` concise and avoids irrelevant runtime context. |
| Marketing context | Repository-specific product, audience, positioning, voice, proof, vocabulary, examples, and business goals stored in `.agents/marketing-context.md`. | Supplies reusable brand facts without mixing them into shared skill canon. |
| Criteria-based regression | A realistic eval case scored against behavior criteria rather than one golden output. | Allows wording to vary while protecting meaning, safety, and operation boundaries. |
| Must change / Must preserve / Forbidden | The three required criterion groups in an eval case: required improvements, protected properties, and disallowed outcomes. | Makes manual semantic evaluation observable and repeatable. |
