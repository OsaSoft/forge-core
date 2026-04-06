Hooks must block or inject, never advise. A hook that "reminds" or "nudges" is a rule or skill in disguise.

Before proposing a hook, check: does Claude Code already inject this context? Rules are always loaded. Skills are auto-discovered. Don't duplicate what the runtime provides.

Kill test: if a hook breaks silently and nobody notices for a month, it wasn't worth shipping.

See [ARCH-0011](docs/decisions/ARCH-0011 Hook Design Principles.md) for the full design criteria.
