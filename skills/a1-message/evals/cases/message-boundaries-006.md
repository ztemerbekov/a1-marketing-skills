# message-boundaries-006 — Neighboring-Skill Boundaries

- ID: `message-boundaries-006`
- Operation: `Scope routing`
- Risk: A broad request may cause a workplace-message skill to partially draft cold outreach, a layered memo, or public copy.
- Scope Scenario: `Out of scope`

## User Instruction

Classify each request before drafting and stop before producing the requested artifact.

## Input

### Subcase A — Cold first-contact outreach

Scope Scenario: Out of scope

#### User Instruction

```text
Напиши первое холодное письмо финансовому директору компании, с которой мы никогда не общались.
```

#### Input

```text
Новый контакт, действующих деловых отношений нет.
```

### Subcase B — Layered decision memo

Scope Scenario: Out of scope

#### User Instruction

```text
Собери для совета директоров подробную записку на пять страниц: резюме, варианты, финансовые последствия, риски и приложения.
```

#### Input

```text
Нужен многостраничный документ с вариантами, финансовыми последствиями, рисками и приложениями.
```

### Subcase C — Public copy

Scope Scenario: Out of scope

#### User Instruction

```text
Напиши публичный пост для Telegram о запуске продукта.
```

#### Input

```text
Пост предназначен для публичного Telegram-канала и сообщает о запуске продукта.
```

## Must Change

- [ ] Identify A as cold first-contact outreach.
- [ ] Identify B as a layered decision memo.
- [ ] Identify C as public copy.
- [ ] Stop before producing any requested artifact.

## Must Preserve

- [ ] Preserve the artifact type and scope stated in each subcase.

## Forbidden

- [ ] Do not produce any partial cold email, memo, public post, or generic workplace message.
