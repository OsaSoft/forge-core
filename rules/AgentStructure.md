Agents run in separate sessions with their own context window. They are invoked by delegation — the AI spawns them when the task matches the description, or the user selects them explicitly. They do not share the parent session's conversation history.

An agent is a single `.md` file in `agents/`. Flat directory, no subdirectories.

Frontmatter carries `name`, `description` (with USE WHEN triggers), and optionally `model`, `tools`, `disallowedTools`, `permissionMode`, `maxTurns`, `effort`, `skills`, `memory`, `isolation`, `color`, `hooks`, `mcpServers` ([Claude Code docs][CCDOCS]).

Body follows a fixed structure: Role, Expertise, Instructions, Output Format, Constraints. The `agents/.mdschema` enforces this.

[CCDOCS]: https://code.claude.com/docs/en/agents
