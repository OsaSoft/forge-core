# forge-core

FORGE ?= forge

.PHONY: help install validate test release clean

help:
	@echo "  make install    deploy and activate git hooks"
	@echo "  make validate   validate module structure and code"
	@echo "  make test       validate + ADR self-tests"
	@echo "  make release    build release tarball (no forge CLI needed to install)"
	@echo "  make clean      remove build artifacts"

install:
	@command -v $(FORGE) >/dev/null 2>&1 \
	    || { echo "forge not found — ask an AI assistant to execute INSTALL.md"; exit 1; }
	git config core.hooksPath .githooks
	$(FORGE) install .

validate:
	@bash .githooks/pre-commit

test: validate
	scripts/validate-adr.py --test

clean:
	rm -rf build/
