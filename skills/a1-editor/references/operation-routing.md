# Operation Routing / Маршрутизация операций

Classify the request by meaning, including Russian and English phrasing. This is not a rigid keyword list.

Определи режим по смыслу запроса, а не по точному совпадению слов.

## Editing Mode / Режим редактуры

Default mode. Use when the user provides text and asks to rewrite, shorten, clean up, clarify, improve, strengthen, make more persuasive, or make it sell.

Режим по умолчанию. Используй, когда пользователь дал текст и просит его отредактировать.

Russian triggers:

- `сократи`
- `почисти`
- `убери воду`
- `отредактируй`
- `перепиши`
- `усиль`
- `сделай убедительнее`
- `сделай продающе`
- `докрути`

English triggers:

- `shorten`
- `clean up`
- `rewrite`
- `clarify`
- `strengthen`
- `make persuasive`
- `make it sell`
- `improve`
- `edit`

In editing mode, improve editorial hygiene and marketing usefulness only within the source boundary:

- remove clutter;
- put the main point earlier;
- clarify reader value already present in the text;
- connect features to outcomes already present in the text or marketing context;
- surface proof already present;
- preserve facts, constraints, and cautious claims.

Do not add new marketing elements.

## Strategy Mode / Режим стратегии

Use when the user asks to define or rethink the underlying message, not just edit the supplied text.

Используй, когда пользователь просит не правку текста, а постановку смысла.

Russian triggers:

- `придумай позиционирование`
- `собери оффер`
- `разработай структуру лендинга`
- `помоги со стратегией`
- `найди аудиторию`
- `сформулируй сообщение кампании`

English triggers:

- `positioning`
- `offer strategy`
- `landing structure`
- `campaign message`
- `audience strategy`
- `messaging strategy`

If the request is strategic and required inputs are missing, ask concise blocking questions or use `a1-editor-in-chief` when explicitly invoked.

## Borderline Requests / Пограничные случаи

If the user says "make it sell" / `сделай продающе` but the source has no offer, reader value, proof, or marketing context, still edit the text. Make it clearer and stronger inside the available source material. Then briefly state the limitation: no new benefits, proof, or claims were added because they were not present in the source.
