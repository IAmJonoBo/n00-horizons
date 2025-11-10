---
id: job-your-slug
title: Job Title
lifecycle_stage: deliver
status: queued
owner: owner-handle
sponsors: []
source: internal
review_date: 31-12-2025
erpnext_project: PM-TEMPLATE
erpnext_task: TASK-2025-00000
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - delivery/job
  - governance/project-management
links: []
---

> **Metadata guardrails**
>
> - Use `DD-MM-YYYY` for every date (`review_date`, timeline entries, updates).
> - Keep tone in Oxford English and cite measurements in metric units.
> - `erpnext_project` / `erpnext_task` values are sourced by the ERPNext helpers at `n00tropic/.dev/automation/scripts/helpers/erpnext-env.sh` (consumed by `run-erpnext-jobs.sh`, `erpnext-export.sh`, `erpnext-verify-checksums.sh`, and `erpnext-sync-pm.py`).
> - All jobs reference the unified board: `https://github.com/orgs/n00tropic/projects/1`.

# Job: Job Title _(See `n00-horizons/jobs/job-your-slug/README.md` for the living reference implementation.)_

## Objective

- Describe the measurable outcome and definition of done.
- Call out frontier-quality expectations (performance, compliance, UX, etc.).

## Inputs & Dependencies

- Upstream artefacts, ADRs, or experiments.
- Systems, repos, or data the job relies on.

## Quality Gates

1. Enumerate CI / capability runs that must pass (e.g., `meta-check`, `pip-audit`, dataset validation).
2. Include manual reviews (architecture, security, accessibility) where applicable.

## Traceability & Telemetry

- Document which GitHub/ERPNext records are updated.
- Reference the `n00tropic` GitHub board (Project 1) and include ERPNext IDs from the automation helpers above.
- Note where capability logs or artefacts are stored (e.g., `.dev/automation/artifacts/project-sync/job-foo.json`).

## Notes & Updates

- Capture status changes, escalations, and handoffs.
