#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="skills"
issues=0
warnings=0
passed=0
artifacts_passed=0

echo "Validating A1 design contract artifacts"
echo

editor_eval_cases=(
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
)

required_artifacts=(
  "AGENTS.md"
  "README.md"
  "README.ru.md"
  "docs/a1-skill-design-contract.md"
  "docs/a1-marketing-glossary.md"
  "skills/a1-editor/references/editor-spine.md"
  "skills/a1-editor/references/source-boundary.md"
  "skills/a1-editor/references/operations.md"
  "skills/a1-editor/references/information-style.md"
  "skills/a1-editor/references/final-qa.md"
  "skills/a1-editor/evals/README.md"
  "skills/a1-editor/evals/case-template.md"
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
require_text "AGENTS.md" "CONTEXT-MAP.md" "AGENTS.md must require domain-boundary reassessment for new skills"
require_text "README.md" "docs/a1-skill-design-contract.md" "README.md must link the A1 skill design contract"
require_text "README.ru.md" "docs/a1-skill-design-contract.md" "README.ru.md must link the A1 skill design contract"
require_text "README.md" "z.temerbekov@gmail.com" "README.md must include the feedback address"
require_text "README.ru.md" "z.temerbekov@gmail.com" "README.ru.md must include the feedback address"
require_text "skills/a1-editor/evals/README.md" "## Case Format" "Editor eval docs must define the case format"
require_text "skills/a1-editor/evals/README.md" "## Manual Run Protocol" "Editor eval docs must define the manual run protocol"
require_text "skills/a1-editor/evals/case-template.md" "## Must Change" "Editor eval template must include Must Change criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Must Preserve" "Editor eval template must include Must Preserve criteria"
require_text "skills/a1-editor/evals/case-template.md" "## Forbidden" "Editor eval template must include Forbidden criteria"
require_text "skills/a1-editor/SKILL.md" "references/editor-spine.md" "A1 Editor must use the invariant editor spine"
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

for eval_case in "${editor_eval_cases[@]}" "${chief_eval_cases[@]}"; do
  require_text "$eval_case" "## User Instruction" "Editor eval case must include the exact user instruction"
  require_text "$eval_case" "## Input" "Editor eval case must include the complete input"
  require_text "$eval_case" "## Must Change" "Editor eval case must include Must Change criteria"
  require_text "$eval_case" "## Must Preserve" "Editor eval case must include Must Preserve criteria"
  require_text "$eval_case" "## Forbidden" "Editor eval case must include Forbidden criteria"
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
