.PHONY: sync test lint fmt typecheck sec precommit qa clean

sync:
	uv sync

test:
	uv run pytest

lint:
	uv run ruff check .

fmt:
	uv run ruff format .

typecheck:
	uv run pyright

sec:
	uv run bandit -c pyproject.toml -r src

precommit:
	uv run pre-commit run --all-files

qa: lint typecheck sec test

clean:
	rm -rf __pycache__ .pytest_cache .ruff_cache .pyright .mypy_cache .coverage htmlcov
	rm -rf build dist *.egg-info
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.py[cod]" -delete 2>/dev/null || true


