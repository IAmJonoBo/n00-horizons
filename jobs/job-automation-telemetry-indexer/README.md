---
id: job-automation-telemetry-indexer
title: Automation Telemetry Indexer & SLO Dashboard
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: internal
review_date: "2025-12-31"
erpnext_project: null
github_project: null
tags:
  - delivery/job
  - automation/n00t
  - dx/developer-experience
links:
  - type: doc
    path: ../../../../n00tropic_HQ/12-Platform-Ops/telemetry
  - type: doc
    path: ../../../../.dev/automation/scripts/record-capability-run.py
---

# Job: Automation Telemetry Indexer & SLO Dashboard

## Objective

Aggregate capability run logs, ERP telemetry, and meta-check outputs into a normalized index. Publish rolling SLO metrics (success %, MTTR, export freshness) and surface them via `n00t` + `12-Platform-Ops` dashboards.

## Inputs & Dependencies

- `.dev/automation/artifacts/**`
- `12-Platform-Ops/telemetry/*.json`
- n00t UI components / API for surfacing dashboards

## Quality Gates

1. Indexer script scheduled nightly; failures alert Platform Ops.
2. SLO definitions + thresholds documented (e.g., meta-check success ≥ 95%).
3. Dashboard available inside `n00t` (widgets or static JSON) with drill-down links.
4. Data retention + privacy guardrails documented.

## Traceability & Telemetry

- Log each indexing run via `project.capture` and add summary stats to the job README.
- Attach generated dashboards (JSON/PNG) under `12-Platform-Ops/telemetry/dashboards/`.

## Notes & Updates

- Future iteration: push SLO summaries to `n00-dashboard` once guardrails land.
