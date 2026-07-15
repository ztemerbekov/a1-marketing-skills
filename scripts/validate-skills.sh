#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="skills"
issues=0
warnings=0
passed=0
artifacts_passed=0
certification_report="docs/a1-editor-pilot-certification.md"

echo "Validating A1 design contract artifacts"
echo

editor_eval_cases=(
  "skills/a1-editor/evals/cases/strategy-positioning-route.md"
  "skills/a1-editor/evals/cases/strategy-offer-route.md"
  "skills/a1-editor/evals/cases/strategy-audience-route.md"
  "skills/a1-editor/evals/cases/strategy-campaign-route.md"
  "skills/a1-editor/evals/cases/strategy-landing-structure-route.md"
  "skills/a1-editor/evals/cases/ordinary-edit-stays-editor.md"
  "skills/a1-editor/evals/cases/strategy-keyword-edit-stays-editor.md"
  "skills/a1-editor/evals/cases/mixed-edit-and-strategy-boundary.md"
  "skills/a1-editor/evals/cases/standard-edit-voice.md"
  "skills/a1-editor/evals/cases/shorten.md"
  "skills/a1-editor/evals/cases/clarify-weak-source.md"
  "skills/a1-editor/evals/cases/strengthen-unsupported-claims.md"
  "skills/a1-editor/evals/cases/restructure.md"
  "skills/a1-editor/evals/cases/significant-ambiguity.md"
  "skills/a1-editor/evals/cases/information-style-explicit.md"
  "skills/a1-editor/evals/cases/information-style-not-inferred.md"
  "skills/a1-editor/evals/cases/information-style-llm-post.md"
  "skills/a1-editor/evals/cases/information-style-preserve-voice.md"
  "skills/a1-editor/evals/cases/information-style-preserve-structure.md"
  "skills/a1-editor/evals/cases/information-style-preserve-formatting.md"
  "skills/a1-editor/evals/cases/information-style-unsupported-claims.md"
  "skills/a1-editor/evals/cases/information-style-markdown-integrity.md"
)

chief_eval_cases=(
  "skills/a1-editor-in-chief/evals/cases/missing-editor-dependency.md"
  "skills/a1-editor-in-chief/evals/cases/explicit-chief-hard-gate.md"
  "skills/a1-editor-in-chief/evals/cases/explicit-chief-handoff.md"
)

required_artifacts=(
  "AGENTS.md"
  "README.md"
  "README.ru.md"
  ".cursor/rules/marketing-skills.mdc"
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
  "skills/a1-editor-in-chief/references/chief-gate.md"
  "skills/a1-editor-in-chief/references/editor-brief.md"
  "${editor_eval_cases[@]}"
  "${chief_eval_cases[@]}"
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

require_text "AGENTS.md" "docs/a1-skill-design-contract.md" "AGENTS.md must require the canonical A1 skill design contract"
require_text "AGENTS.md" "docs/a1-skill-completion-checklist.md" "AGENTS.md must require the reusable A1 completion checklist"
require_text "AGENTS.md" "CONTEXT-MAP.md" "AGENTS.md must require domain-boundary reassessment for new skills"
require_text "docs/a1-skill-design-contract.md" "a1-skill-completion-checklist.md" "The design contract must route maintainers to the completion checklist"
require_text "docs/a1-skill-completion-checklist.md" "## Invocation and Interaction Contract" "Completion checklist must cover invocation selection"
require_text "docs/a1-skill-completion-checklist.md" "## Self-Contained Runtime" "Completion checklist must cover self-contained installation"
require_text "docs/a1-skill-completion-checklist.md" "## Criteria-Based Evaluation" "Completion checklist must cover eval design"
require_text "docs/a1-skill-completion-checklist.md" "## Installed Semantic Release Gate" "Completion checklist must cover installed semantic runs"
require_text "docs/a1-skill-completion-checklist.md" "CONTEXT-MAP.md" "Completion checklist must require domain-boundary reassessment"
require_text "README.md" "docs/a1-skill-design-contract.md" "README.md must link the A1 skill design contract"
require_text "README.ru.md" "docs/a1-skill-design-contract.md" "README.ru.md must link the A1 skill design contract"
require_text "README.md" "docs/a1-skill-completion-checklist.md" "README.md must link the reusable A1 completion checklist"
require_text "README.ru.md" "docs/a1-skill-completion-checklist.md" "README.ru.md must link the reusable A1 completion checklist"
require_text "README.md" "docs/a1-editor-pilot-certification.md" "README.md must link the A1 Editor pilot certification record"
require_text "README.ru.md" "docs/a1-editor-pilot-certification.md" "README.ru.md must link the A1 Editor pilot certification record"
require_text "README.md" "z.temerbekov@gmail.com" "README.md must include the feedback address"
require_text "README.ru.md" "z.temerbekov@gmail.com" "README.ru.md must include the feedback address"
require_text "README.md" 'explicitly invoke `a1-editor-in-chief`' "README.md must document explicit Editor in Chief invocation"
require_text "README.md" "does not start the chief interview automatically" "README.md must document the automatic-interview boundary"
require_text "README.ru.md" 'явно запустить `a1-editor-in-chief`' "README.ru.md must document explicit Editor in Chief invocation"
require_text "README.ru.md" "не начинает интервью шеф-редактора автоматически" "README.ru.md must document the automatic-interview boundary"
require_text "skills/a1-editor/evals/README.md" "## Case Format" "Editor eval docs must define the case format"
require_text "skills/a1-editor/evals/README.md" "## Manual Run Protocol" "Editor eval docs must define the manual run protocol"
require_text "$certification_report" "## Certification Status" "Pilot certification must state its verdict"
require_text "$certification_report" "## Environment" "Pilot certification must record a comparable environment"
require_text "$certification_report" "## Judgment Rule" "Pilot certification must define criteria-based judgment"
require_text "$certification_report" "Output-contract check" "Pilot certification must require a separate output-contract check in every semantic judgment"
require_text "$certification_report" "## Case Results" "Pilot certification must inventory every eval case"
require_text "$certification_report" "## Remaining Limitations" "Pilot certification must disclose remaining limitations"
require_text "$certification_report" "## Finalization Rule" "Pilot certification must prevent a false pass"
require_text "skills/a1-editor/evals/case-template.md" "## Must Change" "Editor eval template must include Must Change criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Must Preserve" "Editor eval template must include Must Preserve criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Forbidden" "Editor eval template must include Forbidden criteria"
require_text "skills/a1-editor/evals/cases/strengthen-unsupported-claims.md" 'категоричное `помогает быстрее`' "Strengthen regression must forbid removing source uncertainty from the speed outcome"
require_text "skills/a1-editor/evals/cases/significant-ambiguity.md" 'Ближайшее упоминание `Pro`' "Ambiguity regression must reject nearest-antecedent guessing"
require_text "skills/a1-editor/evals/cases/information-style-explicit.md" "личный опыт остается отдельным абзацем перед списком" "Information Style regression must reject leaving personal context before the actionable list"
require_text "skills/a1-editor/references/information-style.md" "put the actionable sequence before supporting personal context" "Information Style runtime must foreground an actionable sequence before supporting personal context"
require_text "skills/a1-editor/SKILL.md" "references/editor-spine.md" "A1 Editor must use the invariant editor spine"
require_text "skills/a1-editor/SKILL.md" "safe strategy router" "A1 Editor invocation metadata must advertise safe strategy routing"
require_text ".cursor/rules/marketing-skills.mdc" "routing requests for new positioning" "Cursor activation metadata must advertise strategy routing"
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

for eval_case in "${editor_eval_cases[@]}" "${chief_eval_cases[@]}"; do
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
    require_text "$certification_report" "$eval_id" "Pilot certification must include eval case $eval_id"
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
