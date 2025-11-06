# Learning Log Template

This directory contains structured templates for recording agent learning experiences during development.

## File Naming Convention

Use the following format for learning log files:

```text
LL-DD-MM-YY-description.md
```

Examples:

- `LL-13-12-25-trunk-isort-black-conflict.md`
- `LL-15-01-26-api-rate-limit-handling.md`
- `LL-22-02-26-dependency-version-conflict.md`

## Template Usage

Copy `learning-log-template.md` to create a new learning log file with the appropriate naming convention.

### Frontmatter Fields

- `summary`: Brief description of the learning experience
- `version`: Template version (usually "1.0.0")
- `created_date`: Date in YYYY-MM-DD format
- `created_tz`: Timezone (e.g., "UTC")
- `last_updated`: Date of last modification
- `agent_id`: Identifier of the agent or "human" for manual entries
- `context`: Development context (development, debugging, automation, etc.)
- `problem_type`: Type of problem encountered
- `severity`: Impact level (low, medium, high, critical)
- `tags`: Array of searchable tags
- `related_files`: Files involved in the issue
- `related_issues`: GitHub issue URLs/IDs
- `related_prs`: Pull request URLs/IDs
- `training_potential`: Value for AI training (high, medium, low, none)

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
