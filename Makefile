.PHONY: help serve open clean lint

PORT ?= 8050
URL  := http://localhost:$(PORT)

lint:
	npm run lint

server:
	python3 -m http.server $(PORT)

open:
	@open "$(URL)" 2>/dev/null || xdg-open "$(URL)" 2>/dev/null || echo "Open $(URL) in your browser"

clean:
	rm -rf .cache tmp temp
	find . -name '*.log' -delete 2>/dev/null || true
