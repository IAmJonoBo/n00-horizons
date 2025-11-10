---
id: learn-DD-MM-YYYY-topic
title: "[Descriptive Title]"
lifecycle_stage: discover
status: draft
owner: "[primary owner or team]"
tags:
  - learning-log
  - knowledge/learning-log
  - "[additional relevant tags]"
review_date: DD-MM-YYYY
erpnext_project: PM-TEMPLATE
github_project: https://github.com/orgs/n00tropic/projects/1
links:
  - type: project
    path: ../ideas/example/README.md
related_projects:
  - project-foo-bar
recorded: DD-MM-YYYY
agent_id: "[agent identifier or 'human']"
context: "[development, debugging, automation, etc.]"
problem_type: "[complex-problem, recurring-issue, performance, error-handling, etc.]"
severity: "[low, medium, high, critical]"
training_potential: "[high, medium, low, none]"
---

> **Metadata guardrails**
>
> - Dates (`review_date`, `recorded`, timeline headings) use `DD-MM-YYYY`.
> - `erpnext_project` values come from the automation helpers in `n00tropic/.dev/automation/scripts/helpers/erpnext-env.sh`, which are sourced by `run-erpnext-jobs.sh`, `erpnext-export.sh`, `erpnext-verify-checksums.sh`, and `erpnext-sync-pm.py`.
> - Keep descriptions in Oxford English and default to metric measurements/time references.

# Learning Log — [Descriptive Title]

## Executive Summary

**Problem**: Brief description of the issue encountered
**Root Cause**: Primary cause identified
**Solution**: Key resolution approach
**Learning**: Main insight or pattern discovered
**Impact**: Effect on development process/productivity

## 1. Context & Background

### Problem Description

[Detailed description of the problem encountered, including symptoms, error messages, and observed behavior]

### Environment

- **Repository**: `[repo name]`
- **Branch**: `[branch name]`
- **Commit**: `[commit hash]`
- **Agent/Model**: `[agent or model used]`
- **Tools Involved**: `[tools, scripts, or systems involved]`
- **Time to Resolution**: `[duration]`

### Trigger Conditions

[What led to this problem occurring? Include any patterns or preconditions]

## 2. Investigation & Analysis

### Initial Assessment

[First observations and hypotheses about the problem]

### Root Cause Analysis

[Detailed analysis of what caused the issue]

**Primary Cause**: `[main reason]`

**Contributing Factors**:

- `[factor 1]`
- `[factor 2]`
- `[factor n]`

### Similar Patterns Identified

[Links to other instances of similar problems, if any]

## 3. Solutions Attempted

| Attempt # | Approach               | Outcome                   | Time Spent | Lessons Learned |
| --------- | ---------------------- | ------------------------- | ---------- | --------------- |
| 1         | [solution description] | [success/failure/partial] | [duration] | [key insights]  |
| 2         | [solution description] | [success/failure/partial] | [duration] | [key insights]  |

### Final Resolution

[Detailed description of the successful solution]

## 4. Key Learnings & Insights

### Technical Insights

[Specific technical knowledge gained]

### Process Improvements

[Changes to development workflow or practices]

### Tool/Platform Behavior

[Understanding of tool limitations, quirks, or optimal usage]

### Error Patterns

[Common error signatures or failure modes identified]

## 5. Recommendations & Prevention

### Immediate Actions

[Steps to prevent this specific issue from recurring]

### Long-term Improvements

[Suggestions for systemic changes]

### Training Opportunities

[What this teaches about agent capabilities or human-AI collaboration]

### Documentation Updates

[What should be documented or updated based on this learning]

## 6. Training Data Potential

### Classification

- **Problem Category**: `[bug, performance, integration, logic, etc.]`
- **Complexity Level**: `[simple, moderate, complex, expert]`
- **Domain Knowledge Required**: `[basic, intermediate, advanced, specialized]`

### Training Examples

[Specific code patterns, error messages, or scenarios that would be valuable for training]

### Prevention Patterns

[Code patterns or practices that could prevent similar issues]

## 7. Related Records

### Previous Similar Issues

- [Link to related learning logs]
- [Link to GitHub issues]

### Follow-up Actions

- [ ] [Action item 1]
- [ ] [Action item 2]
- [ ] [Action item 3]

### Metrics to Track

[Suggestions for monitoring or alerting to prevent recurrence]

---

## Metadata for Analysis

**Confidence in Solution**: `[high, medium, low]`
**Reproducibility**: `[always, sometimes, rarely, unknown]`
**Impact Radius**: `[single-file, module, repository, organization]`
**Time Saved**: `[estimated time saved by this learning]`
**Knowledge Transfer Value**: `[high, medium, low]`

**Tags for Search**: `[comma-separated tags for indexing]`
