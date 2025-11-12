---
id: job-project-autofix-links
title: project.autofixLinks Capability
lifecycle_stage: deliver
status: in-progress
owner: platform-ops
sponsors:
  - product-office
source: agent-workflow
review_date: 09-12-2025
erpnext_project: PM-FOPS-CTRL
erpnext_task: TASK-2025-00001
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - delivery/job
  - automation/n00t
links:
  - type: idea
    path: n00tropic-cerebrum/n00-horizons/ideas/idea-control-tower-automation-hardening/README.md
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

## Delivery Plan (Accelerated)

1. **Capability shell + Python entrypoint** – add `.dev/automation/scripts/project-autofix-links.sh` + `project_autofix_links.py` mirroring the structure of `project-control-panel.*`. Wire in `lib/project_metadata` so relative-path discovery works for ideas, jobs, HQ docs, and Renovate manifests.
2. **Metadata rewrite engine** – leverage the registry + repo map from `project_metadata.py` to detect stale links, update them in place, and emit a diff block saved under `.dev/automation/artifacts/project-autofix-links/<doc>.json`. Include dry-run + `--apply` modes so agents can stage fixes locally.
3. **Capability manifest + docs** – register `project.autofixLinks` in `n00t/capabilities/manifest.json` (CLI + MCP) and extend `PROJECT_ORCHESTRATION.md`, `docs/autoresolution-playbook.md`, and Control Tower runbooks with invocation guidance/examples.
4. **Telemetry & tests** – add fixtures under `n00-horizons/tests/` plus CLI smoke tests (ideas + jobs + HQ charters). Update `meta-check` to call the capability in dry-run mode to guard against regressions.
5. **Roll-out** – run the capability across the registry + HQ docs, attach artefacts to this job’s `Notes & Updates`, and broadcast in the control panel so agents can rely on automated link remediation going forward.

## Notes & Updates

- 10-11-2025: Elevated to **in-progress** so the autoresolution loop has a working remediation capability. Acceleration plan focuses on building the CLI entrypoint, output artefacts, and MCP exposure before the next radar/control-panel refresh.
- 09-11-2025: Job queued via automation. Pending integration IDs + QA plan.
