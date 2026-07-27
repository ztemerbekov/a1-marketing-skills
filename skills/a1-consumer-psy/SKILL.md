---
name: a1-consumer-psy
description: Audit consumer psychology hypotheses or analyze test outcomes using peer-reviewed research to explain user behavior, identify flaws, and set evidence limits.
disable-model-invocation: true
---

# Consumer Psychology

## Purpose

Audit consumer psychology hypotheses before launch or explain marketing test outcomes using peer-reviewed research. Identify behavior patterns, flaws, and evidence limits—not a confident story disguised as science.

Supported families are listed in the local model references. Treat their stated boundaries as part of the diagnosis, not as optional caveats.

## Language

Write explanations, warnings, and experiment designs in the user's instruction language. Preserve the language of supplied copy, UI labels, quotations, product names, and explicit terms unless the user asks for translation. Resolve a supplied internal model ID privately and describe the mechanism by its public name instead of repeating the ID. When the request is genuinely mixed-language, use the dominant instruction language and leave product terms unchanged unless the user asks for translation.

Keep catalog IDs, catalog roles, evidence grades, and ethics flags inside the diagnostic process; they are not user-facing terminology. In Russian, name every public mention of a psychological mechanism as a Russian term followed by its established English term in parentheses. In English, use only the established English term. In every other response language, name every public mechanism mention in that language followed by the established English term in parentheses. Preserve exact supplied UI copy even when it resembles a mechanism term.

## Workflow

1. Read [the model index](references/model-index.md) for every request and [the diagnostic spine](references/diagnostic-spine.md) for every diagnosis. Follow the index pointer for a named covered model; for an unnamed diagnosis, use the index to choose the smallest relevant dossier set.
2. Apply the catalog role and boundary owned by the index and selected dossier. Read the selected model's co-located evidence record.
3. Before proposing an intervention, read [ethics](references/ethics.md).
4. Produce every diagnosis through the diagnostic spine.

For a general model-explanation request, use any one canonical covered name or alias already present in the request and explain it directly from its dossier. Ask which model only when that request names none or several.

Only after a final user-facing result that fulfills this skill's declared user job, append a short footer in the user's instruction language inviting questions, ideas, or problems with the skill through [A1 Marketing Skills](https://t.me/+cdrPsIVINTxkZjEy). Omit it from boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, and any response that does not fulfill the job. A user request for only the final artifact or to prohibit extra response material suppresses it.
