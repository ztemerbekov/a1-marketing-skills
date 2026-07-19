# editor-language-013 — Third-Language Instruction Localizes Response Scaffolding

- ID: `editor-language-013`
- Operation: `Standard Edit` with variants
- Risk: The universal localization rule works only for English and Russian.
- Scope Scenario: `In scope`

## Setup

### Marketing Context

None.

## User Instruction

```text
Edita este texto en inglés y conserva el inglés. Mantén sin cambios Review Hub, Ozon y Wildberries. Da dos opciones claramente distintas y explica los cambios en español.
```

## Input

```text
Review Hub is a really very useful place where teams can view Ozon and Wildberries reviews together.
```

## Must Change

- [ ] Devolver dos variantes inglesas más claras y concisas.
- [ ] Usar encabezados de resultado y etiquetas numeradas de opciones localizados naturalmente al español, con explicaciones en español.

## Must Preserve

- [ ] Conservar el inglés como idioma del texto editado.
- [ ] Mantener sin traducción ni cambios `Review Hub`, `Ozon` y `Wildberries`.

## Forbidden

- [ ] No usar etiquetas de servicio en inglés o ruso ni explicaciones en inglés.
- [ ] No añadir funciones, métricas, garantías, CTA ni otras afirmaciones no confirmadas.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
