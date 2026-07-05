#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="skills"
issues=0
warnings=0
passed=0

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
echo "Summary: $passed passed, $warnings warnings, $issues failures"

if [[ "$issues" -gt 0 ]]; then
  exit 1
fi
