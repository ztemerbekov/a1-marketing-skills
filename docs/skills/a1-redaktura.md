# A1 Редактура

**English** | [Русский](./a1-redaktura.ru.md)

## What it does

A1 Редактура provides the explicit Russian command `/a1-redaktura` for [A1 Copy Editing](./a1-copy-editing.md). It passes the current request to the main editing skill, which performs the edit or review and owns all behavior, language, source, and output rules.

The defining constraint is that this is an alias, not a second editing capability. It adds a deliberate Russian entry point without copying or changing the A1 Copy Editing runtime.

## When to use it

Install it alongside `a1-copy-editing` and invoke `/a1-redaktura` when you want an explicit Russian editing command. For ordinary natural-language editing requests, the model-invoked A1 Copy Editing skill can start without this alias.

## Common questions

**Is A1 Редактура a different editor with Russian-specific rules?**

No. It runs the same A1 Copy Editing session and therefore preserves the same source fidelity, operations, optional context behavior, and language contract.

**Can I install the alias without A1 Copy Editing?**

No. The alias delegates the whole request to `a1-copy-editing`, so both skills must be installed.

**Does the alias force the rewritten copy into Russian?**

No. It passes the request through unchanged. A1 Copy Editing preserves the source language of rewritten copy and uses the instruction language for explanations unless you request otherwise.

## It's working if

- `/a1-redaktura` starts the same editing or review behavior as A1 Copy Editing.
- No separate editing rules or output format appear in the alias.
- The target copy keeps its source language unless translation is requested.
- Requests outside A1 Copy Editing's scope remain outside the alias's scope.

## Where it fits

A1 Редактура is a user-invoked command alias in A1 Editorial. Its only neighbor and dependency is [A1 Copy Editing](./a1-copy-editing.md), which remains the canonical editing capability.
