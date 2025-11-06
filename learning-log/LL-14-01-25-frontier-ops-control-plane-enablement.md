---
id: learn-2025-01-14-fops
title: Frontier Ops Control Plane Enablement
lifecycle_stage: discover
status: recorded
owner: platform-ops
tags:
- governance/project-management
- automation/n00t
- integration/erpnext
- dx/frontier-standards
- knowledge/learning-log
review_date: '2025-02-14'
erpnext_project: PM-FOPS-CTRL
github_project: https://github.com/users/IAmJonoBo/projects/5
links:
- type: idea
  path: ../ideas/idea-frontier-ops-control-plane/README.md
- type: project
  path: ../../../n00tropic_HQ/99. Internal-Projects/IP-3-frontier-ops-control-plane/IP-3-frontier-ops-control-plane.md
related_projects:
- project-frontier-ops-control-plane
recorded: '2025-11-06'
---
# Learning Log – Frontier Ops Control Plane Enablement

## Observations

- Cookiecutter post-gen hook failed outside the n00-frontiers repo because `_shared` wasn’t on `PYTHONPATH`, halting non-interactive provisioning.
- GitHub CLI `gh project copy` surfaced the “required flag(s) "title" not set” error, blocking blueprint application when guardrails were absent.
- Control-plane pilot lacked a standard script to prime dashboards/alerts, and there was no documented path for agents to complete the Grafana+alert baseline work.

## Insights

- Post-gen hooks must degrade gracefully; embedding a fallback keeps template generation usable for agents and CI even when helper modules are unavailable.
- Wrapping `gh project create --copy-file` in an automation script eliminates the missing flag error and normalises project creation across humans/agents.
- Recording a baseline observability plan (Grafana panels + alerting) in the runbook ensures the pilot objectives translate directly into backlog items and measurable telemetry.

## Actions Taken

1. Added defensive import fallback in the project-management post-gen hook so `_shared` utilities are optional.
2. Created `.dev/automation/scripts/github-project-apply-blueprint.sh` with template-number awareness so `gh project copy` always receives required flags, plus fallbacks when running without a template ID.
3. Updated the project orchestration runbook to surface the new script, blueprint workflow, and automation ordering for agents.
4. Captured baseline Grafana dashboard + alert definitions under `observability/` and linked them from the charter so telemetry expectations are codified.

## Next Steps

- Wire baseline Grafana dashboard + alert rules, commit JSON definitions, and attach to the project backlog.
- Import `PM-FOPS-CTRL` blueprint into ERPNext staging using the published script stub and record execution in project sync artefacts.
- Capture automation results via `project.sync.github`/`project.sync.erpnext` and update the control-plane charter with observations.
