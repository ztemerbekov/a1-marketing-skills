#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="skills"
issues=0
warnings=0
passed=0
artifacts_passed=0
certification_report="docs/a1-editor-pilot-certification.md"
editor_localization_report="docs/a1-editor-localization-run-2026-07-16.md"
chief_run_report="docs/a1-editor-in-chief-run-2026-07-16.md"
chief_localization_report="docs/a1-editor-in-chief-localization-run-2026-07-17.md"
context_run_report="docs/a1-marketing-context-run-2026-07-16.md"
integrated_run_report="docs/a1-integrated-release-run-2026-07-16.md"
chief_completion_report="docs/a1-editor-in-chief-completion-2026-07-16.md"
context_completion_report="docs/a1-marketing-context-completion-2026-07-16.md"
update_certification_report="docs/a1-update-certification.md"
update_managed_set_report="docs/a1-update-managed-set-run-2026-07-18.md"
update_recovery_report="docs/a1-update-recovery-run-2026-07-18.md"

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

editor_localization_eval_cases=(
  "skills/a1-editor/evals/cases/editor-language-010.md"
  "skills/a1-editor/evals/cases/editor-language-011.md"
  "skills/a1-editor/evals/cases/editor-language-012.md"
  "skills/a1-editor/evals/cases/editor-language-013.md"
)

chief_eval_cases=(
  "skills/a1-editor-in-chief/evals/cases/chief-dependency-001.md"
  "skills/a1-editor-in-chief/evals/cases/chief-explicit-002.md"
  "skills/a1-editor-in-chief/evals/cases/chief-explicit-003.md"
  "skills/a1-editor-in-chief/evals/cases/chief-scope-mixed-004.md"
  "skills/a1-editor-in-chief/evals/cases/chief-scope-completed-input-005.md"
  "skills/a1-editor-in-chief/evals/cases/chief-context-filled-006.md"
  "skills/a1-editor-in-chief/evals/cases/chief-context-incomplete-007.md"
  "skills/a1-editor-in-chief/evals/cases/chief-operation-selection-008.md"
  "skills/a1-editor-in-chief/evals/cases/chief-editorial-boundary-009.md"
  "skills/a1-editor-in-chief/evals/cases/chief-source-conflict-010.md"
  "skills/a1-editor-in-chief/evals/cases/chief-corrective-review-011.md"
  "skills/a1-editor-in-chief/evals/cases/chief-language-012.md"
)

chief_localization_eval_cases=(
  "skills/a1-editor-in-chief/evals/cases/chief-language-014.md"
  "skills/a1-editor-in-chief/evals/cases/chief-language-015.md"
  "skills/a1-editor-in-chief/evals/cases/chief-language-016.md"
  "skills/a1-editor-in-chief/evals/cases/chief-language-017.md"
)

chief_integration_eval_cases=(
  "skills/a1-editor/evals/cases/editor-strategy-route-001.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-002.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-003.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-004.md"
  "skills/a1-editor/evals/cases/editor-strategy-route-005.md"
  "skills/a1-editor/evals/cases/editor-strategy-boundary-008.md"
  "skills/a1-editor/evals/cases/editor-chief-handoff-009.md"
)

context_eval_cases=(
  "skills/a1-marketing-context/evals/cases/context-natural-invocation-001.md"
  "skills/a1-marketing-context/evals/cases/context-passive-noop-002.md"
  "skills/a1-marketing-context/evals/cases/context-direct-update-003.md"
  "skills/a1-marketing-context/evals/cases/context-interview-explicit-004.md"
  "skills/a1-marketing-context/evals/cases/context-interview-limit-005.md"
  "skills/a1-marketing-context/evals/cases/context-interview-stop-006.md"
  "skills/a1-marketing-context/evals/cases/context-sparse-repo-007.md"
  "skills/a1-marketing-context/evals/cases/context-partial-file-008.md"
  "skills/a1-marketing-context/evals/cases/context-no-hypotheses-009.md"
  "skills/a1-marketing-context/evals/cases/context-merge-preservation-010.md"
  "skills/a1-marketing-context/evals/cases/context-conflict-011.md"
  "skills/a1-marketing-context/evals/cases/context-repository-isolation-012.md"
  "skills/a1-marketing-context/evals/cases/context-protected-facts-013.md"
  "skills/a1-marketing-context/evals/cases/context-output-shape-014.md"
  "skills/a1-marketing-context/evals/cases/context-language-015.md"
  "skills/a1-marketing-context/evals/cases/context-mixed-hypothesis-016.md"
  "skills/a1-marketing-context/evals/cases/context-legacy-migration-021.md"
  "skills/a1-marketing-context/evals/cases/context-interview-empty-stop-022.md"
)

context_consumer_eval_cases=(
  "skills/a1-editor/evals/cases/context-editor-default-override-017.md"
  "skills/a1-editor/evals/cases/context-editor-protected-conflict-018.md"
  "skills/a1-editor-in-chief/evals/cases/context-chief-default-override-019.md"
  "skills/a1-editor-in-chief/evals/cases/context-chief-protected-conflict-020.md"
)

release_chief_eval_cases=(
  "skills/a1-editor-in-chief/evals/cases/chief-context-isolation-013.md"
)

update_focused_eval_cases=(
  "skills/a1-update/evals/cases/update-existing-001.md"
  "skills/a1-update/evals/cases/update-managed-set-002.md"
  "skills/a1-update/evals/cases/update-deleted-001.md"
  "skills/a1-update/evals/cases/update-new-001.md"
  "skills/a1-update/evals/cases/update-explain-001.md"
  "skills/a1-update/evals/cases/update-scope-out-003.md"
  "skills/a1-update/evals/cases/update-scope-mixed-004.md"
  "skills/a1-update/evals/cases/update-scope-completed-input-005.md"
)

update_recovery_eval_cases=(
  "skills/a1-update/evals/cases/update-preflight-failure-006.md"
  "skills/a1-update/evals/cases/update-unknown-client-recovery-007.md"
  "skills/a1-update/evals/cases/update-prerequisite-001.md"
  "skills/a1-update/evals/cases/update-prerequisite-refusal-008.md"
  "skills/a1-update/evals/cases/update-mid-write-failure-009.md"
  "skills/a1-update/evals/cases/update-first-write-failure-010.md"
  "skills/a1-update/evals/cases/update-upstream-failure-001.md"
  "skills/a1-update/evals/cases/update-unrelated-project-lock-011.md"
  "skills/a1-update/evals/cases/update-bootstrap-failure-012.md"
  "skills/a1-update/evals/cases/update-reload-failure-013.md"
  "skills/a1-update/evals/cases/update-restarted-preflight-failure-014.md"
  "skills/a1-update/evals/cases/update-still-unknown-client-015.md"
)

update_eval_cases=(
  "${update_focused_eval_cases[@]}"
  "${update_recovery_eval_cases[@]}"
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
  "$editor_localization_report"
  "$chief_run_report"
  "$chief_localization_report"
  "$context_run_report"
  "$integrated_run_report"
  "$chief_completion_report"
  "$context_completion_report"
  "$update_certification_report"
  "$update_managed_set_report"
  "$update_recovery_report"
  "skills/a1-marketing-context/evals/README.md"
  "skills/a1-marketing-context/evals/case-template.md"
  "skills/a1-marketing-context/references/context-spine.md"
  "skills/a1-marketing-context/references/invocation-and-scope.md"
  "skills/a1-marketing-context/references/source-policy.md"
  "skills/a1-marketing-context/references/context-schema.md"
  "skills/a1-marketing-context/references/merge-and-conflicts.md"
  "skills/a1-marketing-context/references/interview.md"
  "skills/a1-editor-in-chief/evals/README.md"
  "skills/a1-editor-in-chief/evals/case-template.md"
  "skills/a1-editor-in-chief/references/chief-scope.md"
  "skills/a1-editor-in-chief/references/chief-spine.md"
  "skills/a1-editor-in-chief/references/source-resolution.md"
  "skills/a1-editor-in-chief/references/chief-gate.md"
  "skills/a1-editor-in-chief/references/editorial-diagnosis.md"
  "skills/a1-editor-in-chief/references/editor-brief.md"
  "skills/a1-editor-in-chief/references/chief-review.md"
  "skills/a1-editor/evals/cases/editor-chief-handoff-009.md"
  "skills/a1-update/SKILL.md"
  "skills/a1-update/agents/openai.yaml"
  "skills/a1-update/references/npx-workflow.md"
  "skills/a1-update/references/runtime-prerequisites.md"
  "skills/a1-update/scripts/prune-lock.mjs"
  "skills/a1-update/evals/README.md"
  "skills/a1-update/evals/case-template.md"
  "skills/a1-marketing-context/agents/openai.yaml"
  "${editor_eval_cases[@]}"
  "${editor_localization_eval_cases[@]}"
  "${chief_eval_cases[@]}"
  "${chief_localization_eval_cases[@]}"
  "${context_eval_cases[@]}"
  "${context_consumer_eval_cases[@]}"
  "${release_chief_eval_cases[@]}"
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
require_text "docs/a1-skill-design-contract.md" "### Scope before helpfulness" "The design contract must classify scope before other work"
require_text "docs/a1-skill-design-contract.md" "Reject a mixed-job request before doing either part" "The design contract must forbid partial mixed-job execution"
require_text "docs/a1-skill-design-contract.md" "accept a completed external input" "The design contract must distinguish producing an artifact from accepting it"
require_text "docs/a1-skill-design-contract.md" "distinguish overridable defaults from protected inputs" "The design contract must define marketing-context consumption semantics"
require_text "docs/a1-marketing-glossary.md" "Context default" "The glossary must define overridable context defaults"
require_text "docs/a1-marketing-glossary.md" "Protected context input" "The glossary must define protected context inputs"
require_text "docs/a1-skill-completion-checklist.md" "## Invocation and Interaction Contract" "Completion checklist must cover invocation selection"
require_text "docs/a1-skill-completion-checklist.md" "completed external inputs" "Completion checklist must require allowed external inputs"
require_text "docs/a1-skill-completion-checklist.md" "Declare mixed-job behavior" "Completion checklist must require mixed-request behavior"
require_text "docs/a1-skill-completion-checklist.md" "## Self-Contained Runtime" "Completion checklist must cover self-contained installation"
require_text "docs/a1-skill-completion-checklist.md" "## Criteria-Based Evaluation" "Completion checklist must cover eval design"
require_text "docs/a1-skill-completion-checklist.md" "## Installed Semantic Release Gate" "Completion checklist must cover installed semantic runs"
require_text "docs/a1-skill-completion-checklist.md" "explicitly accepted constrained fallback" "Completion checklist must define the policy-blocked semantic fallback"
require_text "docs/a1-skill-completion-checklist.md" "Structural validation" "Completion checklist must keep structural checks distinct from semantic evidence"
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
require_text "README.md" 'explicitly invoke `a1-editor-in-chief`' "README.md must document explicit Editor in Chief invocation"
require_text "README.md" "does not start the chief workflow automatically" "README.md must document the automatic-chief boundary"
require_text "README.ru.md" 'явно запустить `a1-editor-in-chief`' "README.ru.md must document explicit Editor in Chief invocation"
require_text "README.ru.md" "не запускает процесс шеф-редактора автоматически" "README.ru.md must document the automatic-chief boundary"
require_text "README.md" "Set up marketing context from confirmed information in this repository" "README.md must include a natural context setup request"
require_text "README.md" "there is no global or private profile" "README.md must explain repository-local context isolation"
require_text "README.md" "never causes a write" "README.md must explain passive no-op behavior"
require_text "README.ru.md" "Настрой маркетинговый контекст из подтверждённых сведений" "README.ru.md must include a natural context setup request"
require_text "README.ru.md" "глобального или приватного профиля нет" "README.ru.md must explain repository-local context isolation"
require_text "README.ru.md" "не вызывают записи" "README.ru.md must explain passive no-op behavior"
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
require_text "docs/maintainers/README.md" "../a1-editor-localization-run-2026-07-16.md" "Maintainer index must link the Editor localization run"
require_text "docs/maintainers/README.md" "../a1-editor-in-chief-localization-run-2026-07-17.md" "Maintainer index must link the Chief localization run"
require_text "docs/maintainers/README.md" "../a1-marketing-context-run-2026-07-16.md" "Maintainer index must link the Marketing Context run"
require_text "docs/maintainers/README.md" "../a1-integrated-release-run-2026-07-16.md" "Maintainer index must link the integrated release run"
require_text "docs/maintainers/README.md" "../a1-editor-in-chief-completion-2026-07-16.md" "Maintainer index must link the Chief completion checklist"
require_text "docs/maintainers/README.md" "../a1-marketing-context-completion-2026-07-16.md" "Maintainer index must link the Context completion checklist"
require_text "docs/maintainers/README.md" "../a1-update-certification.md" "Maintainer index must link the updater certification record"
require_text "docs/maintainers/README.md" "../a1-update-managed-set-run-2026-07-18.md" "Maintainer index must link the updater managed-set run"
require_text "scripts/sync-readmes.js" 'file: "README.ru.md"' "README synchronization must cover the Russian skill inventory"
require_text "skills/a1-marketing-context/SKILL.md" "## Invocation Contract" "Marketing Context must define explicit natural invocation"
require_text "skills/a1-marketing-context/SKILL.md" "references/context-spine.md" "Marketing Context must use its invariant spine"
require_text "skills/a1-marketing-context/SKILL.md" 'Write only `.agents/marketing-context.md`' "Marketing Context must have one repository-local write target"
require_text "skills/a1-marketing-context/SKILL.md" "another skill reporting missing context is not write intent" "Marketing Context must forbid passive missing-context writes"
require_text "skills/a1-marketing-context/SKILL.md" "Do not create or maintain global state" "Marketing Context must forbid global and private profiles"
require_text "skills/a1-marketing-context/references/context-spine.md" "## 1. Classify Invocation and Scope" "Context spine must classify invocation and scope first"
require_text "skills/a1-marketing-context/references/invocation-and-scope.md" "## Passive No-op Boundary" "Context invocation must define passive no-op behavior"
require_text "skills/a1-marketing-context/references/invocation-and-scope.md" "## Explicit Interview Intent" "Context interview must require explicit intent"
require_text "skills/a1-marketing-context/references/invocation-and-scope.md" "Mixed-job behavior" "Context scope must reject mixed jobs"
require_text "skills/a1-marketing-context/references/source-policy.md" "## Hypothesis Exclusion" "Context source policy must exclude hypotheses"
require_text "skills/a1-marketing-context/references/source-policy.md" "finds no confirmed information at all" "Sparse Auto-draft must ask once instead of creating an empty file"
require_text "skills/a1-marketing-context/references/context-schema.md" "## Partial Files" "Context schema must accept partial files"
require_text "skills/a1-marketing-context/references/context-schema.md" "Overridable defaults" "Context schema must define defaults"
require_text "skills/a1-marketing-context/references/context-schema.md" "Protected inputs" "Context schema must define protected inputs"
require_text "skills/a1-marketing-context/references/context-schema.md" "Protected inputs in Product Facts, Claims and Evidence, and Explicit Prohibitions" "Generated context must identify its protected sections"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "change only those fields" "Direct context updates must be field-bounded"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "add confirmed missing information without replacing" "Auto-draft must preserve existing content"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "make no file or directory change" "Material conflicts must stop context writes"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "do not add a mandatory preview" "Explicit safe context requests must not require preview"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "## Legacy Migration" "Context setup must handle repository-local legacy contexts safely"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "remove the authorized legacy source" "Legacy migration must leave one public context"
require_text "skills/a1-marketing-context/references/merge-and-conflicts.md" "name the legacy headings actually retained" "Migrated contexts must remain self-describing"
require_text "skills/a1-marketing-context/references/interview.md" "questions will arrive one at a time" "Interview must explain one-at-a-time questions"
require_text "skills/a1-marketing-context/references/interview.md" "Ask at most seven questions" "Interview must cap one pass at seven questions"
require_text "skills/a1-marketing-context/references/interview.md" "Save the confirmed answer immediately" "Interview must save partial progress incrementally"
require_text "skills/a1-marketing-context/references/interview.md" "new complete pass through the context spine" "Interview answers must preserve the invariant stage order"
require_text "skills/a1-marketing-context/references/context-spine.md" "explicit empty no-write patch" "Interview stop passes must traverse the invariant spine without a write"
require_text "skills/a1-marketing-context/references/context-spine.md" "empty-session stop receives its short zero-write close response" "Stage 7 must complete an immediate stop without nonexistent state"
require_text "skills/a1-marketing-context/references/interview.md" "No marketing context was created because no confirmed answers were saved" "Empty-session stop must have a zero-write close response"
require_text "skills/a1-marketing-context/SKILL.md" "sections safely saved across that current session" "Interview session confirmation must allow accumulated saved sections"
require_text "skills/a1-editor/references/source-boundary.md" "Audience Defaults" "Editor must recognize overridable context defaults"
require_text "skills/a1-editor/references/source-boundary.md" "Current instructions do not silently override protected inputs" "Editor must preserve or surface protected context conflicts"
require_text "skills/a1-editor-in-chief/references/source-resolution.md" "override repository context defaults" "Chief must allow task-specific default overrides"
require_text "skills/a1-editor-in-chief/references/source-resolution.md" "Current material must not silently override them" "Chief must gate protected context conflicts"
require_text "skills/a1-editor-in-chief/references/source-resolution.md" "Never read a global marketing profile, a last-used pointer, or context from another" "Chief context resolution must stay in the current repository"
require_text "skills/a1-editor-in-chief/evals/README.md" "chief-context-isolation-013.md" "Chief suite must cover global and previous-project isolation"
require_text "skills/a1-editor-in-chief/evals/cases/chief-context-isolation-013.md" "Last-used sentinel" "Chief isolation regression must define an observable previous-project sentinel"
require_text "$integrated_run_report" "OUTSIDE-CURRENT-REPOSITORY CONTEXT ACCESSES -> 0" "Integrated isolation evidence must record zero outside-repository context discovery"
require_text "skills/a1-marketing-context/evals/README.md" "## Manual Run Protocol" "Context evals must define the semantic protocol"
require_text "skills/a1-marketing-context/evals/README.md" "one combined digest over every installed candidate directory" "Context integration protocol must pin every runtime candidate"
require_text "skills/a1-editor/evals/README.md" "context-editor-default-override-017.md" "Editor must own its context-default integration regression"
require_text "skills/a1-editor/evals/README.md" "context-editor-protected-conflict-018.md" "Editor must own its protected-context integration regression"
require_text "skills/a1-editor/evals/README.md" "editor-language-010.md" "Editor suite must cover Russian localized response scaffolding"
require_text "skills/a1-editor/evals/README.md" "editor-language-011.md" "Editor suite must cover English scaffolding with Russian copy"
require_text "skills/a1-editor/evals/README.md" "editor-language-012.md" "Editor suite must preserve the edited-text-only override"
require_text "skills/a1-editor/evals/README.md" "editor-language-013.md" "Editor suite must cover localization beyond English and Russian"
require_text "skills/a1-editor-in-chief/evals/README.md" "context-chief-default-override-019.md" "Chief must own its context-default integration regression"
require_text "skills/a1-editor-in-chief/evals/README.md" "context-chief-protected-conflict-020.md" "Chief must own its protected-context integration regression"
require_text "skills/a1-editor-in-chief/evals/README.md" "chief-language-014.md" "Chief suite must cover Russian localized response scaffolding"
require_text "skills/a1-editor-in-chief/evals/README.md" "chief-language-015.md" "Chief suite must cover English scaffolding with Russian copy"
require_text "skills/a1-editor-in-chief/evals/README.md" "chief-language-016.md" "Chief suite must preserve the final-text-only override"
require_text "skills/a1-editor-in-chief/evals/README.md" "chief-language-017.md" "Chief suite must cover localization beyond English and Russian"
require_text "$context_run_report" 'Candidate source: current `skills/a1-marketing-context/`, `skills/a1-editor/`, and `skills/a1-editor-in-chief/`' "Context integration record must identify every runtime candidate"
require_text "$context_run_report" "Combined candidate directory digest" "Context integration record must use a combined candidate digest"
require_text "$context_run_report" "After Answer 6, write:" "Seven-question evidence must record every intermediate write and output"
require_text "$context_run_report" "The stop pass traversed the explicit empty patch" "Interview stop evidence must record the final no-write pass"
require_text "$context_run_report" 'Standards and spec review: `PASS`' "Context release record must capture completed independent review"
require_text "$context_run_report" 'Semantic release gate: `PASS`' "Issue #9 semantic record must state a passing verdict"
require_text "$context_run_report" 'Human reviewer: `ztemerbekov`' "Issue #9 semantic record must capture human judgment"
require_text "skills/a1-marketing-context/evals/cases/context-interview-empty-stop-022.md" "Do not link" "Immediate-stop regression must forbid a nonexistent context link"
require_text "skills/a1-marketing-context/evals/cases/context-natural-invocation-001.md" 'Scope Scenario: `In scope`' "Context evals must cover in-scope behavior"
require_text "skills/a1-marketing-context/evals/cases/context-no-hypotheses-009.md" 'Scope Scenario: `Out of scope`' "Context evals must cover out-of-scope behavior"
require_text "skills/a1-marketing-context/evals/cases/context-mixed-hypothesis-016.md" 'Scope Scenario: `Mixed job`' "Context evals must cover mixed-job behavior"
require_text "skills/a1-marketing-context/evals/cases/context-direct-update-003.md" 'Scope Scenario: `Completed external input`' "Context evals must cover completed external input"
require_text "skills/a1-marketing-context/agents/openai.yaml" 'display_name: "A1 Marketing Context"' "Marketing Context must expose the agreed display name"
require_text "skills/a1-update/agents/openai.yaml" 'display_name: "A1 Update"' "Update must expose the agreed display name"
require_text "skills/a1-editor/evals/README.md" "## Case Format" "Editor eval docs must define the case format"
require_text "skills/a1-editor/evals/README.md" "## Manual Run Protocol" "Editor eval docs must define the manual run protocol"
require_text "skills/a1-editor/evals/README.md" "explicitly accepted constrained fallback" "Editor eval docs must define the policy-blocked fallback"
require_text "docs/a1-scope-boundary-run-2026-07-16.md" 'Semantic release gate: `PASS`' "Issue #7 semantic record must state a passing verdict"
require_text "docs/a1-scope-boundary-run-2026-07-16.md" 'Human reviewer: `ztemerbekov`' "Issue #7 semantic record must capture human judgment"
require_text "$chief_run_report" 'Semantic release gate: `PASS`' "Issue #8 semantic record must state a passing verdict"
require_text "$chief_run_report" 'Human reviewer: `ztemerbekov`' "Issue #8 semantic record must capture human judgment"
require_text "$certification_report" "## Certification Status" "Pilot certification must state its verdict"
require_text "$certification_report" "## Environment" "Pilot certification must record a comparable environment"
require_text "$certification_report" "## Judgment Rule" "Pilot certification must define criteria-based judgment"
require_text "$certification_report" "Output-contract check" "Pilot certification must require a separate output-contract check in every semantic judgment"
require_text "$certification_report" "## Case Results" "Pilot certification must inventory every eval case"
require_text "$certification_report" "## Remaining Limitations" "Pilot certification must disclose remaining limitations"
require_text "$certification_report" "## Finalization Rule" "Pilot certification must prevent a false pass"
require_text "$update_certification_report" "## Certification Status" "Updater certification must state its verdict"
require_text "$update_certification_report" 'Status: `PASS`' "Updater certification must record the completed installed semantic suite"
require_text "$update_certification_report" "## Domain Boundary Decision" "Updater certification must record the domain-boundary reassessment"
require_text "$update_certification_report" "## Case Results" "Updater certification must inventory every eval case"
require_text "$update_certification_report" "## Remaining Limitations" "Updater certification must disclose remaining limitations"
require_text "$update_certification_report" "## Finalization Rule" "Updater certification must prevent a false pass"
require_text "skills/a1-editor/evals/case-template.md" "## Must Change" "Editor eval template must include Must Change criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Must Preserve" "Editor eval template must include Must Preserve criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Forbidden" "Editor eval template must include Forbidden criteria"
require_text "skills/a1-editor/evals/case-template.md" "Scope Scenario" "Editor eval template must classify scope-boundary scenarios"
require_text "skills/a1-editor/evals/case-template.md" "each specific partial output" "Editor eval template must forbid explicit partial outputs"
require_text "skills/a1-editor/evals/cases/editor-strengthen-001.md" 'категоричное `помогает быстрее`' "Strengthen regression must forbid removing source uncertainty from the speed outcome"
require_text "skills/a1-editor/evals/cases/editor-ambiguity-001.md" 'Ближайшее упоминание `Pro`' "Ambiguity regression must reject nearest-antecedent guessing"
require_text "skills/a1-editor/evals/cases/editor-information-style-001.md" "личный опыт остается отдельным абзацем перед списком" "Information Style regression must reject leaving personal context before the actionable list"
require_text "skills/a1-editor/evals/cases/editor-clarify-001.md" 'объединяет общение с клиентами' "Clarify regression must reject broadening vague process language into a capability"
require_text "skills/a1-editor/references/operations.md" "Do not turn vague process or interaction language into a broader categorical capability" "Clarify runtime must not broaden vague process language"
require_text "skills/a1-editor/evals/cases/editor-clarify-001.md" "допустимо оставить только конкретный факт" "Clarify regression must allow dropping unsupported source sentences entirely"
require_text "skills/a1-editor/references/operations.md" "Use the observable function as the entire rewrite if it is the only supported concrete content" "Clarify runtime must drop vague source sentences when one concrete fact is sufficient"
require_text "skills/a1-editor/references/information-style.md" "put the actionable sequence before supporting personal context" "Information Style runtime must foreground an actionable sequence before supporting personal context"
require_text "skills/a1-editor/SKILL.md" "references/editor-spine.md" "A1 Editor must use the invariant editor spine"
require_text "skills/a1-editor/SKILL.md" "safe strategy boundary" "A1 Editor invocation metadata must advertise its strategy boundary"
require_text "skills/a1-editor/SKILL.md" "references/strategy-boundary.md" "A1 Editor must route strategic requests before the editing spine"
require_text "skills/a1-editor/references/strategy-boundary.md" "## Strategic Requests" "Editor strategy boundary must identify strategic requests by meaning"
require_text "skills/a1-editor/references/strategy-boundary.md" "## Completed-Strategy Chief Handoff" "Editor boundary must distinguish a bounded Chief handoff from strategy creation"
require_text "skills/a1-editor/references/strategy-boundary.md" "Do not recommend Chief as a way to create" "Editor boundary must not route general strategy creation to Chief"
require_text "skills/a1-editor/references/strategy-boundary.md" 'explicitly invoke `a1-editor-in-chief`' "Editor boundary must recommend explicit Chief invocation for a completed-strategy handoff"
require_text "skills/a1-editor/references/strategy-boundary.md" "do not perform either part" "Editor strategy boundary must reject mixed jobs before partial execution"
require_text "skills/a1-editor/evals/cases/editor-strategy-route-001.md" 'Scope Scenario: `Out of scope`' "Editor evals must cover an out-of-scope request"
require_text "skills/a1-editor/evals/cases/editor-strategy-boundary-006.md" 'Scope Scenario: `In scope`' "Editor evals must cover an in-scope request"
require_text "skills/a1-editor/evals/cases/editor-strategy-boundary-007.md" 'Scope Scenario: `Completed external input`' "Editor evals must cover a completed external input"
require_text "skills/a1-editor/evals/cases/editor-strategy-boundary-008.md" 'Scope Scenario: `Mixed job`' "Editor evals must cover a mixed-job request"
require_text "skills/a1-editor/evals/cases/editor-strategy-boundary-008.md" "Не возвращать очищенную, сокращенную" "Mixed-job regression must forbid partial editing output"
require_text "skills/a1-editor/evals/cases/editor-strategy-boundary-008.md" 'Не рекомендовать `a1-editor-in-chief` как способ создать позиционирование' "Mixed-job regression must forbid routing strategy creation to Chief"
require_text "skills/a1-editor/evals/cases/editor-chief-handoff-009.md" 'Scope Scenario: `Completed external input`' "Editor integration eval must cover a completed-strategy Chief handoff"
require_text "skills/a1-editor/evals/cases/editor-chief-handoff-009.md" "не переписывать email" "Editor integration eval must forbid direct execution during Chief handoff"
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
require_text "skills/a1-editor-in-chief/SKILL.md" "references/chief-spine.md" "Editor in Chief must use its invariant spine"
require_text "skills/a1-editor-in-chief/SKILL.md" "Do not inspect or copy Editor's internal references" "Chief must not deep-link or duplicate Editor canon"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 1. Classify Scope" "Chief spine must classify scope first"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 2. Verify Editor Dependency" "Chief spine must verify Editor after scope"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 3. Resolve Sources" "Chief spine must resolve source precedence"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 4. Apply the Adaptive Gate" "Chief spine must use adaptive gating"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 5. Diagnose Editorially" "Chief spine must diagnose editorially"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 6. Create the Editor Brief" "Chief spine must create the handoff brief"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 7. Delegate to Editor" "Chief spine must delegate text execution"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 8. Review as Chief" "Chief spine must review Editor output"
require_text "skills/a1-editor-in-chief/references/chief-spine.md" "## 9. Deliver Simply" "Chief spine must deliver a simple answer"
require_text "skills/a1-editor-in-chief/references/chief-scope.md" "Mixed-job behavior" "Chief scope must refuse mixed jobs"
require_text "skills/a1-editor-in-chief/references/chief-scope.md" "Completed external inputs" "Chief scope must accept completed strategy as input"
require_text "skills/a1-editor-in-chief/references/source-resolution.md" "Current instructions and task materials override repository context defaults" "Chief sources must prioritize current task values over defaults"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "The editing operation is not a user gate field" "Chief must select the operation itself"
require_text "skills/a1-editor-in-chief/references/chief-gate.md" "Ask one concise decision question" "Chief gate must ask only one decisive question"
require_text "skills/a1-editor-in-chief/references/editor-brief.md" "Keep it hidden unless" "Editor Brief must be internal by default"
require_text "skills/a1-editor-in-chief/references/chief-review.md" "Never rewrite or patch Editor's text locally" "Chief review must delegate corrections"
require_text "skills/a1-editor-in-chief/references/chief-review.md" "Never make more than one corrective Editor pass" "Chief review must cap correction passes"
require_text "skills/a1-editor-in-chief/evals/README.md" "## Manual Run Protocol" "Chief evals must define the semantic protocol"
require_text "README.md" "does not create market research, segmentation, pricing" "English README must explain the chief boundary"
require_text "README.ru.md" "не проводит исследования рынка" "Russian README must explain the chief boundary"
require_text "README.md" "Approved strategy:" "English README must include a realistic chief invocation"
require_text "README.ru.md" "Утверждённая стратегия:" "Russian README must include a realistic chief invocation"
forbid_text "skills/a1-editor-in-chief/SKILL.md" "a1-editor/references" "Chief must not deep-link Editor internal references"

for obsolete_chief_file in \
  "skills/a1-editor-in-chief/references/canon-core.md" \
  "skills/a1-editor-in-chief/references/rewrite-operations.md" \
  "skills/a1-editor-in-chief/references/diagnostic-rubric.md"; do
  if [[ -e "$obsolete_chief_file" ]]; then
    echo "FAIL $obsolete_chief_file"
    echo "  Obsolete chief compatibility shim must be removed"
    issues=$((issues + 1))
  fi
done

require_text "skills/a1-update/SKILL.md" "ztemerbekov/marketing-skills" "Update skill must pin its source boundary"
require_text "skills/a1-update/SKILL.md" "## Scope Classification" "Update skill must classify scope before prerequisite work"
require_text "skills/a1-update/SKILL.md" "Out of scope:" "Update skill must declare out-of-scope work"
require_text "skills/a1-update/SKILL.md" "Completed external inputs:" "Update skill must declare completed external inputs"
require_text "skills/a1-update/SKILL.md" "Mixed-job behavior:" "Update skill must declare mixed-job behavior"
require_text "skills/a1-update/SKILL.md" "without asking and without creating a backup" "Update skill must overwrite existing installations without a backup prompt"
require_text "skills/a1-update/SKILL.md" "managed client set" "Update skill must synchronize one managed client set per scope"
require_text "skills/a1-update/SKILL.md" "Install every upstream skill automatically" "Update skill must install newly available skills without confirmation"
require_text "skills/a1-update/SKILL.md" "automatically remove tracked skills missing from upstream" "Update skill must remove upstream-deleted skills without confirmation"
require_text "skills/a1-update/SKILL.md" "Always state explicitly that manual changes inside installed skill folders are overwritten without a backup." "Update explanation must disclose destructive overwrite behavior"
require_text "skills/a1-update/SKILL.md" "Marketing Skills обновлены." "Update skill must define the concise Russian success response"
require_text "skills/a1-update/SKILL.md" "references/npx-workflow.md" "Update skill must route to its source-scoped npx workflow"
require_text "skills/a1-update/SKILL.md" "references/runtime-prerequisites.md" "Update skill must route missing Node.js to its prerequisite workflow"
require_text "skills/a1-update/SKILL.md" "canonical current minimum in [runtime-prerequisites.md]" "Update skill must route runtime-version ownership to the prerequisite reference"
require_text "skills/a1-update/SKILL.md" "Complete the read-only preflight for every active scope before the first ordinary collection change." "Update skill must place one ordinary mutation barrier after all active-scope preflight checks"
require_text "skills/a1-update/SKILL.md" "If the file contains only unrelated sources, treat the project scope as inactive" "Update skill must skip an unrelated-only project lock silently"
require_text "skills/a1-update/SKILL.md" 'Never ask the user to choose an `--agent` key.' "Update skill must hide installer key selection from recovery"
require_text "skills/a1-update/SKILL.md" "refresh the running A1 Update automatically" "Update skill must recover an unknown client without making the user run a command"
require_text "skills/a1-update/SKILL.md" "Marketing Skills обновлены частично. Повторите запрос: «Обнови Marketing Skills»." "Update skill must define one concise partial-completion retry"
require_text "skills/a1-update/SKILL.md" "Не удалось подготовить обновление. Ничего не изменено. Повторите запрос позже." "Update skill must define one concise preflight-failure retry"
require_text "skills/a1-update/references/npx-workflow.md" 'Never use `--all`' "Update workflow must forbid unscoped removal"
require_text "skills/a1-update/references/npx-workflow.md" "## 4. Mutation Barrier" "Update workflow must separate complete preflight from installation changes"
require_text "skills/a1-update/references/npx-workflow.md" 'npx skills@latest add ztemerbekov/marketing-skills --skill a1-update --global --yes' "Update workflow must provide one global updater bootstrap command"
require_text "skills/a1-update/references/npx-workflow.md" 'npx skills@latest add ztemerbekov/marketing-skills --skill a1-update --yes' "Update workflow must provide one project updater bootstrap command"
require_text "skills/a1-update/references/npx-workflow.md" "Reload the refreshed A1 Update instructions" "Update workflow must resume through the refreshed updater"
require_text "skills/a1-update/references/npx-workflow.md" "Never show the bootstrap command to the user" "Update workflow must keep automatic recovery machinery out of user output"
require_text "skills/a1-update/references/npx-workflow.md" "## Mid-write Failure" "Update workflow must stop without unsafe rollback after mutation begins"
require_text "skills/a1-update/references/npx-workflow.md" "Mutation begins immediately before invoking the first mutating command" "Update workflow must treat a failing first write as potentially partial"
require_text "skills/a1-update/references/npx-workflow.md" "node scripts/prune-lock.mjs" "Update workflow must clean source-owned stale lock entries"
require_text "skills/a1-update/references/npx-workflow.md" '`antigravity-cli`' "Update workflow must map Antigravity CLI"
require_text "skills/a1-update/references/npx-workflow.md" '`gemini-cli`' "Update workflow must map Gemini CLI"
require_text "skills/a1-update/references/npx-workflow.md" '`github-copilot`' "Update workflow must map GitHub Copilot"
require_text "skills/a1-update/references/npx-workflow.md" '`warp`' "Update workflow must map Warp"
require_text "skills/a1-update/references/npx-workflow.md" '`zed`' "Update workflow must map Zed"
require_text "skills/a1-update/SKILL.md" "Do not search other project directories" "Update workflow must stay within global and current-project scopes"
require_text "skills/a1-update/references/runtime-prerequisites.md" "Do not bootstrap Homebrew" "Prerequisite workflow must not install another package manager"
require_text "skills/a1-update/references/runtime-prerequisites.md" 'canonical minimum for the current `skills` CLI is Node.js 22.20.0' "Prerequisite workflow must own the current skills CLI runtime floor"
require_text "skills/a1-update/references/runtime-prerequisites.md" "Ask only this question before any system change" "Prerequisite workflow must not expose commands before approval"
require_text "skills/a1-update/references/runtime-prerequisites.md" "Для обновления нужен Node.js. Установить и продолжить?" "Prerequisite workflow must own the exact Russian Node.js confirmation"
require_text "skills/a1-update/references/runtime-prerequisites.md" "If the user declines" "Prerequisite workflow must preserve the system after refusal"
forbid_text "skills/a1-update/SKILL.md" "Present all newly available skills in one confirmation" "Update skill must not ask about newly available skills"
require_text "README.md" "New skills are installed automatically" "English README must explain automatic Marketing Skills membership"
require_text "README.ru.md" "Новые навыки устанавливаются автоматически" "Russian README must explain automatic Marketing Skills membership"
forbid_text "README.md" "Before changing an installation, Update verifies" "Public English README must not expose the updater's internal recovery contract"
forbid_text "README.ru.md" "До первого изменения Обновление проверяет" "Public Russian README must not expose the updater's internal recovery contract"
require_text "docs/maintainers/README.md" "## A1 Update Safety Contract" "Maintainer README must own the updater's technical recovery summary"

for eval_case in "${editor_eval_cases[@]}" "${editor_localization_eval_cases[@]}" "${chief_eval_cases[@]}" "${chief_localization_eval_cases[@]}" "${chief_integration_eval_cases[@]}" "${context_eval_cases[@]}" "${context_consumer_eval_cases[@]}" "${release_chief_eval_cases[@]}" "${update_eval_cases[@]}"; do
  require_text "$eval_case" "## User Instruction" "A1 eval case must include the exact user instruction"
  require_text "$eval_case" "## Input" "A1 eval case must include the complete input"
  require_text "$eval_case" "## Must Change" "A1 eval case must include Must Change criteria"
  require_text "$eval_case" "## Must Preserve" "A1 eval case must include Must Preserve criteria"
  require_text "$eval_case" "## Forbidden" "A1 eval case must include Forbidden criteria"

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

for eval_case in "${editor_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$certification_report" "$eval_id" "Pilot certification must include editor eval case $eval_id"
done

for eval_case in "${editor_localization_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$editor_localization_report" "$eval_id" "Editor localization run must include eval case $eval_id"
done

require_text "$editor_localization_report" "## Installation Mode" "Editor localization run must disclose its installation mode"
require_text "$editor_localization_report" 'Repository verification: `PASS`' "Editor localization run must record passing repository verification"
require_text "$editor_localization_report" 'Standards review: `PASS`' "Editor localization run must record the independent Standards verdict"
require_text "$editor_localization_report" 'Spec review: `PASS`' "Editor localization run must record the independent Spec verdict"
require_text "$editor_localization_report" 'Human semantic judgment: `PASS`' "Editor localization run must capture the human semantic verdict"
require_text "$editor_localization_report" 'Focused semantic gate: `PASS`' "Editor localization run must state a passing focused semantic verdict"

for eval_case in "${chief_eval_cases[@]}" "${chief_integration_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$chief_run_report" "$eval_id" "Chief run report must include eval case $eval_id"
done

for eval_case in "${chief_localization_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$chief_localization_report" "$eval_id" "Chief localization run must include eval case $eval_id"
done

require_text "$chief_localization_report" "## Installation Mode" "Chief localization run must disclose its installation mode"
require_text "$chief_localization_report" 'Repository verification: `PASS`' "Chief localization run must record passing repository verification"
require_text "$chief_localization_report" 'Standards review: `PASS`' "Chief localization run must record the independent Standards verdict"
require_text "$chief_localization_report" 'Spec review: `PASS`' "Chief localization run must record the independent Spec verdict"
require_text "$chief_localization_report" 'Human semantic judgment: `PASS`' "Chief localization run must capture the human semantic verdict"
require_text "$chief_localization_report" 'Focused semantic gate: `PASS`' "Chief localization run must state a passing focused semantic verdict"

for eval_case in "${context_eval_cases[@]}" "${context_consumer_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$eval_case" "## Output Contract" "Marketing Context eval case must include an output-contract check"
  require_text "$context_run_report" "$eval_id" "Marketing Context run report must include eval case $eval_id"
done

for eval_case in "${chief_eval_cases[@]}" "${release_chief_eval_cases[@]}" "${context_eval_cases[@]}" "${context_consumer_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$integrated_run_report" "$eval_id" "Integrated release run must include required case $eval_id"
done

require_text "$integrated_run_report" "## Environment and Candidate" "Integrated release run must record a comparable environment"
require_text "$integrated_run_report" "## Installation Mode" "Integrated release run must disclose its installation mode"
require_text "$integrated_run_report" "## Finalization Rule" "Integrated release run must prevent a false pass"
require_text "$integrated_run_report" 'Repository verification: `PASS`' "Integrated release run must record passing repository verification"
require_text "$integrated_run_report" 'Standards review: `PASS`' "Integrated release run must record the independent Standards verdict"
require_text "$integrated_run_report" 'Spec review: `PASS`' "Integrated release run must record the independent Spec verdict"
require_text "$integrated_run_report" 'Human semantic judgment: `PASS`' "Integrated release run must capture the human semantic verdict"
require_text "$integrated_run_report" 'Final release verdict: `PASS — READY FOR USERS`' "Integrated release run must state the final user-readiness verdict"
require_text "$integrated_run_report" 'Human reviewer: `ztemerbekov`' "Integrated release run must identify the human reviewer"
require_text "$chief_completion_report" "## Installed Semantic Release Gate" "Chief completion record must apply the installed semantic gate"
require_text "$chief_completion_report" "## Completion Verdict" "Chief completion record must state a verdict rule"
require_text "$chief_completion_report" '`PASS — READY FOR USERS`' "Chief completion record must state a passing final verdict"
require_text "$context_completion_report" "## Installed Semantic Release Gate" "Context completion record must apply the installed semantic gate"
require_text "$context_completion_report" "## Completion Verdict" "Context completion record must state a verdict rule"
require_text "$context_completion_report" '`PASS — READY FOR USERS`' "Context completion record must state a passing final verdict"

for eval_case in "${update_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  if [[ -n "$eval_id" ]]; then
    require_text "$update_certification_report" "$eval_id" "Updater certification must include eval case $eval_id"
  fi
done

for eval_case in "${update_focused_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$update_managed_set_report" "$eval_id" "Updater managed-set run must include focused case $eval_id"
done

require_text "$update_managed_set_report" "## Installation Mode" "Updater managed-set run must disclose its installation mode"
require_text "$update_managed_set_report" 'Repository verification: `PASS`' "Updater managed-set run must record passing repository verification"
require_text "$update_managed_set_report" 'Standards review: `PASS`' "Updater managed-set run must record the independent Standards verdict"
require_text "$update_managed_set_report" 'Spec review: `PASS`' "Updater managed-set run must record the independent Spec verdict"
require_text "$update_managed_set_report" 'Human semantic judgment: `PASS`' "Updater managed-set run must capture the human semantic verdict"
require_text "$update_managed_set_report" 'Focused semantic gate: `PASS`' "Updater managed-set run must state a passing focused verdict"

for eval_case in "${update_recovery_eval_cases[@]}"; do
  eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_case" | head -n 1)"
  require_text "$update_recovery_report" "$eval_id" "Updater recovery run must include focused case $eval_id"
done

require_text "$update_recovery_report" "## Installation Mode" "Updater recovery run must disclose its installation mode"
require_text "$update_recovery_report" 'Repository verification: `PASS`' "Updater recovery run must record passing repository verification"
require_text "$update_recovery_report" 'Standards review: `PASS`' "Updater recovery run must record the independent Standards verdict"
require_text "$update_recovery_report" 'Spec review: `PASS`' "Updater recovery run must record the independent Spec verdict"
require_text "$update_recovery_report" 'Human semantic judgment: `PASS`' "Updater recovery run must capture the human semantic verdict"
require_text "$update_recovery_report" 'Focused semantic gate: `PASS`' "Updater recovery run must state a passing focused verdict"

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
