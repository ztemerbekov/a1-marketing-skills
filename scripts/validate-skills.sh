#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="skills"
issues=0
warnings=0
passed=0
artifacts_passed=0
certification_report="docs/a1-editor-pilot-certification.md"
update_certification_report="docs/a1-update-certification.md"

echo "Validating A1 design contract artifacts"
echo

editor_eval_cases=(
  "skills/a1-editor/evals/cases/editor-strategy-route-001.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-002.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-003.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-004.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-005.md"
  "skills/a1-editor/evals/cases/editor-strategy-boundary-006.md"
  "skills/a1-editor/evals/cases/editor-strategy-boundary-007.md"
  "skills/a1-editor/evals/cases/editor-strategy-boundary-008.md"
  "skills/a1-editor/evals/cases/editor-standard-001.md"
  "skills/a1-editor/evals/cases/editor-shorten-001.md"
  "skills/a1-editor/evals/cases/editor-clarify-001.md"
  "skills/a1-editor/evals/cases/editor-strengthen-001.md"
  "skills/a1-editor/evals/cases/editor-restructure-001.md"
  "skills/a1-editor/evals/cases/editor-ambiguity-001.md"
  "skills/a1-editor/evals/cases/editor-information-style-001.md"
  "skills/a1-editor/evals/cases/editor-information-style-002.md"
  "skills/a1-editor/evals/cases/editor-information-style-003.md"
  "skills/a1-editor/evals/cases/editor-information-style-004.md"
  "skills/a1-editor/evals/cases/editor-information-style-005.md"
  "skills/a1-editor/evals/cases/editor-information-style-008.md"
  "skills/a1-editor/evals/cases/editor-information-style-006.md"
  "skills/a1-editor/evals/cases/editor-information-style-007.md"
)

chief_eval_cases=(
  "skills/a1-editor-in-chief/evals/cases/chief-dependency-001.md"
  "skills/a1-editor-in-chief/evals/cases/chief-explicit-002.md"
  "skills/a1-editor-in-chief/evals/cases/chief-explicit-003.md"
)

update_eval_cases=(
  "skills/a1-update/evals/cases/update-existing-001.md"
  "skills/a1-update/evals/cases/update-deleted-001.md"
  "skills/a1-update/evals/cases/update-new-001.md"
  "skills/a1-update/evals/cases/update-explain-001.md"
  "skills/a1-update/evals/cases/update-prerequisite-001.md"
  "skills/a1-update/evals/cases/update-upstream-failure-001.md"
)

required_artifacts=(
  "AGENTS.md"
  "README.md"
  "README.ru.md"
  "CONTRIBUTING.md"
  "scripts/test-update-lock-helper.mjs"
  "docs/maintainers/README.md"
  "docs/a1-skill-design-contract.md"
  "docs/a1-skill-completion-checklist.md"
  "docs/a1-marketing-glossary.md"
  "skills/a1-editor/references/editor-spine.md"
  "skills/a1-editor/references/strategy-boundary.md"
  "skills/a1-editor/references/source-boundary.md"
  "skills/a1-editor/references/operations.md"
  "skills/a1-editor/references/information-style.md"
  "skills/a1-editor/references/final-qa.md"
  "skills/a1-editor/evals/README.md"
  "skills/a1-editor/evals/case-template.md"
  "$certification_report"
  "$update_certification_report"
  "skills/a1-editor-in-chief/references/chief-gate.md"
  "skills/a1-editor-in-chief/references/editor-brief.md"
  "skills/a1-update/SKILL.md"
  "skills/a1-update/agents/openai.yaml"
  "skills/a1-update/references/npx-workflow.md"
  "skills/a1-update/references/runtime-prerequisites.md"
  "skills/a1-update/scripts/prune-lock.mjs"
  "skills/a1-update/evals/README.md"
  "skills/a1-update/evals/case-template.md"
  "skills/a1-marketing-context/agents/openai.yaml"
  "${editor_eval_cases[@]}"
  "${chief_eval_cases[@]}"
  "${update_eval_cases[@]}"
)

for artifact in "${required_artifacts[@]}"; do
  if [[ -f "$artifact" ]]; then
    echo "PASS $artifact"
    artifacts_passed=$((artifacts_passed + 1))
  else
    echo "FAIL $artifact"
    echo "  Missing required A1 design contract artifact"
    issues=$((issues + 1))
  fi
done

echo
echo "Testing updater lock helper"
if node scripts/test-update-lock-helper.mjs; then
  :
else
  echo "FAIL scripts/test-update-lock-helper.mjs"
  echo "  Updater lock helper fixtures failed"
  issues=$((issues + 1))
fi

removed_adapters=(
  ".claude-plugin"
  ".cursor/rules"
)

for adapter in "${removed_adapters[@]}"; do
  if [[ -e "$adapter" ]]; then
    echo "FAIL $adapter"
    echo "  Client-specific adapters must remain removed; distribute with npx skills"
    issues=$((issues + 1))
  fi
done

legacy_skill_dirs=(
  "skills/a1-setup-marketing-context"
  "skills/a1-update-marketing-skills"
)

for legacy_skill_dir in "${legacy_skill_dirs[@]}"; do
  if [[ -e "$legacy_skill_dir" ]]; then
    echo "FAIL $legacy_skill_dir"
    echo "  Legacy skill aliases must not remain installable"
    issues=$((issues + 1))
  fi
done

legacy_skill_references="$(
  grep -RIlE \
    --exclude="validate-skills.sh" \
    'a1-setup-marketing-context|a1-update-marketing-skills' \
    AGENTS.md CONTRIBUTING.md docs skills scripts || true
)"

if [[ -n "$legacy_skill_references" ]]; then
  echo "FAIL legacy skill references"
  echo "  Previous identifiers may appear only in README migration instructions and validator assertions"
  echo "$legacy_skill_references"
  issues=$((issues + 1))
fi

require_text() {
  local file="$1"
  local required_text="$2"
  local error="$3"

  if [[ -f "$file" ]] && ! grep -Fq "$required_text" "$file"; then
    echo "FAIL $file"
    echo "  $error"
    issues=$((issues + 1))
  fi
}

forbid_text() {
  local file="$1"
  local forbidden_text="$2"
  local error="$3"

  if [[ -f "$file" ]] && grep -Fq "$forbidden_text" "$file"; then
    echo "FAIL $file"
    echo "  $error"
    issues=$((issues + 1))
  fi
}

require_text "AGENTS.md" "docs/a1-skill-design-contract.md" "AGENTS.md must require the canonical A1 skill design contract"
require_text "AGENTS.md" "docs/a1-skill-completion-checklist.md" "AGENTS.md must require the reusable A1 completion checklist"
require_text "AGENTS.md" "CONTEXT-MAP.md" "AGENTS.md must require domain-boundary reassessment for new skills"
require_text "AGENTS.md" 'agents/openai.yaml' "AGENTS.md must document the accepted UI metadata extension"
require_text "docs/a1-skill-design-contract.md" "a1-skill-completion-checklist.md" "The design contract must route maintainers to the completion checklist"
require_text "docs/a1-skill-completion-checklist.md" "## Invocation and Interaction Contract" "Completion checklist must cover invocation selection"
require_text "docs/a1-skill-completion-checklist.md" "## Self-Contained Runtime" "Completion checklist must cover self-contained installation"
require_text "docs/a1-skill-completion-checklist.md" "## Criteria-Based Evaluation" "Completion checklist must cover eval design"
require_text "docs/a1-skill-completion-checklist.md" "## Installed Semantic Release Gate" "Completion checklist must cover installed semantic runs"
require_text "docs/a1-skill-completion-checklist.md" "CONTEXT-MAP.md" "Completion checklist must require domain-boundary reassessment"
require_text "README.md" "## Contents" "README.md must keep a user-facing table of contents"
require_text "README.ru.md" "## Содержание" "README.ru.md must keep a user-facing table of contents"
require_text "README.md" "## Choose a skill" "README.md must help an unprepared user choose a skill"
require_text "README.ru.md" "## Какой навык выбрать" "README.ru.md must help an unprepared user choose a skill"
require_text "README.md" "<summary><strong>Marketing Context</strong></summary>" "README.md must explain Marketing Context in a user-facing disclosure"
require_text "README.md" "<summary><strong>Editor</strong></summary>" "README.md must explain Editor in a user-facing disclosure"
require_text "README.md" "<summary><strong>Editor in Chief</strong></summary>" "README.md must explain Editor in Chief in a user-facing disclosure"
require_text "README.md" "<summary><strong>Update</strong></summary>" "README.md must explain the updater in a user-facing disclosure"
require_text "README.ru.md" "<summary><strong>Маркетинговый контекст</strong></summary>" "README.ru.md must explain Marketing Context in a Russian disclosure"
require_text "README.ru.md" "<summary><strong>Редактор</strong></summary>" "README.ru.md must explain Editor in a Russian disclosure"
require_text "README.ru.md" "<summary><strong>Шеф-редактор</strong></summary>" "README.ru.md must explain Editor in Chief in a Russian disclosure"
require_text "README.ru.md" "<summary><strong>Обновление</strong></summary>" "README.ru.md must explain the updater in a Russian disclosure"
require_text "README.md" "## Update" "README.md must include user-facing update instructions"
require_text "README.ru.md" "## Обновление" "README.ru.md must include Russian update instructions"
require_text "README.md" "npx skills@latest add ztemerbekov/marketing-skills -g" "README.md must use the canonical global npx installer"
require_text "README.ru.md" "npx skills@latest add ztemerbekov/marketing-skills -g" "README.ru.md must use the canonical global npx installer"
require_text "README.md" "a1-setup-marketing-context" "README.md must keep the permanent migration path from the previous context skill name"
require_text "README.md" "a1-update-marketing-skills" "README.md must keep the permanent migration path from the previous updater name"
require_text "README.ru.md" "a1-setup-marketing-context" "README.ru.md must keep the permanent migration path from the previous context skill name"
require_text "README.ru.md" "a1-update-marketing-skills" "README.ru.md must keep the permanent migration path from the previous updater name"
require_text "README.md" "CONTRIBUTING.md" "README.md must end with a concise contributor entry point"
require_text "README.ru.md" "CONTRIBUTING.md" "README.ru.md must end with a concise contributor entry point"
require_text "README.md" "z.temerbekov@gmail.com" "README.md must include the feedback address"
require_text "README.ru.md" "z.temerbekov@gmail.com" "README.ru.md must include the feedback address"
require_text "README.md" "Invoke Editor in Chief by name" "README.md must document explicit Editor in Chief invocation"
require_text "README.md" "Editor suggests Editor in Chief but does not start it automatically" "README.md must document the automatic-interview boundary"
require_text "README.ru.md" "Шеф-редактор нужно запустить по имени" "README.ru.md must document explicit Editor in Chief invocation"
require_text "README.ru.md" "Редактор предложит запустить Шеф-редактор, но сам его не запустит" "README.ru.md must document the automatic-interview boundary"
forbid_text "README.md" "## Design Contract" "README.md must keep the design contract out of the user flow"
forbid_text "README.md" "## Architecture" "README.md must keep internal architecture out of the user flow"
forbid_text "README.md" "## Platform Support" "README.md must keep platform adapter internals out of the user flow"
forbid_text "README.md" "## Compatibility Philosophy" "README.md must keep compatibility policy out of the user flow"
forbid_text "README.md" "## Development" "README.md must keep maintainer workflow out of the user flow"
forbid_text "README.md" "### Completion and certification" "README.md must keep certification details out of the user flow"
forbid_text "README.ru.md" "## Контракт проектирования" "README.ru.md must keep the design contract out of the user flow"
forbid_text "README.ru.md" "## Архитектура" "README.ru.md must keep internal architecture out of the user flow"
forbid_text "README.ru.md" "## Поддержка платформ" "README.ru.md must keep platform adapter internals out of the user flow"
forbid_text "README.ru.md" "## Философия совместимости" "README.ru.md must keep compatibility policy out of the user flow"
forbid_text "README.ru.md" "## Разработка" "README.ru.md must keep maintainer workflow out of the user flow"
forbid_text "README.ru.md" "### Завершение и сертификация" "README.ru.md must keep certification details out of the user flow"
forbid_text "README.md" "skill-installer" "README.md must not document the legacy Codex installer"
forbid_text "README.ru.md" "skill-installer" "README.ru.md must not document the legacy Codex installer"
forbid_text "README.md" "/plugin marketplace" "README.md must not document the removed Claude plugin"
forbid_text "README.ru.md" "/plugin marketplace" "README.ru.md must not document the removed Claude plugin"
forbid_text "README.md" ".cursor/rules" "README.md must not document the removed Cursor adapter"
forbid_text "README.ru.md" ".cursor/rules" "README.ru.md must not document the removed Cursor adapter"
forbid_text "README.md" "cp -R skills/" "README.md must not require manual skill copying"
forbid_text "README.ru.md" "cp -R skills/" "README.ru.md must not require manual skill copying"
require_text "CONTRIBUTING.md" "docs/maintainers/README.md" "CONTRIBUTING.md must link the maintainer documentation index"
require_text "CONTRIBUTING.md" "node scripts/sync-readmes.js" "CONTRIBUTING.md must document README inventory synchronization"
require_text "CONTRIBUTING.md" "./scripts/validate-skills.sh" "CONTRIBUTING.md must document repository validation"
require_text "CONTRIBUTING.md" "docs/a1-skill-completion-checklist.md" "CONTRIBUTING.md must link the reusable completion checklist"
require_text "docs/maintainers/README.md" "../a1-skill-design-contract.md" "Maintainer index must link the canonical skill design contract"
require_text "docs/maintainers/README.md" "../a1-marketing-glossary.md" "Maintainer index must link the canonical marketing glossary"
require_text "docs/maintainers/README.md" "../a1-skill-completion-checklist.md" "Maintainer index must link the reusable completion checklist"
require_text "docs/maintainers/README.md" "../a1-editor-pilot-certification.md" "Maintainer index must link the pilot certification record"
require_text "docs/maintainers/README.md" "../a1-editor-pilot-run-2026-07-15.md" "Maintainer index must link the complete pilot run"
require_text "docs/maintainers/README.md" "../a1-update-certification.md" "Maintainer index must link the updater certification record"
require_text "scripts/sync-readmes.js" 'file: "README.ru.md"' "README synchronization must cover the Russian skill inventory"
require_text "skills/a1-marketing-context/agents/openai.yaml" 'display_name: "A1 Marketing Context"' "Marketing Context must expose the agreed display name"
require_text "skills/a1-update/agents/openai.yaml" 'display_name: "A1 Update"' "Update must expose the agreed display name"
require_text "skills/a1-editor/evals/README.md" "## Case Format" "Editor eval docs must define the case format"
require_text "skills/a1-editor/evals/README.md" "## Manual Run Protocol" "Editor eval docs must define the manual run protocol"
require_text "$certification_report" "## Certification Status" "Pilot certification must state its verdict"
require_text "$certification_report" "## Environment" "Pilot certification must record a comparable environment"
require_text "$certification_report" "## Judgment Rule" "Pilot certification must define criteria-based judgment"
require_text "$certification_report" "Output-contract check" "Pilot certification must require a separate output-contract check in every semantic judgment"
require_text "$certification_report" "## Case Results" "Pilot certification must inventory every eval case"
require_text "$certification_report" "## Remaining Limitations" "Pilot certification must disclose remaining limitations"
require_text "$certification_report" "## Finalization Rule" "Pilot certification must prevent a false pass"
require_text "$update_certification_report" "## Certification Status" "Updater certification must state its verdict"
require_text "$update_certification_report" 'Status: `PENDING`' "Updater certification must not claim a semantic pass before the installed suite"
require_text "$update_certification_report" "## Domain Boundary Decision" "Updater certification must record the domain-boundary reassessment"
require_text "$update_certification_report" "## Case Results" "Updater certification must inventory every eval case"
require_text "$update_certification_report" "## Remaining Limitations" "Updater certification must disclose remaining limitations"
require_text "$update_certification_report" "## Finalization Rule" "Updater certification must prevent a false pass"
require_text "skills/a1-editor/evals/case-template.md" "## Must Change" "Editor eval template must include Must Change criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Must Preserve" "Editor eval template must include Must Preserve criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Forbidden" "Editor eval template must include Forbidden criteria"
require_text "skills/a1-editor/evals/cases/editor-strengthen-001.md" 'категоричное `помогает быстрее`' "Strengthen regression must forbid removing source uncertainty from the speed outcome"
require_text "skills/a1-editor/evals/cases/editor-ambiguity-001.md" 'Ближайшее упоминание `Pro`' "Ambiguity regression must reject nearest-antecedent guessing"
require_text "skills/a1-editor/evals/cases/editor-information-style-001.md" "личный опыт остается отдельным абзацем перед списком" "Information Style regression must reject leaving personal context before the actionable list"
require_text "skills/a1-editor/evals/cases/editor-clarify-001.md" 'объединяет общение с клиентами' "Clarify regression must reject broadening vague process language into a capability"
require_text "skills/a1-editor/references/operations.md" "Do not turn vague process or interaction language into a broader categorical capability" "Clarify runtime must not broaden vague process language"
require_text "skills/a1-editor/evals/cases/editor-clarify-001.md" "допустимо оставить только конкретный факт" "Clarify regression must allow dropping unsupported source sentences entirely"
require_text "skills/a1-editor/references/operations.md" "Use the observable function as the entire rewrite if it is the only supported concrete content" "Clarify runtime must drop vague source sentences when one concrete fact is sufficient"
require_text "skills/a1-editor/references/information-style.md" "put the actionable sequence before supporting personal context" "Information Style runtime must foreground an actionable sequence before supporting personal context"
require_text "skills/a1-editor/SKILL.md" "references/editor-spine.md" "A1 Editor must use the invariant editor spine"
require_text "skills/a1-editor/SKILL.md" "safe strategy router" "A1 Editor invocation metadata must advertise safe strategy routing"
require_text "skills/a1-editor/SKILL.md" "references/strategy-boundary.md" "A1 Editor must route strategic requests before the editing spine"
require_text "skills/a1-editor/references/strategy-boundary.md" "## Strategic Requests" "Editor strategy boundary must identify strategic requests by meaning"
require_text "skills/a1-editor/references/strategy-boundary.md" 'explicitly invoke `a1-editor-in-chief`' "Editor strategy boundary must recommend explicit Editor in Chief invocation"
require_text "skills/a1-editor/references/editor-spine.md" "## 1. Determine Allowed Sources" "Editor spine must start by determining allowed sources"
require_text "skills/a1-editor/references/editor-spine.md" "## 2. Select the Operation" "Editor spine must select an operation"
require_text "skills/a1-editor/references/editor-spine.md" "## 3. Edit" "Editor spine must include editing"
require_text "skills/a1-editor/references/editor-spine.md" "## 4. Run Final QA" "Editor spine must include final QA"
require_text "skills/a1-editor/references/editor-spine.md" "## 5. Return the Result" "Editor spine must return the result"
require_text "skills/a1-editor/references/operations.md" "## Standard Edit" "Editor operations must define standard editing"
require_text "skills/a1-editor/references/operations.md" "## Shorten" "Editor operations must define shortening"
require_text "skills/a1-editor/references/operations.md" "## Clarify" "Editor operations must define clarification"
require_text "skills/a1-editor/references/operations.md" "## Strengthen" "Editor operations must define strengthening"
require_text "skills/a1-editor/references/operations.md" "## Restructure" "Editor operations must define restructuring"
require_text "skills/a1-editor/references/operations.md" "по «Пиши, сокращай»" "Information Style routing must retain the documented explicit markers"
require_text "skills/a1-editor/references/operations.md" "do not activate Information Style" "Generic editing intent must not activate Information Style"
require_text "skills/a1-editor/references/information-style.md" "## Constraint Overrides" "Information Style must define explicit constraint overrides"
require_text "skills/a1-editor/references/information-style.md" "## Markdown Integrity" "Information Style must protect Markdown integrity"
require_text "skills/a1-editor/references/information-style.md" "## Completion Criterion" "Information Style must define a checkable completion criterion"
require_text "skills/a1-editor-in-chief/SKILL.md" "## Invocation Contract" "Editor in Chief must require explicit invocation"
require_text "skills/a1-editor-in-chief/SKILL.md" "references/chief-gate.md" "Editor in Chief must load its self-contained hard gate"
require_text "skills/a1-editor-in-chief/SKILL.md" "references/editor-brief.md" "Editor in Chief must load its self-contained Editor Brief contract"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "### Reader" "Chief gate must require the reader"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "### Text Goal" "Chief gate must require the text goal"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "### Channel or Format" "Chief gate must require the channel or format"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "### Constraints" "Chief gate must require constraints"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "### Editing Operation" "Chief gate must require the editing operation"
require_text "skills/a1-update/SKILL.md" "ztemerbekov/marketing-skills" "Update skill must pin its source boundary"
require_text "skills/a1-update/SKILL.md" "without asking and without creating a backup" "Update skill must overwrite existing installations without a backup prompt"
require_text "skills/a1-update/SKILL.md" "Present all newly available skills in one confirmation" "Update skill must group the new-skill confirmation"
require_text "skills/a1-update/SKILL.md" "automatically remove tracked skills missing from upstream" "Update skill must remove upstream-deleted skills without confirmation"
require_text "skills/a1-update/SKILL.md" "references/npx-workflow.md" "Update skill must route to its source-scoped npx workflow"
require_text "skills/a1-update/SKILL.md" "references/runtime-prerequisites.md" "Update skill must route missing Node.js to its prerequisite workflow"
require_text "skills/a1-update/references/npx-workflow.md" 'Never use `--all`' "Update workflow must forbid unscoped removal"
require_text "skills/a1-update/references/npx-workflow.md" "node scripts/prune-lock.mjs" "Update workflow must clean source-owned stale lock entries"
require_text "skills/a1-update/SKILL.md" "Do not search other project directories" "Update workflow must stay within global and current-project scopes"
require_text "skills/a1-update/references/runtime-prerequisites.md" "Do not bootstrap Homebrew" "Prerequisite workflow must not install another package manager"

for eval_case in "${editor_eval_cases[@]}" "${chief_eval_cases[@]}" "${update_eval_cases[@]}"; do
  require_text "$eval_case" "## User Instruction" "Editor eval case must include the exact user instruction"
  require_text "$eval_case" "## Input" "Editor eval case must include the complete input"
  require_text "$eval_case" "## Must Change" "Editor eval case must include Must Change criteria"
  require_text "$eval_case" "## Must Preserve" "Editor eval case must include Must Preserve criteria"
  require_text "$eval_case" "## Forbidden" "Editor eval case must include Forbidden criteria"

  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  if [[ -z "$eval_id" ]]; then
    echo "FAIL $eval_case"
    echo "  Eval case must declare a stable ID"
    issues=$((issues + 1))
  else
    eval_filename="${eval_case##*/}"
    expected_eval_filename="${eval_id}.md"
    if [[ "$eval_filename" != "$expected_eval_filename" ]]; then
      echo "FAIL $eval_case"
      echo "  Eval filename must match its ID: expected $expected_eval_filename"
      issues=$((issues + 1))
    fi
  fi
done

for eval_case in "${editor_eval_cases[@]}" "${chief_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  if [[ -n "$eval_id" ]]; then
    require_text "$certification_report" "$eval_id" "Pilot certification must include eval case $eval_id"
  fi
done

for eval_case in "${update_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  if [[ -n "$eval_id" ]]; then
    require_text "$update_certification_report" "$eval_id" "Updater certification must include eval case $eval_id"
  fi
done

echo

if [[ ! -d "$SKILLS_DIR" ]]; then
  echo "Missing skills directory: $SKILLS_DIR" >&2
  exit 1
fi

echo "Validating skills in $SKILLS_DIR"
echo

for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_dir")"
  skill_file="$skill_dir/SKILL.md"
  skill_errors=()
  skill_warnings=()

  if [[ ! -f "$skill_file" ]]; then
    echo "FAIL $skill_name"
    echo "  Missing SKILL.md"
    issues=$((issues + 1))
    continue
  fi

  frontmatter="$(awk '/^---$/{count++; next} count==1' "$skill_file")"

  if [[ -z "$frontmatter" ]]; then
    skill_errors+=("Missing YAML frontmatter")
  fi

  name="$(printf '%s\n' "$frontmatter" | awk -F': *' '$1=="name"{print $2; exit}' | tr -d '"' | tr -d "'")"
  description_line="$(printf '%s\n' "$frontmatter" | awk -F': *' '$1=="description"{print substr($0, index($0,$2)); exit}')"
  description="$(printf '%s' "$description_line" | sed 's/^"//' | sed 's/"$//' | sed "s/^'//" | sed "s/'$//")"

  if [[ -z "$name" ]]; then
    skill_errors+=("Missing name")
  elif [[ "$name" != "$skill_name" ]]; then
    skill_errors+=("Name mismatch: directory '$skill_name' but frontmatter '$name'")
  elif ! [[ "$name" =~ ^[a-z0-9]([a-z0-9-]{0,62}[a-z0-9])?$ ]]; then
    skill_errors+=("Invalid name '$name': use lowercase letters, digits, and hyphens, 1-64 chars")
  elif [[ "$name" == *"--"* ]]; then
    skill_errors+=("Invalid name '$name': consecutive hyphens are not allowed")
  fi

  if [[ -z "$description" ]]; then
    skill_errors+=("Missing description")
  elif [[ ${#description} -gt 1024 ]]; then
    skill_errors+=("Description too long: ${#description} chars, max 1024")
  elif ! printf '%s\n' "$description" | grep -Eiq "use|when|user|wants|explicitly|mentions"; then
    skill_warnings+=("Description may lack trigger language")
  fi

  line_count="$(wc -l < "$skill_file" | tr -d ' ')"
  if [[ "$line_count" -gt 500 ]]; then
    skill_warnings+=("SKILL.md has $line_count lines; keep under 500 and move details to references/")
  fi

  language_policy="Detect the user's language and work in that language by default. If the input text and user instruction use different languages, preserve the input text language for rewritten copy and use the instruction language for explanations unless the user asks otherwise."
  if ! grep -q '^## Language$' "$skill_file"; then
    skill_errors+=("Missing required '## Language' section")
  elif ! grep -Fq "$language_policy" "$skill_file"; then
    skill_errors+=("Language section must include the required multilingual policy")
  fi

  while IFS= read -r key; do
    [[ -z "$key" ]] && continue
    case "$key" in
      name|description|license|compatibility|metadata|allowed-tools|disable-model-invocation)
        ;;
      version)
        skill_errors+=("Top-level version is not allowed; put it under metadata")
        ;;
      *)
        if [[ "$key" =~ ^[[:space:]] ]]; then
          continue
        fi
        skill_warnings+=("Unexpected frontmatter field '$key'")
        ;;
    esac
  done < <(printf '%s\n' "$frontmatter" | awk -F: '/^[A-Za-z0-9_-]+:/{print $1}')

  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    [[ "$line" =~ ^[[:space:]] ]] && continue
    key="${line%%:*}"
    value="${line#*:}"
    value="${value#"${value%%[![:space:]]*}"}"
    if [[ "$value" != \"* && "$value" != \'* && "$value" == *": "* ]]; then
      skill_errors+=("Frontmatter field '$key' contains an unquoted ': ' sequence; quote the value for valid YAML")
    fi
  done < <(printf '%s\n' "$frontmatter" | grep -E '^[A-Za-z0-9_-]+: .+')

  if [[ ${#skill_errors[@]} -gt 0 ]]; then
    echo "FAIL $skill_name"
    for error in "${skill_errors[@]}"; do
      echo "  Error: $error"
    done
    for warning in "${skill_warnings[@]}"; do
      echo "  Warning: $warning"
    done
    issues=$((issues + 1))
  elif [[ ${#skill_warnings[@]} -gt 0 ]]; then
    echo "WARN $skill_name"
    for warning in "${skill_warnings[@]}"; do
      echo "  Warning: $warning"
    done
    warnings=$((warnings + 1))
  else
    echo "PASS $skill_name"
    passed=$((passed + 1))
  fi
done

echo
echo "Summary: $passed skills passed, $artifacts_passed contract artifacts passed, $warnings warnings, $issues failures"

if [[ "$issues" -gt 0 ]]; then
  exit 1
fi
