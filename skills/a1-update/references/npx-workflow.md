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
| Codex | `codex` |
| Claude Code | `claude-code` |
| Cursor | `cursor` |
| Antigravity | `antigravity` |

Preserve the client set reported for each existing skill. For a newly available skill, use the union of clients already connected to any Marketing Skill in that scope. If a reported label cannot be mapped safely, do not invent a key or silently omit the client; report the ambiguity and stop that scope.

## 3. Compare

For each scope calculate:

- **Existing:** source-tracked names also present upstream.
- **Deleted:** source-tracked names absent upstream.
- **New:** upstream names not tracked for that scope.

A missing folder with a valid source lock entry still counts as existing and should be restored. If no connected client can be recovered for it, stop and ask which already-used client should be restored; do not connect every client.

## 4. Remove Deleted Skills Automatically

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

## 5. Refresh Existing Skills

Re-add existing skills from the canonical source so installed files are replaced by the latest `main`. Group skills only when they share the same connected-client set.

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

Repeat `--skill` or `--agent` as required by the installed inventory. Always pass explicit clients; AI-agent auto-detection must not narrow or expand the existing client set.

Do not preserve or back up manual changes inside installed skill folders.

## 6. Offer New Skills Once

After refreshing and removing tracked skills, show one combined list of all new skills with descriptions and the scopes where each would be installed. Ask one question that accepts:

- all listed skills;
- none;
- a named subset.

Install accepted skills with the same `add` forms above, targeting the union of clients already connected to Marketing Skills in each scope. Do not add a client that was not in that union. A declined skill remains untracked and is offered again on the next run.

## 7. Verify

Run the applicable `list --json` commands again. Confirm that:

- every refreshed or accepted skill exists in its intended scope and clients;
- every upstream-deleted skill is absent from that scope;
- every upstream-deleted source-owned lock entry is absent;
- unrelated installed skills are unchanged.

Report partial completion as partial completion, not success.
