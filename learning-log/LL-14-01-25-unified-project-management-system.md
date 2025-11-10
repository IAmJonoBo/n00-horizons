---
id: learn-2025-01-14-upms
title: Unified Project Management System Spike
lifecycle_stage: discover
status: recorded
owner: codex-assist
tags:
  - governance/project-management
  - automation/n00t
  - integration/erpnext
  - knowledge/learning-log
review_date: 14-02-2025
erpnext_project: PM-UNIFIED
github_project: https://github.com/orgs/n00tropic/projects/1
links:
  - type: project
    path: ../../../n00tropic_HQ/98. Internal-Projects/IP-2-unified-project-management-system/IP-2-unified-project-management-system.md
related_projects:
  - project-ip-002
recorded: 14-01-2025
---

# Learning Log – 14-01-2025 – Unified Project Management System Spike

## Observations

- Upstream artefacts lack consistent metadata, making automated classification impossible.
- Existing directories (ideas, internal projects) provide the right separation, but no machine-readable bridge exists today.

## Insights

- Shared YAML front matter offers a lightweight yet expressive format that works for Markdown, Jupyter Book, and automation tooling.
- Central tag governance in n00-cortex prevents label drift between GitHub and ERPNext.
- n00t orchestration should expose idempotent commands (`capture`, `sync.github`, `sync.erpnext`) so agents can retry safely.

## Next Steps

1. Draft metadata schema in n00-cortex and add validation tests to n00-frontiers.
2. Prototype capture workflow against the new idea and project charter created today.
3. Align with Platform Ops on ERPNext project/task naming conventions.
