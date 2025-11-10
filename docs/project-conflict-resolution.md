---
id: doc-conflict-resolution
title: Slice Conflict Resolution Playbook
lifecycle_stage: deliver
status: active
owner: project-office
sponsors:
  - platform-ops
source: automation-rollout
review_date: 01-06-2025
erpnext_project: PM-UNIFIED
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - governance/project-management
  - automation/n00t
  - knowledge/learning-log
links:
  - type: runbook
    path: ../n00t/START HERE/PROJECT_ORCHESTRATION.md
  - type: learning-log
    path: ../n00-horizons/learning-log/LL-14-01-25-frontier-ops-control-plane-enablement.md
---

# Slice Conflict Resolution Playbook

## Purpose

Keep multiple project briefs, plans, and handover notes in sync by flagging conflicting metadata early, logging them in shared learning logs, and guiding agents through remediation. Use this whenever `artifacts/slices.enriched.json` emits `flags[]` (e.g., duplicate IDs or mismatched statuses).

## Workflow

1. **Generate slices** – run `npm run handover:auto` (or CI workflow) so `scripts/slicing/slice_plan.py` ingests `Next_Steps*.md`, Horizons docs, and `n00tropic_HQ/98. Internal-Projects/**`.
2. **Inspect flags** – conflicts appear in `artifacts/slices.enriched.json[].metadata.flags` and in the automation log append (`docs/automation/LL-14-01-25-frontier-ops-control-plane-enablement.md`).
3. **Triage** – for each flag:
   - `conflict/document-id/<id>` – multiple documents share the same `id`. Decide the source of truth, update front matter, or merge content.
   - `conflict/status-mismatch/<id>` – same `id` but inconsistent `status`. Align lifecycle/status across artefacts and rerun automation.
4. **Resolve** – update the canonical doc(s), run `project.capture` for each changed file, then rerun `npm run handover:auto` to clear the flags.
5. **Document** – add a short note to the relevant learning log entry describing the resolution (include evidence links to PRs/issues/Grafana dashboards).

## Logging & Handover

- Every automation run appends a summary of material slices plus `flags` to whichever automation log you pass via `LEARNING_LOG_PATH`; reference this log inside your agent handover packet alongside `artifacts/slices.enriched.json` and `artifacts/project-slices.json`.
- When a flag persists across >2 runs, raise a task in the owning GitHub Project column (`project.sync.github`) and tag with `governance/project-management` + `automation/n00t`.
- After applying fixes, rerun `project.capture` plus `project.sync.github` and `project.sync.erpnext` for the updated doc so external systems receive the resolved state.

## Autoresolution Hooks

- **Metadata autofix** – run `.dev/automation/scripts/autofix-project-metadata.py --apply` before triage to normalise tag aliases, lifecycle enums, and date formats (DD-MM-YYYY). The script consumes the same helpers sourced from `n00tropic/.dev/automation/scripts/helpers/erpnext-env.sh`, so ERPNext codes remain canonical.
- **Link remediation** – run `.dev/automation/scripts/project-autofix-links.sh --path <doc> [--apply]` (capability `project.autofixLinks`, see `jobs/job-project-autofix-links/README.md`) to rewrite `links[]` with canonical paths, add reciprocal references, and emit a remediation artefact under `.dev/automation/artifacts/project-autofix-links/`.
- **Agent readiness loop** – add `project.preflight --autofix` (when available) to your run to chain `project.capture`, `project.sync.*`, and the autofix scripts. Record artefact paths in the learning log so downstream agents can replay the edge-case resolution.

## Acceptance

- No unresolved `conflict/*` flags in `artifacts/slices.enriched.json`.
- Impacted docs captured via `project.capture` with fresh registry entries.
- Learning log entry records the resolution and evidence links.
- CI `playbook-automation` workflow green.
