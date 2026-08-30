# message-coherent-group-008 — One Message for Coherent Project Groups

- ID: `message-coherent-group-008`
- Operation: Workplace group message
- Risk: A literal single-recipient rule may reject a team chat or split one shared update into separate drafts for each member.
- Scope Scenario: `In scope`

## User Instruction

### Subcase A — Shared Awareness/Status, No CTA

```text
Напиши одно компактное готовое к отправке сообщение в общий чат проектной команды, чтобы сообщить текущий статус пилота. Никакого действия или ответа от команды не проси.
```

### Subcase B — Shared Decision Job

```text
Напиши одно компактное готовое к отправке сообщение в общий чат проектной команды и попроси команду выбрать один из предложенных вариантов запуска.
```

## Input

### Subcase A — Shared Awareness/Status, No CTA

```text
В чате состоят руководитель проекта, аналитик, технический руководитель и операционный менеджер; все участники работают над одним пилотом и получают один и тот же статус.
Пилот завершён в четырёх из пяти филиалов. Пятый филиал не начал тест, потому что служба безопасности не выдала доступ к стенду. Следующий подтверждённый шаг — повторно запросить доступ.
Сообщение только информирует всех участников о текущем статусе. Отдельных фактов, уровней конфиденциальности или формулировок для разных участников нет; CTA, просьбы о решении или ответе нет.
```

### Subcase B — Shared Decision Job

```text
В чате состоят руководитель проекта, аналитик, технический руководитель и операционный менеджер; все участники работают над одним пилотом и получают одни и те же факты и варианты.
Интеграционный тест завершён, но повторный прогон можно поставить либо на 18 октября после выдачи доступа службой безопасности, либо на 21 октября после дополнительной проверки данных. Команда должна выбрать один вариант запуска.
Для всех участников одинаковы факты, варианты, критерии выбора и просьба принять одно решение; отдельных уровней конфиденциальности или формулировок нет.
```

## Must Change

### Subcase A — Shared Awareness/Status, No CTA

- [ ] Treat the project-team chat as one coherent recipient set for one awareness/status communication job, even though no action or reply is requested.
- [ ] Produce one compact message for the whole team with the shared pilot status.
- [ ] Keep the message informational without inventing a CTA, decision request, or reply requirement.

### Subcase B — Shared Decision Job

- [ ] Treat the project-team chat as one coherent recipient set for one shared decision job.
- [ ] Produce one compact message that presents the same options and asks the team for one decision.
- [ ] Keep the decision request shared rather than creating per-person variants.

## Must Preserve

### Subcase A — Shared Awareness/Status, No CTA

- [ ] Preserve the four-of-five status, the security-access dependency, and the confirmed repeat-request step as status context.
- [ ] Preserve that all listed participants receive the same facts and no participant-specific wording is needed.

### Subcase B — Shared Decision Job

- [ ] Preserve both dates, their source-supported dependencies, and the fact that the team must choose one option.
- [ ] Preserve that all listed participants need the same facts, options, decision criteria, and disclosure level.

## Forbidden

### Both Subcases

- [ ] Do not reject the request merely because the recipient set contains several people.
- [ ] Do not produce separate messages for the project manager, analyst, technical lead, or operations manager.
- [ ] Do not invent different permissions, actions, disclosures, a decision, an approval, or a selected option for members of the coherent group.

### Subcase A — Shared Awareness/Status, No CTA

- [ ] Do not reject the request because it is awareness-only.
- [ ] Do not invent a CTA, decision, action, or reply requirement.
