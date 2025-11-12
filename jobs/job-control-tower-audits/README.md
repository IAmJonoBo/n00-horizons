---
id: job-control-tower-audits
title: "Control Tower \u2013 Registry & Lifecycle Audits"
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: internal
review_date: 31-12-2025
erpnext_project: PM-FOPS-CTRL
erpnext_task: TASK-2025-00010
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - delivery/job
  - governance/project-management
  - automation/n00t
  - integration/github
  - integration/erpnext
links:
  - type: adr
    path: n00tropic-cerebrum/1. Cerebrum Docs/ADR/ADR-004-unified-project-management-system.md
  - type: doc
    path: n00tropic-cerebrum/n00-horizons/docs/job-pipeline.md
---

# Job: Control Tower – Registry & Lifecycle Audits

## Objective

Build the nightly “control tower” auditor that reconciles every metadata document, flags overdue review dates, and highlights missing GitHub/ERPNext bindings. The job outputs machine-readable findings, raises warnings in `project.capture` telemetry, and blocks releases when governance drift appears.

## Inputs & Dependencies

- `n00-cortex/data/catalog/projects.json` (authoritative registry)
- `.dev/automation/scripts/project-orchestration.py` + registry helpers
- ERPNext + GitHub API tokens for cross-system validation
- Telemetry destination: `.dev/automation/artifacts/project-sync/` + `12-Platform-Ops/telemetry/`

## Quality Gates

1. Control tower script must run under `meta-check` and fail the pipeline on blocking findings.
2. JSON report schema reviewed + stored in `n00-cortex/schemas/` with unit tests.
3. Evidence of ERPNext + GitHub reconciliation (counts, discrepancies) attached to each run.
4. Documentation added to `1. Cerebrum Docs/` describing the alert policy.

## Traceability & Telemetry

- Register outputs via `project.capture` after each milestone.
- Log run metadata to `.dev/automation/artifacts/automation/agent-runs.json` with `capability=project.controlTower` (new capability to be added).
- Reference run IDs when updating ERPNext Projects or GitHub issues.
- Publish a human-readable snapshot by regenerating [`docs/control-panel.md`](../../docs/control-panel.md) via `project.controlPanel`; this wires the lifecycle radar JSON, latest preflight artefacts, and outstanding job list straight into the planning dashboard so the Control Tower view always reflects the current readiness signal.
- Embed the generated panel (or link to it) in Control Tower status updates and escalate any `status = attention` entries before the nightly job runs.

## Notes & Updates

- TODO: Define severity rubric (blocking vs. advisory) and automation for notifying owners.
