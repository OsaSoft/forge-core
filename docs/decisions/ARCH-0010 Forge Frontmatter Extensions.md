---
title: "Forge Frontmatter Extensions"
description: "Forge-specific frontmatter fields for skills, rules, and agents — consumed by assembly, stripped before deployment"
type: adr
category: architecture
tags:
    - architecture
    - frontmatter
    - providers
status: accepted
created: 2026-04-06
updated: 2026-04-06
author: "@N4M3Z"
project: forge-core
related:
    - "ARCH-0008 Multi-Provider Support.md"
    - "PROV-0005 Qualifier Directories for Model Targeting.md"
    - "CORE-0007 Forge MADR Extensions.md"
responsible: ["@N4M3Z"]
accountable: ["@N4M3Z"]
consulted: []
informed: []
upstream:
    - SkillStructure.md
    - RuleStructure.md
---

# Forge Frontmatter Extensions

## Context and Problem Statement

Forge modules deploy to multiple AI providers. The assembly pipeline needs metadata for routing and version tracking. Humans maintaining dozens of rules and skills need to understand what each file does and which providers it targets — without reading the body. None of this metadata is part of any provider's spec.

CORE-0007 documents ADR-specific extensions (RACI, upstream). This ADR covers skill, rule, and agent extensions.

## Considered Options

1. **Frontmatter extensions** — add fields to the source file, strip at assembly
2. **Sidecar-only** — all metadata in SKILL.yaml, nothing in the source file
3. **No metadata** — rely on directory structure and file naming

## Decision Outcome

Chosen option: **frontmatter extensions**, because they keep the metadata next to the content it describes. A human reading `rules/UseRTK.md` immediately sees `targets: claude, codex` without opening a sidecar. Assembly strips these fields before deployment.

| Field      | Artifact | Purpose                                        |
| ---------- | -------- | ---------------------------------------------- |
| `version`  | skills   | Track iteration, changelog, drift detection    |
| `version`  | agents   | Track iteration                                |
| `targets`  | rules    | Multi-provider routing (`claude, codex`)        |

Providers silently ignore unrecognized fields. Assembly strips them, so deployed files conform to each provider's spec.

### Consequences

- [+] Source files are self-describing — metadata visible without tooling
- [+] Assembly has routing and tracking data at parse time
- [-] Source files differ from deployed output — this ADR explains why
