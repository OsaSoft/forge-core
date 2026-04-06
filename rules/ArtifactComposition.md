Forge modules produce three artifact types: rules (always loaded), skills (lazy loaded on invocation), and agents (off-session delegation). Each has a defined file composition. See RuleStructure, SkillStructure, and AgentStructure for specifics.

Assembly transforms artifacts for each provider — stripping frontmatter, remapping tool names, converting filenames to kebab-case. The source files in the module are the canonical form; the deployed files are derived.
