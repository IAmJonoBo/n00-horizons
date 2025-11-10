---
id: job-capability-playbooks
title: Capability Playbook Upgrades
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: agent-workflow
review_date: 09-12-2025
erpnext_project: PM-FOPS-CTRL
erpnext_task: TASK-2025-00006
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - automation/n00t
  - delivery/job
  - governance/project-management
links:
  - type: idea
    path: ../../ideas/idea-control-tower-automation-hardening/README.md
---

# Job: Capability Playbook Upgrades

## Objective

- Produce evergreen playbooks for every Control Tower capability (`project.capture`, `project.preflight`, `project.lifecycleRadar`, `project.controlPanel`, `project.autofixLinks`, etc.) covering inputs, outputs, required metadata, QA steps, and telemetry expectations.
- Publish the playbooks inside `n00t/START HERE/PROJECT_ORCHESTRATION.md`, a new `docs/capability-playbooks.md`, and Copilot instructions so both humans and agents can execute “Go” workflows without ambiguity.
- Definition of done: documentation reviewed, referenced from control panel + Swift app plan, and linked in the idea/job metadata.

## Inputs & Dependencies

- Existing runbook (`n00t/START HERE/PROJECT_ORCHESTRATION.md`) and Copilot instructions.
- Control Tower idea and the jobs delivering automation features.
- Feedback from platform-ops + frontiers-core on required QA/TA checklists.

## Quality Gates

1. Documentation lint passes (`markdownlint`, `meta-check`).
2. Playbook entries reviewed by product-office + platform-ops.
3. Each capability section includes: invocation example, required metadata, QA gates, telemetry/log path, and failure handling.
4. `project.preflight` for this job returns `ok` after integration IDs are backfilled.

## Traceability & Telemetry

- Artefacts captured in `.dev/automation/artifacts/project-sync/job-capability-playbooks*.json` and referenced from control panel “Outstanding Jobs”.
- Set GitHub/ERPNext fields once governance board + ERP project exist.

## Notes & Updates

- 2025-11-09: Job created; awaiting assignment + integration mapping.
