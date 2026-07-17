# chief-language-017 — Third-Language Instruction Localizes Chief Delivery

- ID: `chief-language-017`
- Operation: `Standard Edit` with variants
- Risk: Chief's universal localization rule works only for its explicit English and Russian examples or leaks English Editor labels.
- Scope Scenario: `In scope`

## Setup

Install both `a1-editor-in-chief` and `a1-editor`. No marketing context is available.

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

- [ ] Delegar en Editor y devolver dos variantes inglesas más claras y concisas, cada una de una sola frase con el enlace integrado.
- [ ] Usar equivalentes naturales en español para el texto final, `Opción 1`, `Opción 2` y el resumen de cambios, con explicaciones en español.

## Must Preserve

- [ ] Conservar el inglés como idioma del texto final.
- [ ] Mantener sin traducción ni cambios `Review Hub`, `Ozon`, el viernes y `https://example.com/reviews`.

## Forbidden

- [ ] No usar `Final Text`, `Edited Version`, `What Changed`, `Option 1`, `Option 2`, etiquetas rusas ni explicaciones en inglés.
- [ ] No mostrar Editor Brief, diagnosis, Chief Review, handoff mechanics ni un Editor response anidado.
- [ ] No añadir funciones, métricas, garantías, CTA ni otras afirmaciones no confirmadas.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
