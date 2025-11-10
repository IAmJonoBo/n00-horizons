# n00-horizons

Research & development hub for n00tropic. This repository captures ideation, experiments, and programme management for frontier initiatives before they land in productised workspaces.

## Principles

- Operate according to [n00-frontiers › n00-horizons Operating Model](../n00-frontiers/docs/workflows/horizons-project-management.md).
- Every idea becomes a GitHub issue using the provided templates; every active experiment has a living brief in `docs/` and a lab workspace in `experiments/`.
- Automation runs through `n00t`: experiments that prove out must emit capabilities, pipelines, or templates that integrate with `n00t`, `n00-cortex`, and `n00-frontiers`.

## Repository layout

| Path                          | Purpose                                                                                |
| ----------------------------- | -------------------------------------------------------------------------------------- |
| `.github/ISSUE_TEMPLATE/`     | Idea + experiment templates with required metadata fields.                             |
| `docs/`                       | Operating notes, programme guides, experiment briefs.                                  |
| `docs/task-slice-playbook.md` | Canonical guide for slicing tasks, tagging, and recording upstream/downstream impacts. |
| `docs/templates/`             | Markdown scaffolds used when authoring new briefs or lab notes.                        |
| `experiments/`                | Time-sequenced experiment directories with lab notes and datasets.                     |
| `scripts/`                    | Utility automation (e.g., bootstrap a new experiment folder).                          |

## Workflow

1. **Capture** — Open an issue with the “Horizon Idea” template, linking relevant n00-frontiers standards and desired automation outcomes.
2. **Plan** — Flesh out an experiment brief (copy `docs/templates/experiment-brief.md`) and commit it under `docs/experiments/<slug>.md`.
3. **Run** — Create an experiment workspace via `scripts/new-experiment.sh`, iterate, and log findings in `lab-notes.md`.
4. **Automate** — Wire training or evaluation through `n00t` (e.g., use the `school.trainingRun` capability with the new n00-school pipelines).
5. **Promote** — Once successful, raise pull requests in the downstream repos (n00t, n00-frontiers, n00-cortex) and update the GitHub Project board.

See `docs/` for detailed guidance, checklists, and linkage back to n00-frontiers. Starter kits/staging assets migrated from the temporary `stuff/` directory are catalogued in `n00-frontiers/docs/overview/starter-kits.md`.

## Job Intake & Tracking

- Follow [`docs/job-pipeline.md`](docs/job-pipeline.md) to promote any idea/experiment into a tracked job with consistent metadata.
- Use the n00t capabilities `project.recordJob`, `project.capture`, and `project.sync.*` to register, validate, and sync jobs with GitHub Projects + ERPNext.
- All job artefacts live under `jobs/<job-id>/README.md` and include the frontier-grade quality gates, telemetry hooks, and traceability expectations defined in the template.

## Metadata & Automation

- All idea briefs (`ideas/**/README.md`), learning logs (`learning-log/LL-*.md`), and internal project charters (`../n00tropic_HQ/98. Internal-Projects/**`) must include YAML front matter conforming to the shared schema (`n00-cortex/schemas/project-metadata.schema.json`).
- Use n00t capabilities for lifecycle management:
  - `project.recordIdea` – scaffold a new idea directory with compliant metadata.
  - `project.ingestMarkdown` – retrofit metadata onto existing docs or update owners/tags/status in place.
  - `project.capture` / `project.sync.*` – validate, register, and surface upstream/downstream impacts before coordination with GitHub or ERPNext.
- Run `.dev/automation/scripts/validate-project-metadata.py` prior to merges; the check blocks drift (missing links, invalid tags, duplicate IDs). Jobs under `jobs/` are automatically included.
- Canonical tags live in `n00-cortex/data/catalog/project-tags.yaml`. Submit changes via PRs and use `.dev/automation/scripts/autofix-project-metadata.py --apply` to canonicalise aliases locally.

## Readiness & Autoresolution Loop

- Reference the [Autoresolution & Guardrail Playbook](docs/autoresolution-playbook.md) for the end-to-end detection/remediation flow covering lifecycle radar, preflight, and conflict scans.
- Before opening a PR, run `.dev/automation/scripts/autofix-project-metadata.py --apply` and `project.preflight --path <doc>` so date formats (DD-MM-YYYY), ERPNext codes, and the unified GitHub Project URL stay aligned. Capture artefacts in `.dev/automation/artifacts/project-sync/` for handovers.
- Control Tower jobs (`job-project-autofix-links`, `job-lifecycle-radar-consolidation`, `job-control-tower-audits`) provide autoresolution features for n00t agents. Invoke their capabilities (once delivered) via `n00t run <capability>` or the helper scripts under `.dev/automation/scripts/` to fix link drift, refresh dashboards, and push status updates to GitHub + ERPNext automatically.
