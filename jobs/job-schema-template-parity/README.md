---
id: job-schema-template-parity
title: Schema ↔ Template Parity Auditor
lifecycle_stage: deliver
status: queued
owner: frontiers-core
sponsors:
  - platform-ops
source: internal
review_date: 2025-12-31
erpnext_project: null
github_project: null
tags:
  - delivery/job
  - dx/frontier-standards
  - automation/n00t
  - automation/ci-cd
links:
  - type: doc
    path: n00tropic-cerebrum/n00-frontiers/docs/overview
  - type: doc
    path: n00tropic-cerebrum/n00-cortex/data/toolchain-manifest.json
---

# Job: Schema ↔ Template Parity Auditor

## Objective

Guarantee every template published from `n00-frontiers` has a matching schema+docs export in `n00-cortex`. Build a parity auditor that diffs catalogs, validates runtime pins, and prevents shipping generators without corresponding schema updates.

## Inputs & Dependencies

- `n00-frontiers/catalog.json`, `control-traceability-matrix.json`
- `n00-cortex/data/catalog/frontiers-*.json`
- Python auditing script invoked by `meta-check`

## Quality Gates

1. Auditor integrated into `.dev/automation/scripts/meta-check.sh` with clear failure messaging.
2. JSON summary stored under `.dev/automation/artifacts/dependencies/schema-template-parity.json`.
3. Unit tests verifying sample drift scenarios.
4. Documentation for remediation steps added to `n00-frontiers/docs/`.

## Traceability & Telemetry

- Capture run outputs via `project.capture` and attach to job log.
- Update GitHub Project items referencing affected templates when drift occurs.

## Notes & Updates

- Future enhancement: emit Renovate dashboard hints when runtime pins mismatch.
