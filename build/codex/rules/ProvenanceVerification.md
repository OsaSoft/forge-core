`forge provenance` checks deployment integrity by reading `.provenance/` sidecar files (SLSA attestations) and comparing the recorded SHA-256 digest against the actual deployed file content. It reports per-module verification rates and flags files that were modified after deployment.

```sh
forge provenance ~/.claude          # check user-scope deployment
forge provenance .claude            # check project-scope deployment
forge provenance ~/.claude --show-orphans   # include files without provenance records
```
