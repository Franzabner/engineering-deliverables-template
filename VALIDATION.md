# Validation

Run:

```bash
bash scripts/validate-public-boundary.sh
rg -n "planned|scaffolded|published|released|private/not-public|stamped engineering|certification|code compliance|legal approval|customer deliverables|customer data|Foundation-private|production BOMs|production CAD|production schematics|sealed source|private model artifacts|active client deliverables|service offerings|pricing|turnaround|released model|released dataset|Space release|validation|review" .
git diff --check
git status --short
```

The `rg` scan is expected to find boundary terms in exclusion and review language, not as active service or release claims.
