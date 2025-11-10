---
title: "<Experiment name>"
summary: "Short description of the hypothesis and expected outcome."
version: "0.1.0"
last_verified: 09-01-2025
last_verified_tz: "UTC"
diataxis: "how-to"
tags:
  - experiment
  - horizons
sources:
  - "docs/workflows/horizons-project-management.md"
---

> **Guardrails**
>
> - Keep narrative language in Oxford English and list quantitative results in metric units.
> - Dates (`last_verified`, timeline entries) use `DD-MM-YYYY`.
> - Link downstream jobs/projects via the metadata template before running automation.

# Experiment Brief — <Experiment name>

## 1. Objective

- What question are we answering?
- Which n00-frontiers standards or mandates does this support? Link ADRs, templates, automation playbooks.

## 2. Hypothesis & Metrics

| Hypothesis | Metrics | Target |
| ---------- | ------- | ------ |
| ...        | ...     | ...    |

## 3. Dataset & Tooling

- Dataset: `<dataset slug>` (managed through n00-school).
- n00-school pipeline: `<pipeline name>` (see `pipelines/` in n00-school).
- Additional tooling / notebooks: `<links>`.

## 4. Automation Plan

- n00t capability to produce/update: `<capability id>`.
- Required manifests / templates in n00-frontiers or n00-cortex.
- Telemetry expectations (agent-runs.json fields, dashboards, etc.).

## 5. Execution Log

Capture notable runs, evaluation results, and links to lab notes.

| Date | Event | Observations |
| ---- | ----- | ------------ |
| ...  | ...   | ...          |

## 6. Risks & Safety

- Enumerate safety constraints, ethics reviews, or compliance gates.
- Link to ADRs or guardrail documents.

## 7. Next Actions

- [ ] Task / Owner
- [ ] Task / Owner
