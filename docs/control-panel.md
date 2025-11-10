# Control Panel – Readiness & Lifecycle Snapshot

Generated: 2025-11-09T18:27:59Z

## Quick Links

- [Project Orchestration Runbook](../n00t/START HERE/PROJECT_ORCHESTRATION.md)
- [Task Slice Playbook](task-slice-playbook.md)
- [Job Pipeline](job-pipeline.md)
- Radar JSON: `.dev/automation/artifacts/project-sync/lifecycle-radar.json`

## Lifecycle Radar

Generated: 2025-11-09T18:27:49Z | Documents scanned: 6

| Lifecycle | Count |
| --------- | ----- |
| Discover  | 6     |

**Review Buckets**

- Overdue: 3

- Due 30 Days: 1

## Preflight Watchlist

| ID              | Status    | Issues                                                                                                                                                                                                                                                                                                                                         | Artefact                                                            |
| --------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `job-your-slug` | attention | links[] is empty; cite upstream/downstream slices for traceability.<br>github_project missing for delivery-stage work; set it to `https://github.com/orgs/n00tropic/projects/1` (n00tropic board).<br>erpnext_project missing for delivery-stage work; provide the ERPNext Project code from `.dev/automation/scripts/helpers/erpnext-env.sh`. | .dev/automation/artifacts/project-sync/job-your-slug-preflight.json |

## Outstanding Jobs

| ID                                  | Title                                           | Owner          | Status | Review Date | Doc                                                                              |
| ----------------------------------- | ----------------------------------------------- | -------------- | ------ | ----------- | -------------------------------------------------------------------------------- |
| `job-automation-telemetry-indexer`  | Automation Telemetry Indexer & SLO Dashboard    | platform-ops   | queued | 2025-12-31  | n00tropic-cerebrum/n00-horizons/jobs/job-automation-telemetry-indexer/README.md  |
| `job-capability-contract-tests`     | Capability Contract Test Harness                | platform-ops   | queued | 2025-12-31  | n00tropic-cerebrum/n00-horizons/jobs/job-capability-contract-tests/README.md     |
| `job-capability-playbooks`          | Capability Playbook Upgrades                    | platform-ops   | queued | 2025-12-09  | n00tropic-cerebrum/n00-horizons/jobs/job-capability-playbooks/README.md          |
| `job-control-tower-audits`          | Control Tower – Registry & Lifecycle Audits     | platform-ops   | queued | 2025-12-31  | n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-audits/README.md          |
| `job-control-tower-swift-m1`        | Control Tower Swift Companion – Milestone 1     | frontiers-core | queued | 2025-12-09  | n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-swift-m1/README.md        |
| `job-erpnext-export-resilience`     | ERPNext Export Resilience Guardrails            | platform-ops   | queued | 2025-12-31  | n00tropic-cerebrum/n00-horizons/jobs/job-erpnext-export-resilience/README.md     |
| `job-hq-link-auditor`               | HQ ↔ Generator Link Auditor                    | frontiers-core | queued | 2025-12-31  | n00tropic-cerebrum/n00-horizons/jobs/job-hq-link-auditor/README.md               |
| `job-intake-template-hardening`     | Project & Task Intake Template Hardening        | platform-ops   | queued | 2025-12-09  | n00tropic-cerebrum/n00-horizons/jobs/job-intake-template-hardening/README.md     |
| `job-lifecycle-radar-consolidation` | Lifecycle Radar Consolidation & Panel Surfacing | platform-ops   | queued | 2025-12-09  | n00tropic-cerebrum/n00-horizons/jobs/job-lifecycle-radar-consolidation/README.md |
| `job-project-autofix-links`         | project.autofixLinks Capability                 | platform-ops   | queued | 2025-12-09  | n00tropic-cerebrum/n00-horizons/jobs/job-project-autofix-links/README.md         |
| `job-schema-template-parity`        | Schema ↔ Template Parity Auditor               | frontiers-core | queued | 2025-12-31  | n00tropic-cerebrum/n00-horizons/jobs/job-schema-template-parity/README.md        |

## How to Rebuild

```bash
.dev/automation/scripts/project-lifecycle-radar.sh
.dev/automation/scripts/project-preflight.sh --path <doc>
.dev/automation/scripts/project-control-panel.sh
```
