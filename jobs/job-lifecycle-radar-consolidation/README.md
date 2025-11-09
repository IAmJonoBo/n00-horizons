---
id: job-lifecycle-radar-consolidation
title: Lifecycle Radar Consolidation & Panel Surfacing
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: agent-workflow
review_date: "2025-12-09"
erpnext_project: PM-FOPS-CTRL
github_project: https://github.com/users/IAmJonoBo/projects/6
tags:
  - automation/n00t
  - delivery/job
  - governance/project-management
links:
  - type: idea
    path: ../../ideas/idea-control-tower-automation-hardening/README.md
---

# Job: Lifecycle Radar Consolidation & Panel Surfacing

## Objective

- Control panel doc (`n00-horizons/docs/control-panel.md`) acts as the visible
  dashboard.

## Quality Gates

1. `meta-check.sh` green with updated scripts/tests.
2. Radar + control panel scripts exercised against sample docs, with artefacts
   attached in Notes.
3. Documentation updated (`PROJECT_ORCHESTRATION.md` + Copilot instructions)
   reviewed by product-office.
4. `project.preflight` for this job returns `ok` (post integration IDs) and
   radar output shows expected warnings when feeding synthetic data.

## Traceability & Telemetry

- Automation artefacts live under
  `.dev/automation/artifacts/project-sync/job-lifecycle-radar-consolidation*.json`
  plus the regenerated control panel.
- GitHub/ERPNext linkage TBD—record IDs here before starting delivery
  execution.

## Notes & Updates

- 2025-11-09: Job created. Needs ERPNext/GitHub mapping + owner kickoff.

## Implementation Plan

### Consolidation Heuristics

- Extend `project-lifecycle-radar.py` to capture upstream identifiers from each
  document’s `links[]`. When ≥2 overdue/missing-review artefacts share the same
  upstream entry, emit a `consolidate:<id>` warning with the child paths.
- Flag learning logs older than 90 days that lack downstream jobs (no `links`
  pointing to `job-*`) so owners can archive or promote them.
- Emit a structured `consolidationWarnings[]` block in the radar JSON for easy
  consumption.

### Metadata Warning Surfacing

- Pipe `metadataErrors` into the control panel Markdown as a table grouped by
  document ID with remediation hints (e.g., “run project.autofixLinks”).
- Display a summary counter (“Metadata issues: N documents”) near the Lifecycle
  Radar header for at-a-glance drift detection.

### Control Panel Updates

- Add a “Needs Consolidation” section rendering the new warnings (upstream ID,
  affected docs, recommended action: merge/archive/update).
- Link to the raw radar artefact for drill-down.

### Telemetry & Testing

- Write the enriched radar output to
  `.dev/automation/artifacts/project-sync/lifecycle-radar.json` (existing path)
  and mirror the warning subset to `lifecycle-radar-consolidation.json` for
  external tooling.
- Create synthetic fixtures under `n00-horizons/tests/fixtures/` and wire them
  into `meta-check` so consolidation logic is exercised in CI.
