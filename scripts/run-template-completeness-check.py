#!/usr/bin/env python3
"""Lightweight scaffold check for deliverable templates."""

from pathlib import Path

required = [
    Path("templates/deliverable-package-index-template.md"),
    Path("readme-templates/engineering-repo-readme-template.md"),
    Path("handoff-checklists/engineering-handoff-checklist.md"),
]

missing = [str(path) for path in required if not path.exists()]
if missing:
    raise SystemExit("Missing required deliverable templates: " + ", ".join(missing))

print("PASS deliverables template completeness check")
