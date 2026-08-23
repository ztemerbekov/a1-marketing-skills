# Source Boundary

This is the authoritative source boundary for `a1-copy-editing` and its shared editing and review execution. Other runtime files may point here but must not redefine this boundary.

## Allowed Sources

Use only:

1. The user-selected existing draft accepted by the [entry contract](../SKILL.md#entry-contract).
2. The user's explicit instruction and constraints in the current request.
3. The first existing repository marketing context in this order: `.agents/marketing-context.md`; otherwise `.claude/marketing-context.md`; otherwise root `marketing-context.md`. Read no lower-priority context after selecting one.
4. Facts the user supplied earlier in the conversation only when they clearly apply to the current text.

The instruction authorizes a transformation; it is not evidence for a new fact or marketing claim. Marketing context is optional. Its absence never blocks an otherwise safe edit.

## Context Consumption

When the context uses the canonical schema, treat `Audience Defaults`, `Brand Voice Defaults`, and `Business Goal Defaults` as defaults: an explicit current request may override them for this task without changing the file. Treat `Product Facts`, `Claims and Evidence`, and `Explicit Prohibitions` as protected inputs. Equivalent legacy headings inherit the same meaning: `Product` and `Claims and Proof` are protected; `Audience`, `Brand Voice`, and `Business Goals` are defaults; a prohibition under `Words to Avoid` is protected.

Current instructions do not silently override protected inputs. When source text or an instruction conflicts with one, make the safest supported edit that preserves the protected input and briefly surface the conflict. If every permissible result would require choosing which protected fact is true, ask one concise question and do not guess. Missing context or a missing context section never blocks an otherwise safe edit.

## Traceability Rule

Every specific fact, name, figure, feature, qualification, proof point, benefit, promise, and marketing element in the result must be traceable to an allowed source.

Preserve material qualifications and uncertainty. Do not turn `may`, `can`, `often`, an estimate, or a condition into a categorical promise.

Use the allowed sources as the complete content boundary. Transform, reorder, shorten, clarify, and format only material traceable to them. If the user requests unsupported material, make the strongest source-supported edit and state the limitation when it matters.

## Weak Source Material

Make the safe improvement the source supports: remove clutter, clarify the available point, foreground existing value, simplify syntax, preserve constraints, and make unsupported source claims more cautious.

If the missing support materially limits the result, mention that limitation after the edit and continue without requesting optional context.

## Significant Ambiguity

Ask one concise question only when every safe edit would choose between materially different meanings. If a conservative rewrite can preserve the ambiguity without misleading the reader, make that edit and briefly note the ambiguity when useful.

When the user explicitly requires one concrete name but the source leaves two or more named candidates plausible, a conservative ambiguous rewrite does not satisfy the request. Ask which candidate is intended and stop. Do not infer the binding from the nearest antecedent, word order, grammar, likelihood, or common sense.
