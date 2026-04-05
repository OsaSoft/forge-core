---
title: "Fixture with missing RACI fields"
description: "All base fields present but RACI fields omitted"
type: adr
category: test
tags:
    - test
status: accepted
created: 2026-04-05
updated: 2026-04-05
author: "@test"
project: forge-core
related: []
---

# Missing RACI Fixture

## Context and Problem Statement

This fixture has all base fields but omits responsible, accountable, consulted, informed, and upstream.

## Considered Options

1. Include RACI
2. Omit RACI

## Decision Outcome

Should fail validation because RACI fields are required by forge-adr.json.
