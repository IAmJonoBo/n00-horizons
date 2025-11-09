---
id: job-project-autofix-links
title: project.autofixLinks Capability
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: agent-workflow
review_date: "2025-12-09"
erpnext_project: PM-FOPS-CTRL
github_project: https://github.com/users/IAmJonoBo/projects/6
tags:
  - delivery/job
  - automation/n00t
links:
  - type: idea
    path: ../../ideas/idea-control-tower-automation-hardening/README.md
---

# Job: project.autofixLinks Capability

## Objective

- Ship a new `project.autofixLinks` capability (CLI + manifest entry) that
  inspects a metadata document, rewrites broken relative links using the
  workspace repo map, and records remediation warnings.
- Update `PROJECT_ORCHESTRATION.md` + control panel guidance so agents know
  when to invoke the capability during the readiness loop.
- Definition of done: capability available via `n00t`, artefact logged under
  `.dev/automation/artifacts/project-sync/`, docs + examples merged, and
  radar/control-panel workflows reference the new guardrail.

## Inputs & Dependencies

- `n00tropic/.dev/automation/scripts/project_record_job.py` (link parsing
  helpers) and `lib/project_metadata.py` (path resolution) for shared logic.
- `n00t/capabilities/manifest.json` +
  `n00t/START HERE/PROJECT_ORCHESTRATION.md` for documentation updates.
- Control Tower idea (#idea-control-tower-automation-hardening) sets the scope
  for remediation tooling.

## Quality Gates

1. `meta-check.sh` passes after changes (schema + lint).
2. Unit/CLI proof: run the new capability against sample docs (ideas, jobs, HQ
   artefacts) and attach before/after evidence in Notes.
3. `project.preflight --path
n00-horizons/jobs/job-project-autofix-links/README.md` returns `status=ok`
   with no outstanding downstream TODOs once integration IDs are set.
4. Docs review by product-office confirming the runbook additions align with
   n00-frontiers guardrails.

## Traceability & Telemetry

- Capability run logs stored under
  `.dev/automation/artifacts/project-sync/job-project-autofix-links*.json` plus
  the new remediation artefacts (e.g.,
  `.dev/automation/artifacts/project-autofix-links/<doc>.json`).
- GitHub/ERPNext fields to be populated once downstream boards exist; capture
  IDs here before starting delivery work.

## Notes & Updates

- 2025-11-09: Job queued via automation. Pending integration IDs + QA plan.
