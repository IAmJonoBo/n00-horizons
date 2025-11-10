---
id: job-your-slug
title: Job Card Template Hardening & Reference Pack
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: control-tower
review_date: 31-03-2026
erpnext_project: PM-FOPS-CTRL
erpnext_task: TASK-2025-00021
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - delivery/job
  - governance/project-management
  - automation/n00t
links:
  - type: doc
    path: n00tropic-cerebrum/n00-horizons/docs/templates/job-card.md
  - type: idea
    path: n00tropic-cerebrum/n00-horizons/ideas/idea-control-tower-automation-hardening/README.md
  - type: project
    path: n00tropic_HQ/98. Internal-Projects/IP-3-frontier-ops-control-plane/IP-3-frontier-ops-control-plane.md
---

# Job: Job Card Template Hardening & Reference Pack

## Objective

Establish a production-ready "job card" template that agents and automation can apply without hand-editing.
The job should output:

- opinionated metadata defaults (ERPNext / GitHub / review cadence) enforced through `.dev/automation/scripts/autofix-project-metadata.py`,
- runnable examples in `docs/templates/job-card.md`, and
- updated Control Tower references so preflight/radar treat the template like any other slice.

## Inputs & Dependencies

- `docs/templates/job-card.md` – baseline Diátaxis narrative that needs richer examples.
- `n00-horizons/docs/project-conflict-resolution.md` – canonical guardrails for ownership & escalation.
- `project.autofixLinks` capability – ensures template links stay canonical when files relocate.

## Quality Gates

1. `python3 cli.py preflight --paths n00-horizons/jobs/job-your-slug/README.md` passes with status `ok`.
2. Control Panel watchlist no longer shows `job-your-slug` as a metadata gap.
3. Template consumers (`job-record-*` scaffolds, MCP agents) can copy front matter without violating schema or taxonomy rules.

## Traceability & Telemetry

- Capture template updates via `project.capture` to refresh `n00-cortex/data/catalog/projects.json`.
- Store rendered diffs in `.dev/automation/artifacts/project-sync/job-your-slug-*`.
- Link n00t capability runs (`project.capture`, `project.autofixLinks`) back to this job so we can audit automated rewrites.

## Notes & Updates

- 09-11-2025: Template promoted from documentation-only to a first-class metadata artefact so Control Tower can reason about it.
- 10-11-2025: Added cross-links to idea-control-tower-automation-hardening and the IP-3 control-plane charter to keep the metadata lineage intact.
