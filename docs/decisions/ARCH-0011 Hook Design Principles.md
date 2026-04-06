---
title: "Hook Design Principles"
description: "When to use hooks vs rules vs skills — avoid duplicating context, enforce what rules cannot"
type: adr
category: architecture
tags:
    - architecture
    - hooks
    - design
status: accepted
created: 2026-04-06
updated: 2026-04-06
author: "@N4M3Z"
project: forge-core
related:
    - "ARCH-0006 Hook-Driven ADR Capture.md"
    - "CORE-0010 Unified Module Validation.md"
responsible: ["@N4M3Z"]
accountable: ["@N4M3Z"]
consulted: []
informed: []
upstream: []
---

# Hook Design Principles

## Context and Problem Statement

Claude Code supports 26 hook event types. Rules are always loaded. Skills are auto-discovered. Hooks fire on specific events. Without clear boundaries, hooks duplicate context that's already injected (skills roster, rules), or implement enforcement that belongs in CI. The previous forge-core hooks depended on abandoned binaries and were silently dead for months — nobody noticed because they duplicated work that rules and skills already covered.

## Decision Drivers

- Rules and skills are already injected by Claude Code — hooks should not re-inject what the runtime provides
- Hooks are the only mechanism that can block actions or inject context at specific lifecycle moments
- Cowork silently drops all plugin hooks (unsupported at this time)
- Community consensus: security gating and context injection are the two dominant hook use cases

## Considered Options

1. **No hooks** — rules and skills only
2. **Hooks for everything** — maximize event-driven behavior
3. **Hooks for what rules can't do** — avoid duplication, fill gaps

## Decision Outcome

Chosen option: **hooks for what rules can't do**.

A hook earns its place when:

- **Rules can't do it**: blocking a write, gating an action, injecting context at a specific event (not every session)
- **The context is event-specific**: ADR summaries before compaction (not every session), architecture context when the user asks about decisions (not every prompt)
- **Static injection would waste tokens**: large dynamic context that's only relevant at specific moments

A hook does NOT earn its place when:

- Claude Code already provides the information (skill roster, rule content)
- A rule conveys the same instruction with zero runtime cost
- The behavior is advisory ("consider doing X") — that's a rule or skill

**Quality bar**: if a hook breaks silently and nobody notices for a month, it wasn't worth shipping.

**Maintenance budget**: 4-6 hooks per module maximum. Zero external dependencies. Exit 0 always.

### Consequences

- [+] No duplicated context between hooks and what Claude Code already injects
- [+] Each hook fills a genuine gap in the rules/skills model
- [-] Some useful event-driven behaviors are deferred until they prove necessary
