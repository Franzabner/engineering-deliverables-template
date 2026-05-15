#!/usr/bin/env bash
set -u

missing=0

required_files=(
  "AGENTS.md"
  "README.md"
  "STATUS.md"
  "PUBLIC_BOUNDARY.md"
  "CLAIMS.md"
  "VALIDATION.md"
  "ARTIFACT_REGISTER.md"
  "REVIEW_LOG.md"
  "requirements.txt"
  "readme-templates/README.md"
  "readme-templates/engineering-repo-readme-template.md"
  "status-templates/README.md"
  "status-templates/status-language-template.md"
  "claims-templates/README.md"
  "claims-templates/claims-register-template.md"
  "boundary-templates/README.md"
  "boundary-templates/public-boundary-template.md"
  "bom-templates/README.md"
  "bom-templates/public-safe-bom-template.csv"
  "bom-templates/bom-boundary-notes.md"
  "control-narratives/README.md"
  "control-narratives/control-narrative-template.md"
  "commissioning-templates/README.md"
  "commissioning-templates/commissioning-template.md"
  "simulation-report-templates/README.md"
  "simulation-report-templates/simulation-report-template.md"
  "model-cards/README.md"
  "model-cards/model-card-template.md"
  "dataset-cards/README.md"
  "dataset-cards/dataset-card-template.md"
  "handoff-checklists/README.md"
  "handoff-checklists/engineering-handoff-checklist.md"
  "diagrams/README.md"
  "diagrams/deliverable-review-flow.mmd"
  "scripts/validate-public-boundary.sh"
  "scripts/run-template-completeness-check.py"
  "templates/deliverable-package-index-template.md"
  "templates/review-ready-artifact-template.md"
  "templates/handoff-package-template.md"
)

for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    printf "PASS %s\n" "$file"
  else
    printf "FAIL %s\n" "$file"
    missing=$((missing + 1))
  fi
done

required_terms=(
  "planned"
  "scaffolded"
  "published"
  "released"
  "private/not-public"
  "stamped engineering"
  "certification"
  "code compliance"
  "legal approval"
  "customer deliverables"
  "customer data"
  "Foundation-private"
  "production BOMs"
  "production CAD"
  "production schematics"
  "sealed source"
  "private model artifacts"
  "active client deliverables"
  "service offerings"
  "pricing"
  "turnaround"
  "released model"
  "released dataset"
  "Space release"
  "validation"
  "review"
)

for term in "${required_terms[@]}"; do
  if rg -q "$term" .; then
    printf "PASS term: %s\n" "$term"
  else
    printf "FAIL term: %s\n" "$term"
    missing=$((missing + 1))
  fi
done

blocked_files="$(find . -path ./.git -prune -o \( -iname '*.f3d' -o -iname '*.step' -o -iname '*.stp' -o -iname '*.kicad_pcb' -o -iname '*.sch' -o -iname '*.brd' -o -iname '*.gbr' -o -iname '*.key' -o -iname '*.pem' -o -iname '*.log' \) -print)"
if [ -z "$blocked_files" ]; then
  printf "PASS blocked production/private artifact scan\n"
else
  printf "FAIL blocked production/private artifact scan\n%s\n" "$blocked_files"
  missing=$((missing + 1))
fi

if [ "$missing" -eq 0 ]; then
  printf "Result: PASS - deliverables template public boundary scaffold is complete.\n"
else
  printf "Result: FAIL - %s required checks failed.\n" "$missing"
fi

exit "$missing"
