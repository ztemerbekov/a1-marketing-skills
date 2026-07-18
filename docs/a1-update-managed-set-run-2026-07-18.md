# A1 Update Managed-Set Run — 2026-07-18

This record is the focused semantic regression gate for the zero-choice managed-set update contract implemented in GitHub Issue #16. It does not replace the full updater release gate.

## Verdict

- Focused semantic regressions: `PASS` — eight focused cases on one exact candidate digest
- Repository verification: `PENDING`
- Standards review: `PENDING` — the initial review found four hard completion defects and one duplication smell; corrections are applied and rereview remains pending
- Spec review: `PENDING` — the initial review found only the intentionally open final gate; rereview remains pending after corrections
- Human semantic judgment: `PASS` — `ztemerbekov` explicitly accepted the constrained fallback and confirmed the actual final-digest outputs on `2026-07-18`
- Focused semantic gate: `PENDING`

## Environment and Candidate

- Client: current Codex desktop task
- Model: GPT-5 family; the desktop client does not expose the exact service variant
- Run date: `2026-07-18`
- Repository base commit: `cb8c76011b8223e08ba99a0de23a40bdbe710f63`
- Candidate source: current `skills/a1-update/`
- Candidate directory digest: `e5cd8e654a63fa28591d834093a4bfbbbc2d75fa19911053159af3163c690e78`
- Digest method: SHA-256 over every sorted path relative to `skills/a1-update/`, a NUL separator, and that file's SHA-256
- Human reviewer and fallback approver: `ztemerbekov`
- Preliminary criteria review: Codex

## Installation Mode

The exact candidate was installed from the local repository into a new temporary HOME with `npx skills@latest` 1.5.19. The installed directory and source candidate were byte-identical and produced the same recorded digest.

Fresh external `codex exec --ephemeral` runs were then rejected by the security reviewer because they would send the private candidate and fixture prompts to an external model provider without separate authorization. No workaround was attempted. The product owner explicitly accepted the completion checklist's constrained fallback: the current supported Codex task loaded the exact candidate, kept all fixture commands non-mutating, and recorded complete maintainer-only traces plus user-visible responses below.

This mode has less isolation than a clean external client session. It verifies semantic routing, command selection, protected state, and visible output against the exact candidate, but does not execute the mutating commands against a real user installation.

## Domain Boundary Reassessment

This change updates the existing updater interaction contract and collection lifecycle. It adds no skill or independently evolving marketing vocabulary. The repository remains a single-context domain and does not need `CONTEXT-MAP.md`.

## Judgment Rule

Each case uses its exact instruction, setup, and input without paraphrasing. The maintainer-only internal trace is judged separately from the user-visible response. A case passes only when Must Change, Must Preserve, Forbidden, and Output Contract all pass. Ambiguity is failure.

Each case-level `PASS` below combines the recorded Codex criteria evidence with `ztemerbekov`'s judgment of the actual final-digest outputs.

## Development Regression Evidence

The first installed informational run correctly explained automatic membership and client boundaries but omitted that manual changes are overwritten without backup. `update-explain-001` therefore failed. The runtime explanation contract and structural regression were tightened.

The first independent Standards review then found missing scope classification coverage, advance rather than actual human judgment, incomplete deletion input, a non-reproducible digest description, and duplicated focused-case lists. Scope behavior and three regressions were added, the deletion fixture was completed, the digest method was corrected, the validator list was centralized, and the candidate was reinstalled under the final digest above. All eight focused cases were restarted in the accepted fallback; their actual outputs now await human judgment.

## `update-existing-001` — PASS

Case: [update the complete collection in both active scopes](../skills/a1-update/evals/cases/update-existing-001.md)

### Complete Output

Maintainer-only internal execution trace:

```text
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest list --json
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-editor-in-chief --skill a1-marketing-context --skill a1-update --agent codex --agent cursor --global --yes
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-editor-in-chief --skill a1-marketing-context --skill a1-update --agent claude-code --yes
npx skills@latest list -g --json
npx skills@latest list --json
```

User-visible response:

```text
Marketing Skills обновлены.
```

- Must change: `PASS` — all four upstream skills are synchronized globally to the Codex/Cursor union and in the current project to Claude Code; `a1-update` is added automatically.
- Must preserve: `PASS` — the commands stay source-scoped, keep the two managed client sets separate, and never inspect the other project.
- Forbidden: `PASS` — there is no unfiltered update, `--all`, new client, backup, or confirmation.
- Output contract: `PASS` — the Russian response contains only the concise completion message.

## `update-managed-set-002` — PASS

Case: [normalize the managed set across seven clients](../skills/a1-update/evals/cases/update-managed-set-002.md)

### Complete Output

Maintainer-only internal execution trace:

```text
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-editor-in-chief --skill a1-marketing-context --skill a1-update --agent antigravity --agent antigravity-cli --agent codex --agent cursor --agent gemini-cli --agent github-copilot --agent zed --global --yes
npx skills@latest list -g --json
```

User-visible response:

```text
Marketing Skills обновлены.
```

- Must change: `PASS` — all four skills target the exact seven-client union and every reported label resolves to its supported key.
- Must preserve: `PASS` — the union comes only from source-owned skill inventory; no project scope is active.
- Forbidden: `PASS` — `lastSelectedAgents` contributes no client, and Amp, Claude Code, Cline, Deep Agents, OpenCode, and Warp are absent.
- Output contract: `PASS` — no client count, client name, scope, lock detail, or installer key reaches the user.

## `update-new-001` — PASS

Case: [install newly available skills automatically](../skills/a1-update/evals/cases/update-new-001.md)

### Complete Output

Maintainer-only internal execution trace after the fixture's completed existing-skill refresh:

```text
npx skills@latest add ztemerbekov/marketing-skills --skill a1-campaign-review --skill a1-offer-check --agent antigravity --agent codex --global --yes
npx skills@latest list -g --json
```

User-visible response:

```text
Marketing Skills обновлены. Добавлены: a1-campaign-review, a1-offer-check.
```

- Must change: `PASS` — both new names are installed automatically into the existing Antigravity/Codex union and reported.
- Must preserve: `PASS` — the managed client set and unrelated state remain unchanged.
- Forbidden: `PASS` — there is no question, declined skill, dismissal state, Claude Code, or Cursor connection.
- Output contract: `PASS` — only the two membership additions follow the concise completion sentence.

## `update-deleted-001` — PASS

Case: [remove skills deleted upstream](../skills/a1-update/evals/cases/update-deleted-001.md)

### Complete Output

Maintainer-only complete trace:

```text
npx skills@latest remove a1-editor-in-chief --global --yes
npx skills@latest list -g --json
node scripts/prune-lock.mjs --lock ~/.agents/.skill-lock.json --skill a1-editor-in-chief
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-marketing-context --skill a1-update --agent codex --agent cursor --global --yes
npx skills@latest list -g --json
npx skills@latest remove a1-editor-in-chief --yes
npx skills@latest list --json
node scripts/prune-lock.mjs --lock ./skills-lock.json --skill a1-editor-in-chief
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-marketing-context --skill a1-update --agent claude-code --yes
npx skills@latest list --json
```

User-visible response:

```text
Marketing Skills updated. Removed: a1-editor-in-chief.
```

- Must change: `PASS` — the source-scoped skill is removed and pruned in both active scopes, then all three remaining upstream skills are synchronized into each scope's verified managed client set.
- Must preserve: `PASS` — unrelated installed skills, lock entries, and other scopes remain outside the commands.
- Forbidden: `PASS` — there is no `--all`, name-prefix deletion, failed-inventory inference, or unrelated lock edit.
- Output contract: `PASS` — the removed name is reported without clients or scopes.

## `update-explain-001` — PASS

Case: [explain without updating](../skills/a1-update/evals/cases/update-explain-001.md)

### Complete Output

```text
Marketing Skills синхронизируются с актуальным набором из ветки main репозитория ztemerbekov/marketing-skills.

При обновлении весь текущий набор устанавливается во всех клиентах, где уже подключён хотя бы один Marketing Skill. Новые навыки добавляются автоматически, а удалённые из набора — удаляются. Другие источники, новые клиенты и проекты вне текущей папки не затрагиваются. Ручные изменения внутри установленных папок перезаписываются без бэкапа.

Это только объяснение: сейчас никаких команд и изменений не выполнялось.
```

- Must change: `PASS` — the explanation covers source scope, managed-set synchronization, automatic addition/deletion, and overwrite without backup.
- Must preserve: `PASS` — it remains informational and gives no unnecessary bootstrap command.
- Forbidden: `PASS` — no command, file change, system change, client change, or new-skill choice occurs.
- Output contract: `PASS` — it makes no completion claim and states that nothing ran.

## `update-scope-out-003` — PASS

Case: [reject an unrelated update job](../skills/a1-update/evals/cases/update-scope-out-003.md)

### Complete Output

```text
A1 Update обновляет только Marketing Skills из ztemerbekov/marketing-skills. Обновление humanizer из другого источника находится вне этого процесса, поэтому ничего не изменено.
```

- Must change: `PASS` — the entire request is classified outside the updater job and the exact source boundary is explained before prerequisite work.
- Must preserve: `PASS` — Marketing Skills, `humanizer`, locks, and clients remain unchanged.
- Forbidden: `PASS` — no command, unrelated update, substitute Marketing Skills update, or completion claim appears.
- Output contract: `PASS` — one concise boundary response contains no partial result.

## `update-scope-mixed-004` — PASS

Case: [reject a mixed source update](../skills/a1-update/evals/cases/update-scope-mixed-004.md)

### Complete Output

```text
Запрос объединяет обновление Marketing Skills и humanizer из другого источника. Разделите их на два запроса; пока ничего не обновлено.
```

- Must change: `PASS` — the request is classified as mixed, the unrelated-source job is named, and separation is requested before any prerequisite or inventory work.
- Must preserve: `PASS` — both installations and all associated state remain unchanged.
- Forbidden: `PASS` — neither half runs, no command appears, and there is no completion claim.
- Output contract: `PASS` — the concise response contains no partial update result.

## `update-scope-completed-input-005` — PASS

Case: [verify a supplied installation inventory](../skills/a1-update/evals/cases/update-scope-completed-input-005.md)

### Complete Output

Maintainer-only internal execution trace:

```text
npx skills@latest add ztemerbekov/marketing-skills --list
npx skills@latest list -g --json
npx skills@latest add ztemerbekov/marketing-skills --skill a1-editor --skill a1-editor-in-chief --skill a1-marketing-context --skill a1-update --agent codex --agent cursor --global --yes
npx skills@latest list -g --json
```

User-visible response:

```text
Marketing Skills обновлены.
```

- Must change: `PASS` — the supplied Cursor-only report is accepted as context, while live source and inventory verification produces the actual Cursor/Codex managed set.
- Must preserve: `PASS` — the completed report is not rewritten or used to remove Codex; unrelated state stays untouched.
- Forbidden: `PASS` — the trace neither trusts the report as live evidence nor skips verification, narrows to Cursor, expands beyond the verified union, or asks a technical question.
- Output contract: `PASS` — only the concise completion message reaches the user.

## Remaining Limitations

- The explicitly accepted constrained fallback has less isolation than a clean external client run.
- Mutating npx commands were intercepted and assessed from complete traces rather than executed against a real installation.
- Full updater release certification remains pending for prerequisite and failure branches; GitHub Issue #17 owns their redesigned recovery contract.
- Unknown future client labels still fail closed until Issue #17 adds the agreed non-technical recovery path.

## Finalization Rule

The Issue #16 focused gate passes only when all eight cases pass every criterion group and output contract, the human reviewer judges the actual outputs, repository verification passes, independent Standards and Spec rereviews pass, and the accepted fallback plus limitations remain disclosed. The full updater release gate remains separate.
