---
id: idea-document-to-markdown-generator
title: Document to Markdown Generator
lifecycle_stage: discover
status: proposed
owner: frontier-intelligence
sponsors:
  - platform-ops
  - delivery
affiliated_initiatives:
  - n00clear-fusion
actions_required: true
source: fusion-ingestion-roadmap
tags:
  - knowledge/idea
  - automation/n00t
  - automation/ingestion
  - knowledge/documentation
review_date: 15-12-2025
erpnext_project: PM-DOC2MD-GEN
github_project: https://github.com/orgs/n00tropic/projects/1
links:
  - type: planning-brief
    path: n00tropic-cerebrum/n00-horizons/experiments/exp-document-to-markdown-generator/brief.md
created: 15-02-2025
---

# Idea: Document to Markdown Generator

## Problem Statement

Large document drops arrive in Word, PDF, and HTML formats that block fast
ingestion into n00tropic knowledge bases. Manual conversion drains analyst time
and produces inconsistent Markdown that fails n00-frontiers validators and
cortex schema checks, so fusion initiatives stall before training can begin.

## Hypothesis

An automated document-to-Markdown workflow that enforces cortex front matter,
normalises asset references, and emits validator-ready bundles should cut
ingestion prep time by 80%, unblock n00clear-fusion pipelines, and give n00t a
consistent contract for downstream automation.

## Proposed Next Steps

1. Catalogue priority document types and map canonical styles to cortex
   metadata fields.
2. Prototype conversion pipeline (Pandoc + post-processing) that runs via n00t
   capability and stages artefacts inside n00clear-fusion.
3. Wire validation hooks (schema + lychee + trunk) and publish an operations
   guide in `1. Cerebrum Docs/`.

## Open Questions

- Which legacy document repositories need backfill and how do we prioritise
  them against new ingestion requests?
- Do we enforce manual review gates before publishing to n00clear-fusion
  corpora, or can we trust automated lint signals?
- How will we surface conversion telemetry (success rate, doc coverage) inside
  the frontier project dashboards?
