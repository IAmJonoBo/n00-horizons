---
id: job-intake-template-hardening
title: Project & Task Intake Template Hardening
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
  - automation/n00t
  - delivery/job
  - governance/project-management
links:
  - type: idea
    path: ../../ideas/idea-control-tower-automation-hardening/README.md
---

# Job: Project & Task Intake Template Hardening

## Objective

- Update idea/project/job templates + `project_record_job.py` scaffolding so every intake includes QA gates, telemetry expectations, TA criteria, and required links before promotion.
- Create a reusable “Go” checklist snippet (Markdown/JSON) that agents can paste into briefs to confirm metadata + preflight requirements.
- Definition of done: templates merged, runbook updated with the new checklist, and control panel references the intake guidance for future audits.

## Inputs & Dependencies

- Template files under `n00-horizons/docs/templates/` and job scaffolder script in `n00tropic/.dev/automation/scripts/project_record_job.py`.
- Guidance from n00-frontiers QA/TA standards.
- Control panel + capability playbooks to keep messaging consistent.

## Quality Gates

1. `meta-check.sh` succeeds after template + script edits.
2. Templates validated by product-office to ensure QA/TA language aligns with frontier standards.
3. Demonstrate the new intake flow by promoting a sample idea → job using only the updated automation.
4. `project.preflight` for this job returns `ok` post-integration IDs.

## Traceability & Telemetry

- Artefacts saved in `.dev/automation/artifacts/project-sync/job-intake-template-hardening*.json` plus sample “Go checklist” snapshots in `artifacts/intake/`.
- Fill GitHub/ERPNext IDs when governance board/project codes exist.

## Notes & Updates

- 2025-11-09: Job queued; awaiting staffing + board linkage.

## Metadata Enhancements (Scope)

- **Priority / Risk / Effort** fields: add optional front-matter keys (`priority`, `risk`, `effort`) with controlled vocab (p0–p3, high/medium/low, small/medium/large). Update validators + templates so agents set them when promoting work.
- **Lifecycle Sub-States**: extend `lifecycle_stage` taxonomy to include `discover`, `shape`, `deliver`, `archive`, and nested statuses (`in-progress`, `blocked`, `review`, `staging`, `production`, `deprecated`). The job will propose schema updates + guardrails.
- **Role-Based Taxonomy**: document `owner`, `sponsors`, `contributors`, `reviewers` semantics and add optional arrays for contributors/reviewers in templates.
- **Dependency Mapping**: formalise `links[].type` values (`depends_on`, `related_to`, `supersedes`) so downstream automation can reason about blockers.
- **Metrics & KPIs**: add `estimated_effort`, `actual_effort`, `success_criteria`, and `kpis[]` fields to the metadata block, along with runbook guidance.

These changes will be coordinated with `n00-cortex` schema owners, and this job is responsible for drafting the PRs + migration scripts.
