.PHONY: help serve open clean lint install-hooks uninstall-hooks

PORT ?= 8050
URL  := http://localhost:$(PORT)

lint:
	npm run lint

# Point Git at githooks/ so pre-commit runs `make lint`. Run once per clone.
install-hooks:
	git config core.hooksPath githooks
	@chmod +x githooks/pre-commit 2>/dev/null || true
	@echo "Hooks installed. pre-commit will run: make lint"

uninstall-hooks:
	git config --unset core.hooksPath || true
	@echo "Restored default .git/hooks"

server:
	python3 -m http.server $(PORT)

open:
	@open "$(URL)" 2>/dev/null || xdg-open "$(URL)" 2>/dev/null || echo "Open $(URL) in your browser"

clean:
	rm -rf .cache tmp temp
	find . -name '*.log' -delete 2>/dev/null || true
