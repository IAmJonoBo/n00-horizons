---
id: idea-control-tower-automation-hardening
title: Control Tower Automation Hardening
lifecycle_stage: discover
status: proposed
owner: platform-ops
sponsors:
  - product-office
source: agent-workflow
tags:
  - automation/n00t
  - governance/project-management
  - knowledge/idea
review_date: 31-03-2026
erpnext_project: PM-FOPS-CTRL
github_project: https://github.com/orgs/n00tropic/projects/1
links:
  - type: job
    path: n00tropic-cerebrum/n00-horizons/jobs/job-capability-playbooks/README.md
  - type: job
    path: n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-audits/README.md
  - type: job
    path: n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-swift-m1/README.md
  - type: job
    path: n00tropic-cerebrum/n00-horizons/jobs/job-lifecycle-radar-consolidation/README.md
  - type: job
    path: n00tropic-cerebrum/n00-horizons/jobs/job-project-autofix-links/README.md
  - type: learning-log
    path: n00tropic-cerebrum/n00-horizons/learning-log/LL-14-01-25-frontier-ops-control-plane-enablement.md
  - type: project
    path: n00tropic_HQ/98. Internal-Projects/IP-3-frontier-ops-control-plane/IP-3-frontier-ops-control-plane.md
created: 09-11-2025
---

# Idea: Control Tower Automation Hardening

## Problem Statement

Control Tower signals (radar, control panel, job registry) are generated manually and lack self-healing. Missing links in metadata, inconsistent capability docs, and absent GUI orchestration make handovers fragile and force operators to inspect JSON artifacts directly. Without automation hardening, ideas cannot be promoted to delivery-ready jobs without bespoke cleanup.

## Hypothesis

If we add autoremediation capabilities (e.g., `project.autofixLinks`), extend lifecycle radar + control panel outputs with consolidation heuristics, document capability playbooks, and ship a Swift Companion UI, then any agent can go from brief → job → QA without touching raw files. Control Tower audits become deterministic, and downstream repos inherit n00-frontiers best practices automatically.

## Proposed Next Steps

1. Build the `project.autofixLinks` capability so link hygiene issues can be fixed in-line.
2. Enhance lifecycle radar + control panel to surface consolidation warnings and metadata errors by default.
3. Publish capability playbooks describing inputs/outputs, QA gates, and telemetry expectations for every orchestration command.
4. Deliver Control Tower Swift Companion (Milestone 1) to present radar/preflight data and wrap capability execution with a native UX.
5. Harden the project/job/task intake template so briefs carry QA gates, TA criteria, and links before promotion.

## Open Questions

- Do we consolidate the new capabilities into a single MCP surface (`project.autoremediate`) or expose them individually?
- What lightweight datastore should the Swift app use to share telemetry snapshots between operators?
- Which teams (platform-ops, frontiers-core) own long-term maintenance for the control panel + GUI once shipped?

## Open Questions

- What downstream repositories or teams must be informed?
- Are there policy or compliance constraints to surface?
- What evidence is required to promote this idea to a project?
