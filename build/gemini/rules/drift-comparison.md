`forge drift` compares any two directories containing markdown content — modules, build output, or deployed targets.

```sh
forge drift . ~/upstream-module          # source vs upstream
forge drift build/claude ~/.claude       # assembled vs deployed
```

Do not compare source against deployed content directly — assembly transforms (frontmatter stripping, heading removal) will always show as drift. Compare `build/<provider>` against the target instead.
