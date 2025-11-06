# n00-horizons

Research & development hub for n00tropic. This repository captures ideation, experiments, and programme management for frontier initiatives before they land in productised workspaces.

## Principles

- Operate according to [n00-frontiers › n00-horizons Operating Model](../n00-frontiers/docs/workflows/horizons-project-management.md).
- Every idea becomes a GitHub issue using the provided templates; every active experiment has a living brief in `docs/` and a lab workspace in `experiments/`.
- Automation runs through `n00t`: experiments that prove out must emit capabilities, pipelines, or templates that integrate with `n00t`, `n00-cortex`, and `n00-frontiers`.

## Repository layout

| Path | Purpose |
| ---- | ------- |
| `.github/ISSUE_TEMPLATE/` | Idea + experiment templates with required metadata fields. |
| `docs/` | Operating notes, programme guides, experiment briefs. |
| `docs/templates/` | Markdown scaffolds used when authoring new briefs or lab notes. |
| `experiments/` | Time-sequenced experiment directories with lab notes and datasets. |
| `scripts/` | Utility automation (e.g., bootstrap a new experiment folder). |

## Workflow

1. **Capture** — Open an issue with the “Horizon Idea” template, linking relevant n00-frontiers standards and desired automation outcomes.
2. **Plan** — Flesh out an experiment brief (copy `docs/templates/experiment-brief.md`) and commit it under `docs/experiments/<slug>.md`.
3. **Run** — Create an experiment workspace via `scripts/new-experiment.sh`, iterate, and log findings in `lab-notes.md`.
4. **Automate** — Wire training or evaluation through `n00t` (e.g., use the `school.trainingRun` capability with the new n00-school pipelines).
5. **Promote** — Once successful, raise pull requests in the downstream repos (n00t, n00-frontiers, n00-cortex) and update the GitHub Project board.

See `docs/` for detailed guidance, checklists, and linkage back to n00-frontiers. Starter kits/staging assets migrated from the temporary `stuff/` directory are catalogued in `n00-frontiers/docs/overview/starter-kits.md`.
