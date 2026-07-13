# Information Style / Информационный стиль

Use this operation only when the user explicitly requests information style. It is a deeper editorial rewrite than the standard editing mode, but it does not permit new facts or strategy.

## Activation / Включение режима

Activate for explicit requests such as:

- `в информационном стиле`;
- `в инфостиле`;
- `по Ильяхову`;
- `по «Пиши, сокращай»`;
- equivalent unambiguous wording in the user's language.

Do not activate from generic requests such as `отредактируй`, `почисти`, `убери воду`, `сократи`, or `сделай понятнее` alone. Route those through the standard editing operations.

## Priority / Приоритет инструкций

Explicit user constraints override the operation defaults.

- `сохрани мой голос` means improve clarity without neutralizing the author's voice.
- `сохрани структуру` means edit inside the existing blocks without adding or moving sections.
- `не меняй форматирование` means preserve the supplied Markdown or plain-text shape.

## Allowed Moves / Что можно менять

- Replace a self-focused or emotional opening with the useful point already present in the source.
- Remove empty evaluations, introductions, intensifiers, cliches, bureaucratic wording, repetition, and template transitions.
- Put the main point earlier and regroup existing material around it.
- Split or combine paragraphs and sentences when this improves comprehension.
- Improve Markdown with headings, lists, emphasis, inline links, and code formatting.
- Neutralize author presence when it adds no fact, firsthand experience, or trust.
- Preserve meaningful personal experience and explicitly requested voice.

## Source Boundary / Граница источников

Use only the source text, the user's instruction, and allowed marketing context.

- Do not supply a definition that is missing from the source.
- Do not silently correct or complete facts from model knowledge.
- Do not replace an unsupported evaluation with an invented fact.
- Do not strengthen a cautious or figurative statement into a categorical claim.
- Preserve facts, names, figures, links, formulas, technical terms, and material qualifications.
- If a questionable claim cannot be improved without external knowledge, keep a cautious source-faithful version and mention the limitation in `What Changed` when useful.

Fact-checking is a separate task and is not implied by information-style editing.

## Output / Формат результата

Use the normal `a1-editor` output contract:

```markdown
## Edited Version

[rewritten text]

## What Changed

- [1-5 concise explanations of real changes]
```

Add assumptions only when they materially affect the rewrite. If the user asks for edited text only, omit the explanations.

## Regression Case: LLM Post

Use this case to evaluate behavior by criteria, not exact wording.

### Input

```markdown
Как работают большие языковые модели (LLM) и алгоритмы GPT

Наткнулся на потрясающее видео, где устройство нейросетей объясняется буквально «на пальцах». Рекомендую всем, кто хочет понимать базовые термины и читать новости про ИИ без боли.

Вы узнаете:

Что такое «веса» языковых моделей, за которыми идет настоящая охота корпораций.
Как работает векторная арифметика смыслов. Как алгоритмы понимают контекст и почему для ИИ абсолютно логично следующее семантическое уравнение: E(Суши) + E(Германия) − E(Япония) = E(Колбаски)

Введение и визуализация в предметную область есть в этом видео: https://www.youtube.com/watch?v=wjZofJX0v4M

TL;DW: Если нет 30 минут на просмотр, вот главная мысль:

Под капотом LLM нет магии и «искры разума». Это статистическая машина, которая математически высчитывает наиболее вероятное продолжение текста.
```

### Acceptance Criteria

- The opening reaches the reader value without keeping empty excitement or self-focused setup.
- Existing material is organized into valid, scannable Markdown.
- The link and semantic equation are preserved without corruption.
- The rewrite does not invent a definition of model weights or add future usefulness, facts, or claims.
- Figurative or cautious source claims are not strengthened into broader categorical claims.
- The useful summary remains easy to find.
- `What Changed` names only changes actually made.
