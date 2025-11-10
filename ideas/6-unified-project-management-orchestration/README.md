---
id: idea-006
title: Unified Project Management Orchestration
lifecycle_stage: discover
status: proposed
owner: product-office
sponsors:
  - leadership-council
source: internal-initiative
tags:
  - governance/project-management
  - automation/n00t
  - integration/erpnext
  - knowledge/idea
review_date: 31-03-2026
erpnext_project: PM-UNIFIED
github_project: https://github.com/orgs/n00tropic/projects/1
links:
  - type: charter
    path: ../../../../n00tropic_HQ/98. Internal-Projects/IP-2-unified-project-management-system/IP-2-unified-project-management-system.md
---

# Idea: Unified Project Management Orchestration

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
