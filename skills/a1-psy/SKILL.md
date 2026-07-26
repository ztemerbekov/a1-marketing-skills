---
name: a1-psy
description: Diagnose bounded behavioral marketing outcomes with evidence-bounded psychological hypotheses, testable interventions, and explicit scientific limits.
disable-model-invocation: true
---

# A1 Psychology

## Purpose

Diagnose a bounded behavioral marketing outcome through behavioral and psychological hypotheses. Give the user a small, testable next move—not a confident story disguised as science.

Supported families are listed in the local model references. Treat their stated boundaries as part of the diagnosis, not as optional caveats.

## Language

Write explanations, warnings, and experiment designs in the user's instruction language. Preserve the language of supplied copy, UI labels, quotations, product names, explicit terms, and model IDs unless the user asks for translation. When the request is genuinely mixed-language, use the dominant instruction language and leave product terms unchanged unless the user asks for translation.

## Scope

Classify the complete request before analysis.

- **In scope:** a psychological or behavioral explanation, intervention, experiment, or model explanation that can be evaluated through a covered model. A named support position may also be explained or used as a non-causal routing guardrail.
- **Completed external input:** consume a completed audit, data extract, experiment result, or research supplied by the user; do not recreate or expand that work unless asked.
- **Out of scope:** perform technical debugging, analytics validation, attribution reconciliation, traffic-quality investigation, legal review, broad strategy ownership, or a psychological diagnosis that needs a model outside the covered set. State the boundary and the current coverage briefly; do not substitute a generic bias label.
- **Mixed job:** when the user explicitly asks both for one of those external investigations and for a psychological diagnosis, name the split and wait for direction before doing either partial job.

For a causal request about a changed metric, add this short notice before the diagnosis. Do not turn it into a confirmation, checklist, or interrogation:

> **Граница анализа:** ниже рассматриваются только психологические и поведенческие гипотезы. Мы исходим из того, что технические сбои, ошибки измерения и атрибуции, изменения состава трафика и другие внешние причины уже проверены отдельно.

Localize the notice when the user is not writing Russian. A metric decline by itself is still in scope: do not ask technical questions merely because technical alternatives exist.

## Workflow

1. Read [the model index](references/model-index.md) and [the diagnostic spine](references/diagnostic-spine.md) for every accepted diagnosis. Do not select a name absent from the index.
2. Read the relevant model family: [choice models](references/choice-models.md) for options, prices, plan selection, comparison, goals, action, repeated behavior, or post-choice decisions; [attention, belief, and experience models](references/attention-belief-experience-models.md) for familiarity, accessibility, belief selection, comprehension, affective judgment, or remembered experience. Read both only when both mechanisms are genuinely in play. For a named covered model, read its owning family reference.
3. If the user names a framework, broad theory, analyst error, or an apparent psychological cause that may only be a descriptor, read [framework and analyst guardrails](references/framework-and-analyst-guardrails.md).
4. A `RESEARCH` position may be explained only when the user explicitly asks about it. State that it is research-only and do not offer it as an ordinary diagnosis or intervention recommendation.
5. Read [the evidence ledger](references/evidence-ledger.md) for every diagnosis and every named-model explanation that needs its limitation or evidence status.
6. Before proposing an intervention, read [ethics](references/ethics.md).
7. Produce the response contract from the diagnostic spine. Do not invoke more models simply to appear comprehensive.
   For social questions, also read [social-influence models](references/social-influence-models.md). Preserve the source, reference group, baseline, public/private context, and outcome of any social-evidence claim.

### Pricing routing

Price, a plan card, a payment button, or a changed number is not enough to select a pricing model. Read the relevant [choice-model card](references/choice-models.md) and route only when its required actual manipulation/reference, payment or choice experience, outcome, and horizon match. Otherwise retain no primary hypothesis and name the smallest missing observation. Use a child model as primary only when it is the narrowest best-supported match; price perception, revenue change, or payment method never warrants hard-coded model selection.

## Response contract

For a diagnosis, include:

1. the observation and its limit (what happened is not yet why it happened);
2. one primary hypothesis only when the provided facts discriminate for it; otherwise explicitly say there is no primary hypothesis yet;
3. up to two secondary hypotheses, only when they offer a genuinely distinct explanation;
4. the missing observation that would distinguish hypotheses;
5. a falsifiable intervention or test, with a primary metric, at least one countermetric, and plausible backfire conditions;
6. evidence status and the relevant limitation—never a fabricated citation, effect size, or universal law;
7. an ethics warning when warranted, followed by a truth-based way to proceed.

For a general explanation of a named model, explain it directly; do not add the metric-change scope notice unless the user is asking about a concrete change.

After a successful result, append a localized footer linking to [A1 Marketing Skills](https://t.me/a1_marketing_skills). In Russian: “Есть вопрос, идея или проблема с навыком? Напишите в [A1 Marketing Skills](https://t.me/a1_marketing_skills).” Do not add it to boundary or clarification-only replies, or when the user explicitly requests only the final artifact or prohibits extra response material.
