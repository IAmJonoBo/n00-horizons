---
id: job-hq-link-auditor
title: HQ ↔ Generator Link Auditor
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
  - governance/project-management
  - dx/frontier-standards
links:
  - type: doc
    path: n00tropic_HQ/START HERE/README.md
  - type: doc
    path: n00tropic-cerebrum/n00tropic/README.md
---

# Job: HQ ↔ Generator Link Auditor

## Objective

Create a linter that scans HQ handbooks/README files for stale or missing references into the automation repos (n00-frontiers, n00-cortex, n00t, etc.). The auditor should fail CI when links break and optionally auto-suggest fixes.

## Inputs & Dependencies

- HQ directory tree + `n00tropic/` docs
- Python or Node tooling for markdown parsing
- Link manifest referencing known repo paths/templates

## Quality Gates

1. Auditor integrated into `meta-check` + a standalone CLI (e.g., `.dev/automation/scripts/audit-links.sh`).
2. Reports specify broken links, missing references, or outdated anchors with remediation guidance.
3. Optional autofix mode updates markdown when path changes are mechanical.
4. ADR or runbook documenting coverage + how to expand to additional directories.

## Traceability & Telemetry

- `project.capture` logs each remediation wave; attach diffs referencing updated docs.
- Telemetry summarizing link health stored under `.dev/automation/artifacts/documentation/link-audit.json`.

## Notes & Updates

- Stretch goal: integrate with Renovate/Trunk to run on doc-only PRs automatically.
