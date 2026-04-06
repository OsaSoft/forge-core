A rule is a single `.md` file in `rules/`. Flat directory, no subdirectories except locale directories (`rules/cs-CZ/`).

Frontmatter is optional. When present, it can carry `name`, `version`, `description`, and `targets` (provider filter). Assembly strips frontmatter before deployment.

Body is the instruction — concise, actionable prose. No headings required. Max depth 3 if headings are used.

Rules are always loaded into the AI context for every session ([Claude Code docs][CCDOCS]). Keep them short — every word costs tokens on every interaction.

[CCDOCS]: https://code.claude.com/docs/en/memory
