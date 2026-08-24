# A1 Редактура

**English** | [Русский](./a1-redaktura.ru.md)

Use A1 Редактура when you want to start A1 Copy Editing through the explicit Russian command `/a1-redaktura`.

## The job

You have selected an existing draft and want to edit or review it through a Russian command. The alias passes the entire current request to [A1 Copy Editing](./a1-copy-editing.md).

This is an entry point, not a second editing capability. It adds no separate procedure, output format, or source policy.

## When to use it

Install it together with `a1-copy-editing`, then invoke `/a1-redaktura`. For an ordinary natural-language editing request, A1 Copy Editing can start without the alias.

## What you get

The same editing or review result, constraints, optional context behavior, and success criteria as A1 Copy Editing.

## Common questions

**Does the alias have special Russian editing rules?**

No. It runs the same A1 Copy Editing session.

**Can it be installed on its own?**

No. The alias delegates the request to `a1-copy-editing`, so both skills must be installed.

## How to recognize success

- `/a1-redaktura` starts the same behavior as `/a1-copy-editing`.
- No competing editing rules or output format appear.
- Requests outside A1 Copy Editing's scope remain outside this alias.

## Related skills

[A1 Copy Editing](./a1-copy-editing.md) is the canonical editing capability and the alias's only dependency.
