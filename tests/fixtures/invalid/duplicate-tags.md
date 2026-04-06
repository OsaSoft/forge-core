---
title: "Fixture with duplicate tags"
description: "Tags array contains duplicates, violating uniqueItems: true"
type: adr
category: test
tags:
    - test
    - test
status: accepted
created: 2026-04-06
updated: 2026-04-06
author: "@test"
project: forge-core
responsible:
    - "@test"
accountable:
    - "@test"
consulted: []
informed: []
upstream: []
---

# Duplicate Tags Fixture

## Context and Problem Statement

This fixture has duplicate tags.

## Considered Options

1. Duplicate tags

## Decision Outcome

Should fail validation.
