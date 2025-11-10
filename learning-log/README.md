# Learning Log Template

This directory contains structured templates for recording agent learning experiences during development.

## File Naming Convention

Use the following format for learning log files:

```text
LL-DD-MM-YYYY-description.md
```

Examples:

- `LL-13-12-2025-trunk-isort-black-conflict.md`
- `LL-15-01-2026-api-rate-limit-handling.md`
- `LL-22-02-2026-dependency-version-conflict.md`

## Template Usage

Copy `learning-log-template.md` to create a new learning log file with the appropriate naming convention.

### Front matter fields

Every log starts with the shared YAML header; stick to Oxford English and metric measurements in the narrative body.

- `id`: Stable identifier (`learn-YYYY-MM-DD-topic` to preserve sort order).
- `title`: Human-friendly summary.
- `lifecycle_stage`, `status`, `owner`, `tags`: Match the task taxonomy; tags must exist in `n00-cortex/data/catalog/project-tags.yaml`.
- `review_date`: Next checkpoint in `DD-MM-YYYY`.
- `erpnext_project`: ERPNext project code (`PM-*`), sourced from `.dev/automation/scripts/helpers/erpnext-env.sh`.
- `github_project`: Always `https://github.com/orgs/n00tropic/projects/1` (the `n00tropic` board).
- `links`: Upstream artefacts (ideas, projects, jobs, charters, etc.).
- `related_projects`: ERPNext/GitHub identifiers tied to the learning.
- `recorded`: When the log was captured (`DD-MM-YYYY`).
- `agent_id`, `context`, `problem_type`, `severity`, `training_potential`: Metadata for classification and retraining.

### Sections

1. **Executive Summary**: High-level overview of problem, solution, and impact
2. **Context & Background**: Detailed problem description and environment
3. **Investigation & Analysis**: Root cause analysis and investigation process
4. **Solutions Attempted**: Table of attempted solutions with outcomes
5. **Key Learnings & Insights**: Technical and process insights gained
6. **Recommendations & Prevention**: Actions to prevent recurrence
7. **Training Data Potential**: Classification for AI training purposes
8. **Related Records**: Links to similar issues and follow-up actions
9. **Metadata for Analysis**: Additional metrics and search tags

## Purpose

Learning logs serve multiple purposes:

- **Knowledge Capture**: Document insights from complex problem-solving
- **Process Improvement**: Identify patterns in development challenges
- **Training Data**: Provide structured data for AI agent training
- **Knowledge Transfer**: Share learnings across the development team
- **Prevention**: Reduce recurrence of similar issues

## Best Practices

- Fill out all applicable sections completely
- Use specific, actionable language
- Include concrete examples and code snippets where relevant
- Link to related issues, PRs, and files
- Update the `last_updated` date when modifying
- Use consistent tagging for better searchability
