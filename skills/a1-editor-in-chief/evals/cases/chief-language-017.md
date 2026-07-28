# chief-language-017 — Third-Language Instruction Localizes Chief Delivery

- ID: `chief-language-017`
- Operation: `Standard Edit` with variants
- Risk: Chief's universal localization rule works only for English and Russian or leaks English Copy Editing labels.
- Scope Scenario: `In scope`

## Setup

Install both `a1-editor-in-chief` and `a1-copy-editing`. No marketing context is available.

### Marketing Context

None.

## User Instruction

```text
Ejecuta explícitamente a1-editor-in-chief. Este es un texto en inglés para una nota interna dirigida a responsables de marketplace operations. El objetivo es describir claramente la revisión semanal; el formato debe incluir dos variantes, cada una de una sola frase con el enlace integrado; el tono debe ser directo y neutral. Conserva el inglés, Review Hub, Ozon, el viernes y https://example.com/reviews. Explica los cambios en español.
```

## Input

```text
Review Hub is a really very useful place where marketplace managers can view Ozon reviews every Friday. Details: https://example.com/reviews.
```

## Must Change

- [ ] Delegar en Copy Editing y devolver dos variantes inglesas más claras y concisas, cada una de una sola frase con el enlace integrado.
- [ ] Usar encabezados de resultado y etiquetas numeradas de opciones localizados naturalmente al español, con explicaciones en español.

## Must Preserve

- [ ] Conservar el inglés como idioma del texto final.
- [ ] Mantener sin traducción ni cambios `Review Hub`, `Ozon`, el viernes y `https://example.com/reviews`.

## Forbidden

- [ ] No usar etiquetas de servicio en inglés o ruso ni explicaciones en inglés, y no filtrar el scaffolding interno de Copy Editing.
- [ ] No mostrar Copy Editing Brief, diagnosis, Chief Review, handoff mechanics ni un Copy Editing response anidado.
- [ ] No añadir funciones, métricas, garantías, CTA ni otras afirmaciones no confirmadas.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
