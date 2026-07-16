# Source Boundary / Граница источников

This is the authoritative source boundary for `a1-editor` and shared editor execution. Other runtime files may point here but must not redefine this boundary.

## Allowed Sources / Разрешенные источники

Use only:

1. The editable text supplied by the user.
2. The user's explicit instruction and constraints in the current request.
3. `.agents/marketing-context.md`, when it exists.
4. `.claude/marketing-context.md` or `marketing-context.md` only when `.agents/marketing-context.md` is absent.
5. Facts the user supplied earlier in the conversation only when they clearly apply to the current text.

The instruction authorizes a transformation; it is not evidence for a new fact or marketing claim. Marketing context is optional. Its absence never blocks an otherwise safe edit.

## Context Consumption / Использование контекста

When the context uses the canonical schema, treat `Audience Defaults`, `Brand Voice Defaults`, and `Business Goal Defaults` as defaults: an explicit current request may override them for this task without changing the file. Treat `Product Facts`, `Claims and Evidence`, and `Explicit Prohibitions` as protected inputs. Equivalent legacy headings inherit the same meaning: `Product` and `Claims and Proof` are protected; `Audience`, `Brand Voice`, and `Business Goals` are defaults; a prohibition under `Words to Avoid` is protected.

Current instructions do not silently override protected inputs. When source text or an instruction conflicts with one, make the safest supported edit that preserves the protected input and briefly surface the conflict. If every permissible result would require choosing which protected fact is true, ask one concise question and do not guess. Missing context or a missing context section never blocks an otherwise safe edit.

## Traceability Rule / Проверка источника

Every specific fact, name, figure, feature, qualification, proof point, benefit, promise, and marketing element in the result must be traceable to an allowed source.

Preserve material qualifications and uncertainty. Do not turn `may`, `can`, `often`, an estimate, or a condition into a categorical promise.

## Forbidden Additions / Что нельзя добавлять

Do not invent or introduce material that is absent from the allowed sources, including:

- facts, definitions, metrics, clients, testimonials, awards, cases, or proof;
- product capabilities, benefits, outcomes, or claims;
- an offer, CTA, objection, guarantee, discount, urgency, or scarcity;
- a new audience, positioning, campaign message, landing-page architecture, or other marketing structure.

A request such as `make it sell`, `усиль`, or `add a CTA` does not waive this boundary. If the requested element is absent, improve the supplied material without creating it and state the limitation when it matters.

Reordering, shortening, clarifying, and formatting existing material are allowed when they do not imply missing marketing elements.

## Weak Source Material / Слабый исходник

Do not block. Make the safe improvement the source supports: remove clutter, clarify the available point, foreground existing value, simplify syntax, preserve constraints, and make unsupported source claims more cautious.

If the missing support materially limits the result, mention that limitation after the edit. Do not turn the limitation into a request for optional context.

## Significant Ambiguity / Существенная неоднозначность

Ask one concise question only when every safe edit would choose between materially different meanings. If a conservative rewrite can preserve the ambiguity without misleading the reader, make that edit and briefly note the ambiguity when useful.

When the user explicitly requires one concrete name but the source leaves two or more named candidates plausible, a conservative ambiguous rewrite does not satisfy the request. Ask which candidate is intended and stop. Do not infer the binding from the nearest antecedent, word order, grammar, likelihood, or common sense.
