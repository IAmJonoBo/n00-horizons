# Control Panel – Readiness & Lifecycle Snapshot

Generated: 10-11-2025T19:39:39Z

## Quick Links

- [Project Orchestration Runbook](../n00t/START HERE/PROJECT_ORCHESTRATION.md)
- [Task Slice Playbook](task-slice-playbook.md)
- [Job Pipeline](job-pipeline.md)
- Radar JSON: `.dev/automation/artifacts/project-sync/lifecycle-radar.json`

## Lifecycle Radar

Generated: 10-11-2025T19:39:20Z | Documents scanned: 6

| Lifecycle | Count |
| --------- | ----- |
| Discover  | 6     |

**Review Buckets**

## Preflight Watchlist

| ID                                        | Status    | Issues                                                                                                                                                                                                                                                    | Artefact                                                                                      |
| ----------------------------------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `idea-control-tower-automation-hardening` | attention | job -> n00tropic-cerebrum/n00-horizons/jobs/job-capability-playbooks/README.md<br>job -> n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-audits/README.md<br>job -> n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-swift-m1/README.md<br>… | .dev/automation/artifacts/project-sync/idea-control-tower-automation-hardening-preflight.json |
| `job-your-slug`                           | attention | project -> n00tropic_HQ/98. Internal-Projects/IP-3-frontier-ops-control-plane/IP-3-frontier-ops-control-plane.md                                                                                                                                          | .dev/automation/artifacts/project-sync/job-your-slug-preflight.json                           |
| `learn-14-01-2025-fops`                   | attention | project -> n00tropic_HQ/98. Internal-Projects/IP-3-frontier-ops-control-plane/IP-3-frontier-ops-control-plane.md                                                                                                                                          | .dev/automation/artifacts/project-sync/learn-14-01-2025-fops-preflight.json                   |
| `learn-14-01-2025-upms`                   | attention | project -> n00tropic_HQ/98. Internal-Projects/IP-2-unified-project-management-system/IP-2-unified-project-management-system.md                                                                                                                            | .dev/automation/artifacts/project-sync/learn-14-01-2025-upms-preflight.json                   |
| `project-frontier-ops-control-plane`      | attention | evidence -> n00tropic_HQ/98. Internal-Projects/IP-3-frontier-ops-control-plane/erpnext/erpnext_import_resp.json                                                                                                                                           | .dev/automation/artifacts/project-sync/project-frontier-ops-control-plane-preflight.json      |
| `idea-006`                                | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/idea-006-preflight.json                                |
| `idea-frontier-ops-control-plane`         | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/idea-frontier-ops-control-plane-preflight.json         |
| `job-automation-telemetry-indexer`        | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-automation-telemetry-indexer-preflight.json        |
| `job-capability-contract-tests`           | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-capability-contract-tests-preflight.json           |
| `job-capability-playbooks`                | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-capability-playbooks-preflight.json                |
| `job-control-tower-audits`                | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-control-tower-audits-preflight.json                |
| `job-control-tower-swift-m1`              | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-control-tower-swift-m1-preflight.json              |
| `job-erpnext-export-resilience`           | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-erpnext-export-resilience-preflight.json           |
| `job-hq-link-auditor`                     | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-hq-link-auditor-preflight.json                     |
| `job-intake-template-hardening`           | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-intake-template-hardening-preflight.json           |
| `job-lifecycle-radar-consolidation`       | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-lifecycle-radar-consolidation-preflight.json       |
| `job-project-autofix-links`               | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-project-autofix-links-preflight.json               |
| `job-schema-template-parity`              | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/job-schema-template-parity-preflight.json              |
| `project-ip-002`                          | ok        | —                                                                                                                                                                                                                                                         | .dev/automation/artifacts/project-sync/project-ip-002-preflight.json                          |

## Outstanding Jobs

| ID                                  | Title                                           | Owner          | Status      | Review Date | Doc                                                                              |
| ----------------------------------- | ----------------------------------------------- | -------------- | ----------- | ----------- | -------------------------------------------------------------------------------- |
| `job-automation-telemetry-indexer`  | Automation Telemetry Indexer & SLO Dashboard    | platform-ops   | queued      | 31-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-automation-telemetry-indexer/README.md  |
| `job-capability-contract-tests`     | Capability Contract Test Harness                | platform-ops   | queued      | 31-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-capability-contract-tests/README.md     |
| `job-capability-playbooks`          | Capability Playbook Upgrades                    | platform-ops   | queued      | 09-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-capability-playbooks/README.md          |
| `job-control-tower-audits`          | Control Tower – Registry & Lifecycle Audits     | platform-ops   | queued      | 31-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-audits/README.md          |
| `job-control-tower-swift-m1`        | Control Tower Swift Companion – Milestone 1     | frontiers-core | queued      | 09-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-control-tower-swift-m1/README.md        |
| `job-erpnext-export-resilience`     | ERPNext Export Resilience Guardrails            | platform-ops   | queued      | 31-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-erpnext-export-resilience/README.md     |
| `job-hq-link-auditor`               | HQ ↔ Generator Link Auditor                    | frontiers-core | queued      | 31-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-hq-link-auditor/README.md               |
| `job-intake-template-hardening`     | Project & Task Intake Template Hardening        | platform-ops   | queued      | 09-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-intake-template-hardening/README.md     |
| `job-lifecycle-radar-consolidation` | Lifecycle Radar Consolidation & Panel Surfacing | platform-ops   | queued      | 09-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-lifecycle-radar-consolidation/README.md |
| `job-project-autofix-links`         | project.autofixLinks Capability                 | platform-ops   | in-progress | 09-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-project-autofix-links/README.md         |
| `job-schema-template-parity`        | Schema ↔ Template Parity Auditor               | frontiers-core | queued      | 31-12-2025  | n00tropic-cerebrum/n00-horizons/jobs/job-schema-template-parity/README.md        |
| `job-your-slug`                     | Job Card Template Hardening & Reference Pack    | platform-ops   | queued      | 31-03-2026  | n00tropic-cerebrum/n00-horizons/jobs/job-your-slug/README.md                     |

## How to Rebuild

```bash
.dev/automation/scripts/project-lifecycle-radar.sh
.dev/automation/scripts/project-preflight.sh --path <doc>
.dev/automation/scripts/project-control-panel.sh
```
