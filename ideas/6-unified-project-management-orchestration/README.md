# Idea: Unified Project Management Orchestration

---
metadata:
  id: idea-006
  lifecycle_stage: discover
  tags:
    - governance/project-management
    - automation/n00t
    - integration/erpnext
  owner: product-office
  requested_by: leadership-council
  source: internal-initiative
  created: 2025-01-14
  review_date: 2025-02-01

## Problem Statement

Operational ideas and research outputs are scattered across multiple repositories and workspace folders, making it difficult to promote them into actionable projects with traceability to GitHub and ERPNext.

## Hypothesis

A harmonised orchestration layer—grounded in shared metadata, tag taxonomy, and automation endpoints—will let n00t promote any artefact into GitHub Projects and ERPNext with minimal human mediation while preserving governance signals.

## Proposed Next Steps

1. Validate metadata schema and tagging taxonomy with Engineering + Platform Ops.
2. Prototype n00t capability (`project.capture`) against a small set of ideas.
3. Define success metrics (time-to-issue, ERPNext sync accuracy) for the pilot.

## Open Questions

- Do we require bi-directional syncing for every ERPNext task or can we treat ERPNext as downstream only?
- Which teams own curation of the tag taxonomy in n00-cortex?
- How do we capture confidential initiatives that cannot be mirrored in GitHub?
