# Horizons Operating Notes

This directory stores working documents that complement the guidance in the [n00-frontiers operating canon](../n00-frontiers/docs/workflows/horizons-project-management.md). Every accepted idea should reference one of these briefs before work begins.

- `experiments/` — experiment-specific briefs (one per initiative).
- `programmes/` — optional programme or initiative overviews.
- `templates/` — markdown scaffolds for new briefs and lab notes.

## Experiment brief lifecycle

1. Duplicate `templates/experiment-brief.md` into `docs/experiments/<slug>.md`.
2. Fill in hypothesis, datasets, automation plan, and acceptance signals.
3. Link the brief from the corresponding GitHub issue and experiment workspace.
4. Update the brief after each major milestone and reference telemetry coming from `n00-school` / `n00t`.

Keep documents lightweight but precise—every section should map to the automation that will eventually land in the productized repositories.
