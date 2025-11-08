---
id: job-capability-contract-tests
title: Capability Contract Test Harness
lifecycle_stage: deliver
status: queued
owner: platform-ops
sponsors:
  - product-office
source: internal
review_date: 2025-12-31
erpnext_project: null
github_project: null
tags:
  - delivery/job
  - automation/n00t
  - automation/ci-cd
  - dx/developer-experience
links:
  - type: doc
    path: n00tropic-cerebrum/n00t/capabilities/manifest.json
  - type: adr
    path: n00tropic-cerebrum/1. Cerebrum Docs/ADR/ADR-004-unified-project-management-system.md
---

# Job: Capability Contract Test Harness

## Objective

Provide deterministic contract tests for every entry in `n00t/capabilities/manifest.json`. The harness must verify entrypoints exist, required outputs are returned, dry-run executions succeed, and regressions are surfaced before release.

## Inputs & Dependencies

- `n00t` workspace (pnpm toolchain, Vitest)
- `.dev/automation/scripts/meta-check.sh` for integration
- Capability manifest documentation + CI runners

## Quality Gates

1. Automated test suite added to `n00t/tests/` and run via `pnpm test` + `meta-check`.
2. GitHub Actions workflow to run the contract tests on every PR touching `n00t` or `.dev/automation` scripts.
3. Capability docs updated when breaking changes detected; tests enforce doc drift.
4. Telemetry appended to `.dev/automation/artifacts/automation/agent-runs.json` for each contract run.

## Traceability & Telemetry

- On completion, update job metadata with GitHub issue/PR links.
- Persist latest test artifacts in `.dev/automation/artifacts/capabilities/` and back-reference from `12-Platform-Ops/telemetry/`.

## Notes & Updates

- Extend to cover MCP resource exports once CLI surface is stable.
