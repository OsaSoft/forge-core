A skill is a directory under `skills/` containing `SKILL.md` as the entrypoint ([Claude Code docs][CCDOCS]).

`SKILL.md` carries YAML frontmatter (`name`, `description`, and optionally `argument-hint`, `allowed-tools`, `model`, `effort`, `context`, `hooks`, `paths`, `shell`) plus the workflow body. Companion files (templates, examples, reference material) live alongside. Skills are lazy-loaded: `SKILL.md` is only injected into context when the user invokes the skill or the AI matches the description. Companion files are loaded on demand when the AI decides it needs them during execution.

Forge additions beyond the native spec:

| File          | Purpose                                        |
| ------------- | ---------------------------------------------- |
| `SKILL.yaml`  | Sidecar for reference URLs and provider hints |
| `user/`       | Qualifier directory, flattened at assembly     |
| `@` includes  | Companion file references, resolved by forge   |

[CCDOCS]: https://code.claude.com/docs/en/skills
