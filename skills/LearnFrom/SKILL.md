---
name: LearnFrom
description: "Extract session learnings and apply them as updates to rules, skills, and agents. USE WHEN session produced reusable patterns, corrections, or conventions worth capturing."
version: 0.1.0
---

# LearnFrom

Extract reusable learnings from the current session and apply them as updates to rules, skills, and agents in the current repo.

## Workflow Routing

| Workflow     | Trigger                                          | Section                          |
| ------------ | ------------------------------------------------ | -------------------------------- |
| **Analyze**  | "learn from this session", "extract learnings"   | [Analyze](#analyze-the-session)  |
| **Targeted** | "add a rule for X", "update the agent to note Y" | [Apply Changes](#apply-changes)  |

## Analyze the Session

Review the current conversation and identify:

1. **Patterns discovered** — reusable conventions, architectural decisions, workflow improvements
2. **Corrections made** — wrong assumptions that were fixed, pitfalls encountered
3. **Tool behaviors learned** — CLI flags, API quirks, platform constraints
4. **Process improvements** — better ways to do things discovered during work

For each item, apply the reusability test: will I encounter this again? If no, skip it.

Determine the target artifact:

| Learning type              | Target           | Example                                      |
| -------------------------- | ---------------- | -------------------------------------------- |
| Convention or constraint   | `rules/`         | "every text file ends with newline"          |
| Skill workflow improvement | `skills/*/`      | "add note about tool limitation"             |
| Agent instruction update   | `agents/`        | "add guidance about deployment scope"        |
| Existing file refinement   | edit in place     | "add RACI to required frontmatter list"      |

## Draft Proposals

For each identified learning, draft a concrete proposal:

- **New rule**: filename and content (concise, actionable)
- **Rule update**: which file, what to add or change
- **Skill update**: which companion file, what to add or change
- **Agent update**: which agent, what to add or change

## Interactive Review

Present proposals in batches via AskUserQuestion.

For each proposal, show the target file and proposed change. Options: "Capture", "Adjust", "Skip".

For "Adjust": ask what to change, then re-present.

## Apply Changes

For each confirmed proposal:

- **New rules**: write to `rules/` using the Write tool
- **Updates**: use the Edit tool on the target file
- **New skills/agents**: write to `skills/` or `agents/` using the Write tool

After writing, verify the file exists and has correct content.

## Summary

List what was captured: rules created or updated, skills updated, agents updated, items skipped.

## Constraints

- Never write a rule that duplicates an existing one — check `rules/` first. Prefer adding to an existing rule over creating a new file when the learning fits an existing topic
- Keep rules concise (max 120 words per section per the rules `.mdschema`)
- New rules follow the `.mdschema` in `rules/` if present
- Apply the reusability filter strictly — session-specific fixes are not rules
