# Task Slice Playbook – Frontier Control Plane

This playbook defines the canonical task taxonomy, metadata rules, and upstream/downstream impact routines for n00tropic initiatives. It is designed for humans and agents (airgapped or connected) so work can be sliced, copied, and injected anywhere without losing traceability.

---

## 1. Task Taxonomy

| Slice Type          | Description                                               | Default Tags                                       | Typical Artefacts                            |
| ------------------- | --------------------------------------------------------- | -------------------------------------------------- | -------------------------------------------- |
| **Idea Intake**     | Discovery notes, hypotheses, decision records.            | `governance/project-management`, `knowledge/idea`  | `n00-horizons/ideas/**/README.md`            |
| **Charter/Project** | One-pagers, milestones, funding/impact statements.        | `governance/project-management`, `automation/n00t` | `n00tropic_HQ/98. Internal-Projects/IP-*/`   |
| **Milestone**       | Sprint goals, deliverables, rollout phases.               | `delivery/milestone`, parent slice tags            | `IP-*/TASKS.md`, GitHub issues               |
| **Instrumentation** | Grafana dashboards, alerts, telemetry pipelines.          | `observability/grafana`, `integration/erpnext`     | `observability/**`, Grafana JSON, alert YAML |
| **Automation**      | Scripts, CLI wrappers, cookbooks (n00t, ERPNext, GitHub). | `automation/n00t`, `integration/github`            | `.dev/automation/scripts/**`                 |
| **Learning**        | Post-incident logs, retrospectives, training data.        | `knowledge/learning-log`, slice-specific tags      | `n00-horizons/learning-log/LL-*.md`          |

All tasks must map to one or more slices; use `links[]` to point to their parents (idea → project → milestone → instrumentation/automation → learning). Run `.dev/automation/scripts/project-slice-report.py` whenever you need a consolidated JSON/table snapshot of every slice, status, and link—ideal for handovers or airgapped audits.

---

## 2. Metadata & Automation Rules

1. **Front matter** – every Markdown artifact gets the shared YAML header (`id`, `title`, `lifecycle_stage`, `status`, `tags`, `review_date`, upstream `links[]`) plus the integration fields: `erpnext_project`, `erpnext_task` (when a task exists), and `github_project`. The GitHub URL is always `https://github.com/orgs/n00tropic/projects/1`, and ERPNext codes come from the helpers in `n00tropic/.dev/automation/scripts/helpers/erpnext-env.sh` (sourced by `run-erpnext-jobs.sh`, `erpnext-export.sh`, `erpnext-verify-checksums.sh`, and `erpnext-sync-pm.py`). Use `project.recordIdea` or `project.ingestMarkdown` to scaffold.
2. **Auto-normalisation** – `project.capture` canonicalises tags and records registry drift. Airgapped systems should set `PROJECT_METADATA_OFFLINE=1` (if needed) to skip remote checks but still run validators locally.
3. **Impact Analysis** – after editing an artefact, run:
   ```bash
   .dev/automation/scripts/project-capture.sh --path <doc>
   .dev/automation/scripts/project-sync.github.sh --path <doc>
   .dev/automation/scripts/project-sync-erpnext.sh --path <doc>
   ```
   Downstream reminders show what needs updating (GitHub board, ERPNext blueprint, learning log).
4. **Readiness Gate** – before setting a slice to `deliver`/`in-progress`, execute `.dev/automation/scripts/project-preflight.sh --path <doc>` (or call `project.preflight`) to chain the capture + sync runs and ensure `links[]`, `review_date`, and integration IDs are all populated.
   - Use `.dev/automation/scripts/project-preflight-batch.sh --include-registry` during planning or audits to fan out the same gate across every catalogued artefact so GitHub/ERPNext drift is surfaced in one report.
5. **Task exports** – to copy a slice elsewhere, run `project-ingest-markdown.sh --path <doc> --kind project --owner <team>` in the destination repo. Metadata is preserved and re-registered.
6. **Language & measurement standards** – capture durations, distances, and weights in metric units, write in Oxford English, and render every human-readable date (`review_date`, `recorded`, timeline bullets) as `DD-MM-YYYY` so automation artefacts remain locale-aligned.

---

## 3. Airgapped / Offline Guidance

- Set `PYTHONPATH=/path/to/n00-frontiers/templates:$PYTHONPATH` so cookiecutter hooks resolve locally. If unavailable, hooks now degrade gracefully.
- Use `.dev/automation/scripts/github-project-apply-blueprint.sh --template-number <project#>` with cached GitHub CLI to clone boards without network-bound templates.
- For ERPNext, bootstrap a local bench via `.dev/automation/scripts/erpnext-bootstrap.sh --skip-auth-check` and import blueprints using the REST helper with localhost credentials.

---

## 4. Upstream/Downstream Impact Worksheet

When slicing a task, capture:

```markdown
### Impact Summary

- Upstream: idea-frontier-ops-control-plane (doc path)
- Downstream: PM-FOPS-CTRL ERPNext project, n00tropic board (Project 1) column "In Progress"
- Metadata updated: yes/no (run `project.capture`)
- Automations run: github-project-apply-blueprint.sh, erpnext-import-blueprint.sh
- Evidence: `.dev/automation/artifacts/project-sync/<id>-sync_github.json`
```

Include the worksheet in the artefact or in a linked learning log entry so future agents inherit the context instantly.

---

## 5. Consolidation & Planning Tips

- Batch small instrumentation tasks under a "Milestone" slice and refer back to the parent idea+project within `links[]`.
- Use labels (`task/milestone`, `task/automation`, `task/observability`) in TASKS.md so the tasklist workflow creates GitHub issues with the correct taxonomy.
- When plans shift, update the idea + charter + milestone simultaneously, run `project.sync.*`, and note the change in the learning log with references to upstream/downstream slices.
- Periodically run `.dev/automation/scripts/project-lifecycle-radar.sh` so planning docs inherit a JSON snapshot of lifecycle totals, overdue reviews, and slices missing GitHub/ERPNext identifiers.

This playbook ensures every iteration stays orchestrated, even when collaborators operate offline or in segmented environments.
