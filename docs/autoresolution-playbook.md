---
id: doc-autoresolution-playbook
title: Autoresolution & Guardrail Playbook
lifecycle_stage: deliver
status: reference
owner: platform-ops
sponsors:
  - product-office
source: control-tower
review_date: 31-03-2026
erpnext_project: PM-UNIFIED
github_project: https://github.com/orgs/n00tropic/projects/1
tags:
  - governance/project-management
  - automation/n00t
  - dx/frontier-standards
links:
  - type: job
    path: ../jobs/job-project-autofix-links/README.md
  - type: playbook
    path: task-slice-playbook.md
---

# Autoresolution & Guardrail Playbook

This playbook documents the autoremediation loop that keeps Horizons artefacts synchronised with GitHub Projects, ERPNext, and the downstream repos that rely on the metadata catalog. It is optimised for n00t agents: every command is available as a capability or `.dev/automation` script, and each step emits artefacts that can be attached to handovers or fed back into control-plane telemetry.

## 1. Detection Matrix

| Signal                         | Command / Capability                                                                              | Output                                                        | Notes                                                                           |
| ------------------------------ | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| Lifecycle drift                | `.dev/automation/scripts/project-lifecycle-radar.sh` or `project.lifecycleRadar`                  | `.dev/automation/artifacts/project-sync/lifecycle-radar.json` | Highlights overdue `review_date`, missing `links[]`, or absent integration IDs. |
| Preflight blocking issues      | `.dev/automation/scripts/project-preflight.sh --path <doc>` or `project.preflight`                | `.dev/automation/artifacts/project-sync/<id>-preflight.json`  | Chains capture + sync runs; fails if GitHub/ERPNext metadata is incomplete.     |
| Metadata conflicts             | `npm run handover:auto` (invokes `scripts/slicing/slice_plan.py`)                                 | `n00-cortex/artifacts/slices.enriched.json`                   | Flags duplicate IDs, tag drift, and inconsistent owners/status across sources.  |
| ERPNext / GitHub sync failures | `.dev/automation/scripts/erpnext-sync-pm.py` and `.dev/automation/scripts/project-sync.github.sh` | `*.sync_erpnext.json`, `*.sync_github.json`                   | Provide raw API responses for incident timelines.                               |

## 2. Autoresolution Steps

1. **Autofix metadata** – run `.dev/automation/scripts/autofix-project-metadata.py --apply` before touching the files. The script normalises tag aliases (per `n00-cortex/data/catalog/project-tags.yaml`), coerces every human-readable date into `DD-MM-YYYY`, and ensures `github_project` defaults to `https://github.com/orgs/n00tropic/projects/1`. It sources ERPNext codes through `n00tropic/.dev/automation/scripts/helpers/erpnext-env.sh`, so agents do not have to chase env vars manually.
2. **Repair links** – call `.dev/automation/scripts/project-autofix-links.sh --path <doc>` (capability id `project.autofixLinks`, tracked by `jobs/job-project-autofix-links/README.md`). Use `--apply` to persist fixes after reviewing the generated artefact under `.dev/automation/artifacts/project-autofix-links/`.
3. **Re-run preflight** – invoke `.dev/automation/scripts/project-preflight.sh --path <doc>` so control-plane automation can re-validate review cadence, integration IDs, and downstream syncs with the repaired links in place.
4. **Log evidence** – append the artefact paths produced in steps 1–3 into the relevant learning log (`learning-log/LL-*.md`). This keeps downstream agents informed of the remediation context and prevents duplicate work.

## 3. Agent Workflow Snippets

```bash
# 1) Autofix metadata + tags (idempotent)
.dev/automation/scripts/autofix-project-metadata.py --apply --path n00-horizons/jobs/job-control-tower-audits/README.md

# 2) Repair links (dry-run, then apply)
.dev/automation/scripts/project-autofix-links.sh --path n00-horizons/jobs/job-control-tower-audits/README.md
.dev/automation/scripts/project-autofix-links.sh --path n00-horizons/jobs/job-control-tower-audits/README.md --apply

# 3) Re-run capture + preflight with artefact export
.dev/automation/scripts/project-capture.sh --path n00-horizons/jobs/job-control-tower-audits/README.md
.dev/automation/scripts/project-preflight.sh --path n00-horizons/jobs/job-control-tower-audits/README.md --artefact-dir .dev/automation/artifacts/project-sync/

# 4) Sync external systems and record evidence
.dev/automation/scripts/project-sync.github.sh --path n00-horizons/jobs/job-control-tower-audits/README.md
.dev/automation/scripts/project-sync-erpnext.sh --path n00-horizons/jobs/job-control-tower-audits/README.md
```

Agents should wrap the snippet inside `project.autoresolution` (once defined) or rely on `n00t run plan` to ensure every required artefact is produced before handing off.

## 4. Edge-case Playbooks

- **Missing ERPNext task IDs** – Source them via `run-erpnext-jobs.sh` + `erpnext-export.sh`. The helper `n00tropic/.dev/automation/scripts/helpers/erpnext-env.sh` is already loaded by the automation tasks, so `project.sync.erpnext` can pick up the credentials without extra work.
- **Board permissions (GitHub 403)** – Use an organisation-scoped fine-grained token (Projects + Project Items scopes) and store it in the agent keychain so `github-project-apply-blueprint.sh` and `project.sync.github` stay non-interactive.
- **Airgapped remediation** – Export the radar + preflight artefacts to the `artifacts/` folder and circulate them with the control panel Markdown. Agents can then apply metadata updates offline, rerun the autofix script, and check the results back in when connectivity returns.

## 5. References

- [`docs/project-conflict-resolution.md`](project-conflict-resolution.md) – Detailed conflict triage steps and learning-log expectations.
- [`docs/task-slice-playbook.md`](task-slice-playbook.md) – Required metadata fields, tagging conventions, and impact worksheets.
- [`docs/control-panel.md`](control-panel.md) – Daily snapshot of lifecycle counts, overdue reviews, and outstanding jobs.
- [`jobs/job-project-autofix-links/README.md`](../jobs/job-project-autofix-links/README.md) – Delivery plan for the automated link remediation capability.
