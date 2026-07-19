#!/usr/bin/env bash
set -euo pipefail

skills_dir="skills"
failures=0
skills_checked=0
evals_checked=0
eval_ids=()
eval_files=()

fail() {
  echo "FAIL $1"
  echo "  $2"
  failures=$((failures + 1))
}

frontmatter_value() {
  local frontmatter="$1"
  local key="$2"
  printf '%s\n' "$frontmatter" \
    | awk -F': *' -v key="$key" '$1 == key {sub(/^[^:]*:[[:space:]]*/, ""); print; exit}' \
    | sed 's/^"//; s/"$//; s/^'\''//; s/'\''$//'
}

if [[ ! -d "$skills_dir" ]]; then
  echo "Missing skills directory: $skills_dir" >&2
  exit 1
fi

shopt -s nullglob
skill_dirs=("$skills_dir"/*/)
if [[ ${#skill_dirs[@]} -eq 0 ]]; then
  echo "No skill directories found in $skills_dir" >&2
  exit 1
fi

for skill_dir in "${skill_dirs[@]}"; do
  skill_name="$(basename "$skill_dir")"
  skill_file="${skill_dir}SKILL.md"
  skills_checked=$((skills_checked + 1))

  if [[ ! -f "$skill_file" ]]; then
    fail "$skill_name" "Missing SKILL.md"
    continue
  fi

  if [[ "$(sed -n '1p' "$skill_file")" != "---" ]]; then
    fail "$skill_file" "Frontmatter must start on the first line"
    continue
  fi

  frontmatter_end="$(awk 'NR > 1 && $0 == "---" {print NR; exit}' "$skill_file")"
  if [[ -z "$frontmatter_end" ]]; then
    fail "$skill_file" "Frontmatter is not closed"
    continue
  fi

  frontmatter="$(sed -n "2,$((frontmatter_end - 1))p" "$skill_file")"
  declared_name="$(frontmatter_value "$frontmatter" "name")"
  description="$(frontmatter_value "$frontmatter" "description")"
  disable_model_invocation="$(frontmatter_value "$frontmatter" "disable-model-invocation")"

  if [[ -z "$declared_name" ]]; then
    fail "$skill_file" "Frontmatter is missing name"
  elif [[ "$declared_name" != "$skill_name" ]]; then
    fail "$skill_file" "Frontmatter name '$declared_name' does not match directory '$skill_name'"
  elif ! [[ "$declared_name" =~ ^a1-[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    fail "$skill_file" "Name must use the a1- prefix and lowercase hyphenated words"
  fi

  if [[ -z "$description" \
    || "$description" == \|* \
    || "$description" == \>* \
    || "$description" == \#* \
    || "$description" == "~" \
    || "$description" =~ ^[Nn][Uu][Ll][Ll]$ ]]; then
    fail "$skill_file" "Frontmatter requires a non-empty inline description"
  fi

  if printf '%s\n' "$frontmatter" | grep -Eq '^[[:space:]]*version:'; then
    fail "$skill_file" "Skill versions belong to repository releases, not skill frontmatter"
  fi

  if [[ "$disable_model_invocation" == "true" ]]; then
    openai_metadata="${skill_dir}agents/openai.yaml"
    if [[ ! -f "$openai_metadata" ]]; then
      fail "$skill_file" "Command-only skills require agents/openai.yaml"
    elif ! grep -Eq '^[[:space:]]*allow_implicit_invocation:[[:space:]]*false[[:space:]]*$' "$openai_metadata"; then
      fail "$openai_metadata" "Command-only skills must disable implicit invocation"
    fi
  fi

  if ! awk -v frontmatter_end="$frontmatter_end" 'NR > frontmatter_end && $0 == "## Language" {found=1} END {exit !found}' "$skill_file"; then
    fail "$skill_file" "Missing Language section"
  fi

  eval_dir="${skill_dir}evals/cases"
  if [[ -d "$eval_dir" ]]; then
    while IFS= read -r -d '' eval_file; do
      evals_checked=$((evals_checked + 1))
      eval_id="$(sed -n 's/^- ID: `\([^`]*\)`.*/\1/p' "$eval_file" | head -n 1)"

      if [[ -z "$eval_id" ]]; then
        fail "$eval_file" "Missing stable ID"
      else
        expected_file="${eval_id}.md"
        if [[ "$(basename "$eval_file")" != "$expected_file" ]]; then
          fail "$eval_file" "Filename must match ID: $expected_file"
        fi
        duplicate_file=""
        for index in "${!eval_ids[@]}"; do
          if [[ "${eval_ids[$index]}" == "$eval_id" ]]; then
            duplicate_file="${eval_files[$index]}"
            break
          fi
        done
        if [[ -n "$duplicate_file" ]]; then
          fail "$eval_file" "Duplicate eval ID also used by $duplicate_file"
        else
          eval_ids+=("$eval_id")
          eval_files+=("$eval_file")
        fi
      fi

      for heading in "User Instruction" "Input" "Must Change" "Must Preserve" "Forbidden"; do
        if ! grep -Fqx "## $heading" "$eval_file"; then
          fail "$eval_file" "Missing section: ## $heading"
        fi
      done
    done < <(find "$eval_dir" -maxdepth 1 -type f -name '*.md' -print0)
  fi
done

echo
echo "Summary: $skills_checked skills checked, $evals_checked eval cases checked, $failures failures"

if [[ $failures -gt 0 ]]; then
  exit 1
fi
