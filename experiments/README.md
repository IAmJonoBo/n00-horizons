# Experiments

Each experiment lives in its own directory using the naming convention `DD-MM-YYYY-<slug>/` and contains:

- `lab-notes.md` — chronological notes using the Diátaxis “chronicle” style.
- `artifacts/` — generated assets, datasets, or exports that are safe to check in.
- `results/` — derived metrics ready to sync into `n00-cortex` or project dashboards.

## Creating a new experiment

```bash
./scripts/new-experiment.sh 09-01-2025 agent-alignment
```

This script scaffolds:

- `docs/experiments/<slug>.md` from the template if it does not exist.
- `experiments/DD-MM-YYYY-<slug>/lab-notes.md` with starter sections.
- Links to the relevant n00-school pipeline for training/evaluation.

Update the GitHub issue (`[EXP] ...`) with the generated paths and move the linked project item to the appropriate stage.
