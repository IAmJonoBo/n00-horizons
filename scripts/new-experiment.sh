#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
TEMPLATES_DIR="$ROOT/docs/templates"
DOCS_DIR="$ROOT/docs/experiments"
EXPERIMENTS_DIR="$ROOT/experiments"

DATE="${1:-$(date +%d-%m-%Y)}"
SLUG="${2-}"

if [[ -z $SLUG ]]; then
	echo "Usage: $(basename "$0") <date> <slug>" >&2
	exit 2
fi

EXPERIMENT_ID="${DATE}-${SLUG}"
EXP_DIR="$EXPERIMENTS_DIR/$EXPERIMENT_ID"
DOC_FILE="$DOCS_DIR/${SLUG}.md"
LAB_NOTES="$EXP_DIR/lab-notes.md"

mkdir -p "$EXP_DIR" "$DOCS_DIR"

if [[ ! -f $DOC_FILE ]]; then
	if [[ -f "$TEMPLATES_DIR/experiment-brief.md" ]]; then
		cp "$TEMPLATES_DIR/experiment-brief.md" "$DOC_FILE"
	else
		cat >"$DOC_FILE" <<'MD'
---
title: "<Experiment name>"
summary: "Fill in summary."
version: "0.1.0"
last_verified: DD-MM-YYYY
last_verified_tz: "UTC"
diataxis: "how-to"
tags:
  - experiment
  - horizons
---

## Replace template
MD
	fi
	echo "[new-experiment] Created experiment brief $DOC_FILE"
else
	echo "[new-experiment] Experiment brief already exists: $DOC_FILE"
fi

if [[ ! -f $LAB_NOTES ]]; then
	cat >"$LAB_NOTES" <<MD
# Lab Notes — $EXPERIMENT_ID

- **Brief**: docs/experiments/${SLUG}.md
- **Created**: $DATE
- **Dataset**: <dataset slug>
- **Pipeline**: <n00-school pipeline>

## Day 0

- Summary:
- Actions:
- Metrics:

## Follow-ups

- [ ] Task / Owner
MD
	echo "[new-experiment] Lab notes scaffolded at $LAB_NOTES"
else
	echo "[new-experiment] Lab notes already exist: $LAB_NOTES"
fi

printf '\nNext steps:\n'
printf '  - Link GitHub issue to %s\n' "$DOC_FILE"
printf '  - Track workspace under experiments/%s\n' "$EXPERIMENT_ID"
printf '  - Configure n00-school pipeline + dataset before running training.\n'
