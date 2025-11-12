# Upstream/Downstream Impact & Ops Sync — Codex Playbook

## Intent (one line)

Before making or reacting to a change, anticipate and record upstream/downstream impacts; then propagate boards, observability, and metadata so every agent sees the updated topology.

---

## Triggers

Run this playbook whenever any of the following is true:

- New module or generator; infra/config change; doc taxonomy change.
- You’ve created a board but tasks have not been propagated.
- Grafana dashboards/alerts changed or must be imported.

---

## 0) Preconditions

- Repo: `n00-cortex` checked out; Node + Python available.
- You have access to GitHub Projects and your observability stack (Grafana, etc.).
- Required files exist (examples below use placeholders you must set).

```bash
# set once per session
export GH_OWNER="n00tropic"
export BOARD_TITLE="<board name>"                # e.g., "Frontier Ops Control Plane"
export TEMPLATE_ID="<template_id>"               # integer
export GRAFANA_DASHBOARD_JSON="<path/to/dashboard.json>"
export GRAFANA_ALERTS_YAML="<path/to/alerts.yaml>"
export LEARNING_LOG="n00-horizons/learning-log/LL-14-01-25-frontier-ops-control-plane-enablement.md"
```

---

## 1) Upstream/Downstream Impact Scan (record before you act)

1. Identify likely impact surfaces (scan and note hits):
   - Schemas: `schemas/**`, `schemas/design-*.schema.json`
   - Data SSoT: `data/**` (brand tokens, toolchain manifest, catalog manifests)
   - Docs site & taxonomy: `docs/**` (incl. `docs/tag-governance.md`)
   - Generators & kits: `generators/**`, `templates/**`
   - CI/CD & governance: `.github/workflows/**`, `renovate-presets/**`, `data/toolchain-manifest.json`
2. Fill the **Impact Worksheet** (per playbook) with:
   - Change summary, assumptions, upstream inputs, downstream consumers.
   - Affected paths/modules; mitigation; roll-back plan; test/validation steps.
3. Save the worksheet and link evidence (PRs, issues, dashboards) in the learning log.

> Rationale: this prevents silent breakage and creates a durable trail for later forensics.

---

## 2) Board Provisioning & Task Propagation

Create boards from a template and make them sync-safe (title required):

```bash
# create/update GitHub Project from blueprint (ensures --title is present)
.dev/automation/scripts/github-project-apply-blueprint.sh \
  --owner "$GH_OWNER" \
  --title "$BOARD_TITLE" \
  --template-number "$TEMPLATE_ID"

# propagate tasks and sync metadata to GitHub after board creation
project.sync.github
metadata/sync
```

> If the board already exists but tasks haven’t propagated, run the last two commands.

---

## 3) Observability Update (Dashboards + Alerts) & Topology Refresh

1. Import the Grafana dashboard JSON and alert YAML into your stack (use your standard UI or API flow).
2. Record the deployment in the learning log and capture it:

```bash
# append a short entry; then capture
echo "- Deployed Grafana dashboard + alerts on $(date -u +%F) — evidence: <links>" >> "$LEARNING_LOG"
project.capture "$LEARNING_LOG"
```

3. Refresh the project slice topology so all agents see the new state:

```bash
python scripts/project-slice-report.py --json artifacts/project-slices.json
```

---

## 4) SSoT Validation & Docs/Metadata Regeneration

Keep the repo coherent after changes:

```bash
# validate schemas and data against JSON Schemas
pnpm run validate:schemas

# (optional) regenerate docs manifest if structure changed, then validate
python scripts/generate_docs_manifest.py
pnpm run validate:docs-manifest

# ensure docs build remains green
pnpm run docs:build
```

---

## 5) Change Capture & Ongoing Impact Logging

Whenever plans shift (module, infra, docs):

```bash
# update the Impact Worksheet (as above) and learning log with evidence links
project.capture "$LEARNING_LOG"

# re-sync outward so developers/agents stay aligned
project.sync.github
project.sync.*         # run other relevant sync targets as configured (e.g., Notion/Jira/etc.)
```

Keep a succinct **Upstream/Downstream Impact Summary** per change in the learning log:

- What changed, why, who/what it depends on (upstream), who/what consumes it (downstream).
- Risks, mitigations, tests run, rollback.
- Evidence links (PRs, runs, dashboards).

---

## 6) Acceptance Criteria (done means done)

- Board exists **and** tasks are visible in the correct lanes/filters.
- Grafana dashboard and alerts active; learning log updated and captured.
- `artifacts/project-slices.json` regenerated; agents can see updated topology.
- `pnpm run validate:schemas` and `pnpm run docs:build` pass.
- Impact Worksheet + Summary present with evidence links; `project.sync.*` has run.

---

## 7) Quick-run Summary (copy/paste, fill placeholders)

```bash
export GH_OWNER="n00tropic"
export BOARD_TITLE="<board name>"
export TEMPLATE_ID="<template_id>"
export GRAFANA_DASHBOARD_JSON="<path/to/dashboard.json>"
export GRAFANA_ALERTS_YAML="<path/to/alerts.yaml>"
export LEARNING_LOG="n00-horizons/learning-log/LL-14-01-25-frontier-ops-control-plane-enablement.md"

# 1) impact
# (manually fill worksheet; then)
echo "- Planned change: <summary>; Up/Down impacts recorded; evidence: <links>" >> "$LEARNING_LOG"

# 2) board + propagate
.dev/automation/scripts/github-project-apply-blueprint.sh \
  --owner "$GH_OWNER" --title "$BOARD_TITLE" --template-number "$TEMPLATE_ID"
project.sync.github
metadata/sync

# 3) observability + capture + topology
# (import $GRAFANA_DASHBOARD_JSON and $GRAFANA_ALERTS_YAML via your stack)
echo "- Deployed Grafana dashboard + alerts on $(date -u +%F) — evidence: <links>" >> "$LEARNING_LOG"
project.capture "$LEARNING_LOG"
python scripts/project-slice-report.py --json artifacts/project-slices.json

# 4) validate/build
pnpm run validate:schemas
python scripts/generate_docs_manifest.py
pnpm run validate:docs-manifest
pnpm run docs:build

# 5) final sync
project.sync.github
project.sync.*
```

---

## Notes

- “Propagated” is intentional: ensure issues/tasks created/linked on the board after blueprint application.
- Use `docs/tag-governance.md` when tag or taxonomy updates are part of the change; keep tags consistent with metadata automation and blueprints.
- Prefer small, reversible changes; capture evidence early and link PRs/runs/dashboards directly in the log.
