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

validate_consumer_psy_dossiers() {
  local skill_dir="skills/a1-consumer-psy"
  local index_file="$skill_dir/references/model-index.md"
  local dossier_dir="$skill_dir/references/dossiers"
  local catalog_ids=()
  local unique_catalog_ids=()
  local catalog_id
  local known_id
  local duplicate_id
  local dossier_link
  local dossier_file
  local dossier_anchor
  local expected_anchor
  local anchor_count
  local section_card_count
  local section_evidence_count
  local model_card_count
  local evidence_count
  local declared_total
  local declared_core
  local declared_child
  local declared_support
  local declared_research
  local declared_selectable
  local actual_core
  local actual_child
  local actual_support
  local actual_research
  local actual_selectable

  catalog_count_for_section() {
    local section_name="$1"

    awk -v section_name="$section_name" '
      $0 ~ "^## " section_name {inside=1; next}
      inside && /^## / {exit}
      inside && /^\| [MN][0-9][0-9] \|/ {count += 1}
      END {print count + 0}
    ' "$index_file"
  }

  [[ -f "$index_file" ]] || return

  if [[ ! -d "$dossier_dir" ]]; then
    fail "$skill_dir" "Missing references/dossiers for routed model evidence"
    return
  fi

  while IFS= read -r catalog_id; do
    catalog_ids+=("$catalog_id")
  done < <(sed -n 's/^| \([MN][0-9][0-9]\) |.*/\1/p' "$index_file")

  declared_total="$(sed -n 's/^| \*\*Installed total\*\* | \*\*\([0-9][0-9]*\)\*\* |.*/\1/p' "$index_file")"
  declared_core="$(sed -n 's/^## CORE — \([0-9][0-9]*\)$/\1/p' "$index_file")"
  declared_child="$(sed -n 's/^## CHILD — \([0-9][0-9]*\)$/\1/p' "$index_file")"
  declared_support="$(sed -n 's/^## SUPPORT — \([0-9][0-9]*\)$/\1/p' "$index_file")"
  declared_research="$(sed -n 's/^## RESEARCH — \([0-9][0-9]*\)$/\1/p' "$index_file")"
  declared_selectable="$(sed -n 's/^| `CORE` + `CHILD` | \*\*\([0-9][0-9]*\).*$/\1/p' "$index_file")"

  if [[ -z "$declared_total" || -z "$declared_core" || -z "$declared_child" || -z "$declared_support" || -z "$declared_research" || -z "$declared_selectable" ]]; then
    fail "$index_file" "Missing declared catalog totals"
    return
  fi

  actual_core="$(catalog_count_for_section 'CORE —')"
  actual_child="$(catalog_count_for_section 'CHILD —')"
  actual_support="$(catalog_count_for_section 'SUPPORT —')"
  actual_research="$(catalog_count_for_section 'RESEARCH —')"
  actual_selectable=$((actual_core + actual_child))

  if [[ "$actual_core" -ne "$declared_core" || "$actual_child" -ne "$declared_child" || "$actual_support" -ne "$declared_support" || "$actual_research" -ne "$declared_research" ]]; then
    fail "$index_file" "Catalog rows do not match the declared CORE, CHILD, SUPPORT, and RESEARCH totals"
  fi

  if [[ "$actual_selectable" -ne "$declared_selectable" ]]; then
    fail "$index_file" "Catalog CORE + CHILD rows do not match the declared selectable total"
  fi

  if [[ $((declared_core + declared_child + declared_support + declared_research)) -ne "$declared_total" ]]; then
    fail "$index_file" "Declared catalog tier totals do not add up to the installed total"
  fi

  if [[ ${#catalog_ids[@]} -ne "$declared_total" ]]; then
    fail "$index_file" "Expected $declared_total installed model entries, found ${#catalog_ids[@]}"
  fi

  for catalog_id in "${catalog_ids[@]}"; do
    duplicate_id=false
    for known_id in "${unique_catalog_ids[@]:-}"; do
      if [[ "$catalog_id" == "$known_id" ]]; then
        duplicate_id=true
        break
      fi
    done

    if [[ "$duplicate_id" == true ]]; then
      fail "$index_file" "Duplicate catalog ID $catalog_id"
    else
      unique_catalog_ids+=("$catalog_id")
    fi
  done

  if [[ ${#unique_catalog_ids[@]} -ne "$declared_total" ]]; then
    fail "$index_file" "Catalog must contain $declared_total unique model IDs"
  fi

  model_card_count="$(grep -E '^## [MN][0-9][0-9] — ' "$dossier_dir"/*.md 2>/dev/null | wc -l | tr -d ' ')"
  evidence_count="$(grep -E '^### Evidence \([A-Z]\)$' "$dossier_dir"/*.md 2>/dev/null | wc -l | tr -d ' ')"

  if [[ "$model_card_count" -ne "$declared_total" ]]; then
    fail "$dossier_dir" "Expected $declared_total model cards, found $model_card_count"
  fi

  if [[ "$evidence_count" -ne "$declared_total" ]]; then
    fail "$dossier_dir" "Expected $declared_total co-located evidence records, found $evidence_count"
  fi

  for catalog_id in "${catalog_ids[@]}"; do
    dossier_link="$(sed -n "/^| $catalog_id |/s/.*](\(dossiers\/[^#)]*#[^)]*\)).*/\1/p" "$index_file")"

    if [[ -z "$dossier_link" ]]; then
      fail "$index_file" "$catalog_id is missing a direct dossier pointer"
      continue
    fi

    dossier_file="$skill_dir/references/${dossier_link%%#*}"
    dossier_anchor="${dossier_link##*#}"
    expected_anchor="$(printf '%s' "$catalog_id" | tr '[:upper:]' '[:lower:]')"

    if [[ ! -f "$dossier_file" ]]; then
      fail "$index_file" "$catalog_id points to missing dossier ${dossier_link%%#*}"
      continue
    fi

    if [[ "$dossier_anchor" != "$expected_anchor" ]]; then
      fail "$index_file" "$catalog_id must point to its stable #$expected_anchor anchor"
      continue
    fi

    anchor_count="$(grep -F "<a id=\"$dossier_anchor\"></a>" "$dossier_dir"/*.md | wc -l | tr -d ' ')"
    if [[ "$anchor_count" -ne 1 ]]; then
      fail "$index_file" "$catalog_id must have exactly one dossier anchor #$dossier_anchor"
      continue
    fi

    if ! grep -Fqx "<a id=\"$dossier_anchor\"></a>" "$dossier_file"; then
      fail "$index_file" "$catalog_id points to missing dossier anchor #$dossier_anchor"
      continue
    fi

    section_card_count="$(awk -v anchor="$dossier_anchor" -v model_id="$catalog_id" '
      $0 == "<a id=\"" anchor "\"></a>" {inside=1; next}
      inside && /^<a id=/ {exit}
      inside && index($0, "## " model_id " —") == 1 {cards += 1}
      END {print cards + 0}
    ' "$dossier_file")"
    section_evidence_count="$(awk -v anchor="$dossier_anchor" '
      $0 == "<a id=\"" anchor "\"></a>" {inside=1; next}
      inside && /^<a id=/ {exit}
      inside && /^### Evidence \([A-Z]\)$/ {evidence += 1}
      END {print evidence + 0}
    ' "$dossier_file")"

    if [[ "$section_card_count" -ne 1 ]]; then
      fail "$dossier_file" "$catalog_id anchor must own exactly one model card"
    fi

    if [[ "$section_evidence_count" -ne 1 ]]; then
      fail "$dossier_file" "$catalog_id anchor must own exactly one evidence record"
    fi
  done
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

validate_consumer_psy_dossiers

echo
echo "Summary: $skills_checked skills checked, $evals_checked eval cases checked, $failures failures"

if [[ $failures -gt 0 ]]; then
  exit 1
fi
