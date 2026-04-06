Single validation path: `make validate` → `.githooks/pre-commit` → validation tool.

The pre-commit hook is the canonical entry point. CI calls `make validate` which delegates to the hook. Never duplicate validation logic across Makefile recipes, CI workflow steps, and hook scripts.

The preferred runner for both pre-commit and CI is [prek][PREK]. Systems without prek fall back to `forge validate .` or downloading validate.sh.

[PREK]: https://github.com/j178/prek
