---
id: job-erpnext-export-resilience
title: ERPNext Export Resilience Guardrails
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - finance-ops
source: internal
review_date: 31-12-2025
erpnext_project: PM-UNIFIED
erpnext_task: TASK-2025-00003
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - delivery/job
  - integration/erpnext
  - automation/ci-cd
  - governance/project-management
links:
  - type: doc
    path: ../../../../.dev/automation/scripts/erpnext-export.sh
  - type: doc
    path: ../../../../n00tropic_HQ/12-Platform-Ops/README.md
---

# Job: ERPNext Export Resilience Guardrails

## Objective

Enhance the ERPNext export pipeline with schema validation, row-count heuristics, checksum comparisons, and automatic alerting when exports fall back to placeholders.

## Inputs & Dependencies

- `.dev/automation/scripts/erpnext-export.sh`
- ERPNext API credentials + module endpoints
- Destination directories under `05-Finance-Procurement`, `02-Revenue`, `04-People`, `03-Delivery`
- Telemetry store `12-Platform-Ops/telemetry/`

## Quality Gates

1. Add schema validation for each module export (JSON + CSV) using `n00-cortex/schemas/`.
2. Compare new exports to last successful snapshot; fail capability if variance exceeds thresholds.
3. Record fallback/placeholder usage in telemetry + Slack/alerting hook.
4. Update docs + runbooks describing remediation steps.

## Traceability & Telemetry

- Each run writes enriched telemetry with validation stats, stored alongside existing export JSON.
- `project.capture` summarises new guardrails and references relevant commits/PRs.
- ERPNext/Finance owners ack anomalies via tracked comments in job log.

## Notes & Updates

- Consider adding data freshness dashboards in `n00-dashboard` once guardrails land.
