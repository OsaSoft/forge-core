---
name: Permissions
description: Audit and clean `.claude/settings.local.json` permissions. USE WHEN the user asks to review permissions, clean up settings, audit allowed commands, or mentions settings.local.json cruft.
---

# Permissions Audit

Audit and clean the Claude Code permissions file (`.claude/settings.local.json`). This file grows organically as users approve Bash commands — each approval gets auto-appended verbatim, accumulating cruft over time.

## Procedure

1. **Read** `.claude/settings.local.json`
2. **Categorize** every entry into one of the groups below
3. **Flag cruft** — entries matching the patterns in the Cruft Patterns section
4. **Present a report** showing: total entries, entries per group, flagged cruft with reasons
5. **On user approval**, write a cleaned version with entries organized by group

## Permission Groups

Organize the `allow` array in this order, separated by blank lines:

| Group | Description | Examples |
|-------|-------------|---------|
| **Non-Bash tools** | Top-level tool grants | `WebSearch`, `mcp__*` |
| **Standard CLI** | Common commands, no prefix needed | `Bash(git:*)`, `Bash(cargo:*)` |
| **Aliased commands** | Shell aliases require `command` prefix | `Bash(command cp:*)`, `Bash(command cd:*)` |
| **Forge hooks** | Relative paths to Hooks/ scripts | `Bash(Hooks/calendar-today.sh:*)` |
| **Forge binaries** | Relative paths to module binaries | `Bash(Modules/forge-tlp/bin/safe-read:*)` |
| **Build tools** | Setup and build scripts | `Bash(make:*)` |
| **WebFetch domains** | Allowed web domains | `WebFetch(domain:github.com)` |

The `ask` array stays at the bottom, unchanged.

## Cruft Patterns

Flag and remove entries matching these patterns:

| Pattern | Why it's cruft | Example |
|---------|---------------|---------|
| **Absolute paths** that duplicate a relative entry | Auto-granted with full path when relative already exists | `/Users/.../Hooks/calendar-today.sh` |
| **Environment-prefixed** commands | Hook dispatcher noise — `CLAUDE_PLUGIN_ROOT=`, `FORGE_MODULE_ROOT=`, `FORGE_ROOT=`, `CARGO_MANIFEST_DIR=` | `Bash(CLAUDE_PLUGIN_ROOT=/path bash:*)` |
| **Loop fragments** | Partial shell syntax from multi-line commands | `Bash(for mod in ...)`, `Bash(do)`, `Bash(done)` |
| **File existence checks** | One-off `[ -f ... ]` tests | `Bash([ -f "$SCRIPT_DIR/Core/..." ])` |
| **Redundant aliases** | `command echo` when `echo` exists, bare `find` when `command find` exists | `Bash(command echo:*)` |
| **Internal functions** | Bash function names, not commands | `Bash(strip_front:*)`, `Bash(parse_yaml_list:*)` |
| **Multi-line blobs** | Entire scripts pasted as a single permission | Long `for`/`do`/`done` blocks |
| **One-off domains** | Domains visited once during research, not part of regular workflow | `WebFetch(domain:random-blog.com)` |
| **Venv paths** | Python from `.venv/` when `python3` already allowed | `Bash(/path/.venv/bin/python3:*)` |

## Guidelines

- **Keep** anything the user intentionally uses across sessions
- **Keep** `du`, `md5`, `xargs`, `source` — generally useful utilities
- **Remove** anything that's a duplicate, fragment, or noise from auto-granting
- When unsure, **ask** — don't silently remove potentially intentional entries
- Report the before/after entry count
