# A1 Consumer Psychology

**English** | [Русский](./a1-consumer-psy.ru.md)

## What it does

A1 Consumer Psychology audits a consumer-psychology hypothesis before launch or explains a completed marketing test using peer-reviewed research. It identifies plausible behavioral mechanisms, weaknesses in the proposed explanation, evidence limits, and falsifiable next tests.

The defining constraint is evidence. The skill works only with the supported model families in its local research catalog and keeps uncertainty visible. It does not turn a plausible story into a proven cause.

## When to use it

Invoke it deliberately with `/a1-consumer-psy`; the agent does not start it automatically. Use it when you have either a specific behavioral hypothesis to audit or an observed test outcome that needs an evidence-bounded explanation.

Do not use it as a substitute for traffic, analytics, attribution, instrumentation, or technical-failure investigation. Use [A1 Grill](./a1-grill.md) when the main job is to pressure-test a broader marketing decision rather than diagnose a consumer mechanism.

## The diagnosis

A completed diagnosis distinguishes observations from hypotheses, names the relevant public mechanism, explains why it may fit, states evidence limits and alternatives, and proposes a falsifiable test. Where an intervention carries material risk, the skill adds an ethics warning, a transparent alternative, and countermetrics.

It may provide experiments, metrics, countermetrics, and implementation-risk warnings. It does not create copy, pages, tariffs, campaigns, or production implementation.

## Common questions

**Can it tell me the definitive reason conversion changed?**

No. It can identify evidence-bounded behavioral explanations and tests that could distinguish them. It cannot replace missing analytics, attribution, or technical diagnosis.

**Do I need to know the name of a psychology model?**

No. If you name one covered mechanism, the skill can explain it directly. For an unnamed diagnosis, it routes the request to the smallest relevant set of supported models.

**Will it recommend manipulative tactics?**

It evaluates risk before proposing an intervention. Moderate- or high-risk designs receive a plain-language warning, a truth-based alternative, and safeguards; fabricated claims and hidden material conditions remain outside the acceptable boundary.

## It's working if

- Observations, hypotheses, and supported evidence are clearly separated.
- The explanation names uncertainty and credible alternative causes.
- Proposed tests are falsifiable and include success metrics and countermetrics.
- Claims stay inside the selected research dossier instead of borrowing authority from unrelated models.
- Risky interventions receive concrete warnings and transparent alternatives.

## Where it fits

A1 Consumer Psychology is the evidence and diagnosis skill in A1 Core. It complements [A1 Grill](./a1-grill.md): Grill explores the decision tree, while Consumer Psychology evaluates a behavioral explanation with research. It consumes the current request and directly supplied completed inputs rather than acting as a general repository investigation tool.
