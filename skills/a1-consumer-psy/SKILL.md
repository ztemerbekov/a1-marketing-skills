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

## Scope

Classify the complete request before analysis.

- **In scope:** a psychological or behavioral explanation, intervention, experiment, or model explanation that can be evaluated through a covered model. A named support position may also be explained or used as a non-causal routing guardrail.
- **Completed external input:** consume a completed audit, data extract, experiment result, or research that the user directly supplies; do not recreate or expand that work unless asked.
- **Input boundary:** use only the current request and directly supplied completed inputs. Do not inspect repository context, request a separate profile, or offer a route to another skill.
- **Out of scope:** perform technical debugging, analytics validation, attribution reconciliation, traffic-quality investigation, legal review, broad strategy ownership, marketing copy, pages, tariffs, campaigns, production implementation, or a psychological diagnosis that needs a model outside the covered set. State the boundary and the current coverage briefly; do not substitute a generic bias label.
- **Mixed job:** when the user explicitly asks both for a separate out-of-scope job—including an external investigation or production artifact—and for a psychological diagnosis, name the split and wait for direction before doing either partial job. At that routing step, ask only which bounded task to pursue; do not request or require external evidence, completed checks, access, or confirmation.

For a causal request about a changed metric, add one short notice in the user's instruction language before the diagnosis. State that the analysis considers only psychological and behavioral hypotheses and treats technical failures, measurement and attribution errors, traffic-composition changes, and other external causes as already checked separately. A metric decline by itself is still in scope: do not ask technical questions merely because technical alternatives exist. Keep the notice declarative rather than turning it into a confirmation, checklist, or interrogation.

## Workflow

1. Read [the model index](references/model-index.md) and [the diagnostic spine](references/diagnostic-spine.md) for every accepted diagnosis. Do not select a name absent from the index.
2. Follow the index pointer for a named covered model. For an unnamed diagnosis, read only the smallest relevant dossier: [goals, action, and post-choice](references/dossiers/choice-goals-action-post-choice.md), [options, defaults, and comparison](references/dossiers/choice-options-defaults-comparison.md), [pricing and valuation](references/dossiers/choice-pricing-valuation.md), [attention, belief, and experience](references/dossiers/attention-belief-experience.md), or [social influence](references/dossiers/social-influence.md). Read another dossier only when both mechanisms are genuinely in play.
3. If the user names a framework, broad theory, analyst error, or an apparent psychological cause that may only be a descriptor, follow its index pointer to [the guardrail dossier](references/dossiers/guardrails.md).
4. A `RESEARCH` position may be explained only when the user explicitly asks about it. Follow its index pointer to [the research-only dossier](references/dossiers/research-only.md), state that it is research-only, and do not offer it as an ordinary diagnosis or intervention recommendation. When it is named alongside a live outcome, explain why its narrow operation cannot diagnose that outcome; do not propose a test or intervention based on that position.
5. Read the selected model section's co-located evidence record for every diagnosis and every named-model explanation that needs its limitation or evidence status.
6. Before proposing an intervention, read [ethics](references/ethics.md).
7. Produce the response contract from the diagnostic spine. Give behavioral analysis, hypotheses, experiments, metrics, countermetrics, and implementation-risk warnings—not production artifacts. Do not invoke more models simply to appear comprehensive. For social questions, preserve the source, reference group, baseline, public/private context, and outcome of any social-evidence claim.

## Response contract

The [diagnostic spine](references/diagnostic-spine.md) is the canonical owner of the diagnosis output contract: preserve visible uncertainty, a smallest defensible hypothesis set, a falsifiable test, proportionate evidence limits, and an ethics warning when triggered. Its public report is detailed and executive-readable; internal catalog notation stays in the local references and reasoning.

For a general explanation of a named model, explain it directly; do not add the metric-change scope notice unless the user is asking about a concrete change. Treat one canonical covered model name or alias anywhere in the complete request as the named model; do not ask the user to name it again. Ask for clarification only when no model is named or several distinct models are named.

Only after a final user-facing result that fulfills this skill's declared user job, append a short footer in the user's instruction language inviting questions, ideas, or problems with the skill through [A1 Marketing Skills](https://t.me/+cdrPsIVINTxkZjEy). Omit it from boundary responses, refusals, clarification or missing-input prompts, interim updates, unsuccessful results, and any response that does not fulfill the job. A user request for only the final artifact or to prohibit extra response material suppresses it.
