---
id: job-control-tower-audits
title: Control Tower – Registry & Lifecycle Audits
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: internal
review_date: 2025-12-31
erpnext_project: null
github_project: null
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

## Notes & Updates

- TODO: Define severity rubric (blocking vs. advisory) and automation for notifying owners.
