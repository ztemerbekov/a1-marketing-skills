# Source-Scoped npx Workflow

Use only `npx skills@latest` for Marketing Skills installation changes. Do not copy skill folders manually and do not use a client-specific installer.

## Constants

- Source: `ztemerbekov/marketing-skills`
- Release channel: the repository's current `main`
- Global lock: `${XDG_STATE_HOME}/skills/.skill-lock.json` when `XDG_STATE_HOME` is set; otherwise `~/.agents/.skill-lock.json`
- Current-project lock: `./skills-lock.json`

Accept the source only when the lock entry normalizes to the exact GitHub repository above. Accept standard GitHub URL variants only after parsing the URL and confirming the owner and repository exactly. A name prefix is not source evidence.

## 1. Read the Upstream Inventory

Run:

```bash
npx skills@latest add ztemerbekov/marketing-skills --list
```

Record every discovered skill name and description. This command must succeed before comparing, updating, or removing anything. The source defaults to the repository's `main`; do not use another ref.

## 2. Read Each Active Scope

Read the global lock when it exists. Read `./skills-lock.json` only in the current directory. Validate the JSON before using it, then keep only entries from the exact source.

For actual installation paths and connected clients, run:

```bash
npx skills@latest list -g --json
npx skills@latest list --json
```

The first command is global. Run the second only for an active current-project scope. Filter both results to the source-tracked names from the corresponding lock; the list output alone does not prove source ownership.

Supported client label-to-key mappings are:

| List label | `--agent` key |
|------------|---------------|
| Antigravity | `antigravity` |
| Antigravity CLI | `antigravity-cli` |
| Claude Code | `claude-code` |
| Codex | `codex` |
| Cursor | `cursor` |
| Gemini CLI | `gemini-cli` |
| GitHub Copilot | `github-copilot` |
| Zed | `zed` |

For each scope, take the union of clients reported for its source-tracked Marketing Skills. This is the managed client set for the complete collection in that scope. The global lock's `lastSelectedAgents` value is installer-wide history, not source-specific evidence; never use it to add clients to the managed set. Keep global and current-project unions separate.

If a reported label cannot be mapped safely, do not invent a key, ask the user to choose one, or silently omit the client; stop that scope.

## 3. Compare

For each scope calculate:

- **Upstream:** every name in the verified upstream inventory.
- **Deleted:** source-tracked names absent upstream.
- **New:** upstream names not tracked for that scope.

A missing folder with a valid source lock entry is repaired during synchronization. If the scope has source-owned lock entries but no managed client can be recovered from the installed inventory, stop without changing that scope; do not use auto-detection, installer history, or every client as a fallback.

## 4. Mutation Barrier

Before any installation change, complete every read-only check for the whole run:

- verify the Node.js, `npm`, and `npx` capability required by `skills`;
- verify the complete upstream inventory;
- identify every active exact-source global and current-project scope;
- parse every active scope's source-owned lock state;
- read every active scope's installed inventory;
- calculate every managed client set;
- resolve every reported client label to a supported key; and
- calculate the complete deleted, new, repair, and refresh plan for every scope.

Treat this as one mutation barrier across all active scopes. Do not run `npx skills add`, `npx skills remove`, or `scripts/prune-lock.mjs` until every item above succeeds for every active scope. If any result is missing, unreadable, ambiguous, empty where a managed set is required, or unmappable, stop the whole run. Do not mutate an earlier scope merely because its own preflight passed.

### Unknown-client recovery

If any source-owned installed skill reports a client label that this installed updater cannot map, stop the whole run before the mutation barrier. Never ask the user for a key, invent one, omit the client, or update only the known clients.

Locate the running `a1-update` copy to determine its installation scope. Give one short message in the user's language stating that the update could not be prepared and nothing changed. Then provide exactly one copy-ready bootstrap command that refreshes `a1-update` in that same scope before the user retries the original request. Do not pass `--agent`: current `npx skills` detects the AI client running the command and selects it non-interactively.

Global updater:

```bash
npx skills@latest add ztemerbekov/marketing-skills --skill a1-update --global --yes
```

Current-project updater:

```bash
npx skills@latest add ztemerbekov/marketing-skills --skill a1-update --yes
```

Return only the command that matches the running updater. Do not name the unresolved client, show a client table, explain a lock file, expose an `--agent` key, or offer alternative commands.

## 5. Remove Deleted Skills Automatically

Only after a successful upstream inventory, remove deleted names without confirmation.

Global form:

```bash
npx skills@latest remove SKILL_NAME --global --yes
```

Current-project form:

```bash
npx skills@latest remove SKILL_NAME --yes
```

Pass all deleted names for that scope in one command when possible. Never use `--all`.

The current CLI does not consistently remove deleted entries from project lock files and cannot clear a global lock entry whose installed folder is already absent. After the removal command succeeds, verify that each deleted skill is absent from the scope, then run the bundled lock helper from this skill directory:

```bash
node scripts/prune-lock.mjs \
  --lock LOCK_FILE_PATH \
  --skill SKILL_NAME
```

Repeat `--skill` for multiple names. Use the global or current-project lock path established in step 2. The helper accepts only entries owned by `ztemerbekov/marketing-skills`, preserves unrelated entries and top-level metadata, sorts project skill keys, and writes atomically. If removal failed or any deleted skill is still installed, do not prune its lock entry.

## 6. Synchronize the Managed Set

Re-add every upstream skill from the canonical source into the scope's complete managed client set. This one operation refreshes tracked skills, repairs incomplete installations, and installs new upstream skills. All upstream skills share the same managed client set by definition.

Global form:

```bash
npx skills@latest add ztemerbekov/marketing-skills \
  --skill SKILL_NAME \
  --agent CLIENT_KEY \
  --global \
  --yes
```

Current-project form:

```bash
npx skills@latest add ztemerbekov/marketing-skills \
  --skill SKILL_NAME \
  --agent CLIENT_KEY \
  --yes
```

Repeat `--skill` for every upstream name and `--agent` for every key in the managed client set. Always pass explicit clients; AI-agent auto-detection must not narrow or expand the managed set.

Do not preserve or back up manual changes inside installed skill folders.

## 7. Record Membership Changes

Do not ask whether to install new upstream skills. They are already included in step 6. Record the names that were new before synchronization so the final response can mention only collection membership changes without exposing clients or scopes.

## 8. Verify

Run the applicable `list --json` commands again. Confirm that:

- every upstream skill exists in every client in that scope's managed client set;
- every upstream-deleted skill is absent from that scope;
- every upstream-deleted source-owned lock entry is absent;
- no client outside the pre-update managed client set was connected;
- unrelated installed skills are unchanged.

For success, follow the concise output contract in `SKILL.md`. Report partial completion as partial completion, not success.

## Mid-write Failure

Mutation begins immediately before invoking the first mutating command. A non-zero exit from `add`, `remove`, or the lock helper does not prove that no file changed. If the first or any later mutating command or post-write verification fails:

1. Stop every remaining write in the current scope and every later active scope.
2. Do not reinstall a removed skill, restore a lock snapshot, reverse a successful add, or attempt any other automatic rollback.
3. Preserve an internal record of the operations that completed, the failed command's state as uncertain, and the operations that remain so explicit diagnostics can be accurate.
4. Tell the user only that the update completed partially and give one retry action: repeat the original Marketing Skills update request. The retry starts with a new complete preflight against the real current state.

Do not expose client names, scopes, lock files, installer keys, command traces, or alternative recovery actions in the ordinary failure response.
