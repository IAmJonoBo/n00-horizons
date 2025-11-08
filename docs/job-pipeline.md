# Job Intake & Lifecycle Pipeline

> Frontier-grade jobs connect n00-horizons ideas to tracked delivery units across GitHub and ERPNext. This guide documents the mandatory intake flow so every job inherits the same quality gates, identifiers, and telemetry.

## 1. Intake Sources

Jobs are promoted from any upstream artefact that already carries project metadata:

- **Ideas / research** → `n00-horizons/ideas/**/README.md`
- **Internal projects** → `n00tropic_HQ/99. Internal-Projects/**`
- **Experiment briefs** → `n00-horizons/docs/experiments/*.md`

Before creating a job ensure the upstream document is captured via `project.capture` so the catalog knows about the source record (`id`, `lifecycle_stage`, links).

## 2. Registering a Job

1. Use the n00t capability `project.recordJob` (or run `.dev/automation/scripts/project-record-job.sh`) with at least `title` and `owner`.
2. The capability scaffolds `n00-horizons/jobs/<job-id>/README.md`, injects YAML metadata, writes the narrative template, and automatically registers the job in `n00-cortex/data/catalog/projects.json`.
3. Metadata defaults enforce:
   - `lifecycle_stage = deliver`
   - `status = queued`
   - Tags include `delivery/job` + `governance/project-management`
   - Review window default 30 days (override via `reviewDays`).
4. Provide optional `links` as `type:path` (for example `idea:n00-horizons/ideas/idea-frontier-audit`). Links power upstream/downstream impact reports.

## 3. Quality Gates (Frontier Standard)

Every job must document and satisfy the following gates before closure:

| Gate                       | Description                                                                                             | Evidence                                 |
| -------------------------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| **Traceability**           | Job metadata includes upstream links, ERPNext/GitHub identifiers, and is synced via `project.sync.*`.   | `project.capture` result + manifest diff |
| **Automation Ready**       | Required CI/QA scripts exist or are referenced (meta-check sections, pipeline jobs, etc.).              | Link to workflow file or capability run  |
| **Telemetry Logged**       | Completion writes to `.dev/automation/artifacts/project-sync/*.json` plus `12-Platform-Ops/telemetry/`. | Capability log ID                        |
| **Review Date Maintained** | `review_date` extended or job archived before expiry.                                                   | Updated metadata diff                    |

## 4. Toolchain Touchpoints

- **Metadata schema** – `n00-cortex/schemas/project-metadata.schema.json` guards every job document.
- **n00t capabilities** – `project.recordJob`, `project.capture`, `project.sync.github`, `project.sync.erpnext` orchestrate registration and sync.
- **ERPNext** – Jobs link to ERPNext Projects/Tasks using `erpnext_project` codes (required before `status = in-progress`).
- **GitHub Projects** – Jobs reference the automation-backed board via `github_project` URLs.

## 5. Operating Rhythm

1. **Capture** new jobs daily via capability or CLI. Owners update `status` as work advances (`in-progress`, `ready-for-review`, `done`).
2. **Sync** GitHub + ERPNext at least twice per week using `project.sync.github` / `project.sync.erpnext`.
3. **Audit** – The upcoming Control Tower job (see `/n00-horizons/jobs/`) runs nightly to flag missing review dates, stalled jobs, or unsynced links.
4. **Archive** – When a job completes, append closure evidence, run `project.capture` one final time, and move deliverables into the appropriate departmental directory (Delivery, Platform Ops, etc.).

## 6. Templates & References

- [`docs/templates/job-card.md`](templates/job-card.md) – Markdown scaffold injected by automation.
- [`../README.md`](../README.md) – Horizon operating model overview.
- [`../../n00t/capabilities/manifest.json`](../../n00t/capabilities/manifest.json) – Capability definitions surfaced to agents.
- [`../../1. Cerebrum Docs/ADR/ADR-004-unified-project-management-system.md`](../../1. Cerebrum Docs/ADR/ADR-004-unified-project-management-system.md) – Governing ADR for lifecycle management.

Follow this playbook for every job so humans and agents always know where work originates, how it progresses, and where to find the audit trail.
