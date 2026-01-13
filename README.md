# 🌟 Holocron — A Jedi's Guide to Python Excellence

*"Do or do not. There is no try."* — Master Yoda

This repository implements the **Python Golden Path** — a minimal, high-speed tooling stack for Python projects.

## The Stack

| Tool | Purpose |
|------|---------|
| `uv` | Dependency management — faster than a podracer |
| `ruff` | Linting & formatting — precise as a lightsaber |
| `pyright` | Type checking — clear vision, like the Force |
| `pytest` | Testing — trust, but verify |
| `bandit` | Security scanning — sense the dark side |
| `pydantic` | Settings & validation — the Jedi Code |
| `pre-commit` | Guardrails — the Jedi Council's approval |

## Quickstart

```bash
# 1. Install uv (see https://docs.astral.sh/uv/)
# 2. Clone and setup
git clone <repo-url> && cd holocron
cp .env.example .env    # Configure your settings
uv sync                 # Install dependencies

# 3. Run all checks
make qa
```

## Makefile Commands

```bash
make sync       # Install/update dependencies
make test       # Run tests
make lint       # Lint code
make fmt        # Format code
make typecheck  # Type check
make sec        # Security scan
make qa         # All checks (fmt > lint > typecheck > sec > test)
make precommit  # Run pre-commit hooks
make clean      # Remove temp files and caches
```

## Configuration

Settings are managed via Pydantic with environment variable support:

```python
from holocron import get_settings

settings = get_settings()
print(settings.app_name)
print(settings.jedi_council_api_key)
```

Copy `.env.example` to `.env` and customize. Environment variables override defaults.

## Project Structure

```
holocron/
├── src/holocron/       # Application code
│   ├── __init__.py
│   ├── core.py         # Core logic
│   └── settings.py     # Pydantic settings
├── tests/              # Test files
├── pyproject.toml      # Single source of truth
├── Makefile            # Dev commands
└── .env.example        # Environment template
```

## Adapting This Template

This template works for any Python application:

| Use Case | What to Add |
|----------|-------------|
| **FastAPI API** | `fastapi`, `uvicorn` > add `src/holocron/api/` |
| **SQS Consumer** | `boto3` > add `src/holocron/workers/` |
| **CLI Tool** | `typer` or `click` > add `src/holocron/cli.py` |
| **Library** | Keep `[build-system]` for packaging |

The `[build-system]` section in `pyproject.toml` is optional for applications. It's only needed if you want to build wheels or publish to PyPI.

## Development Workflow

**Option 1: Manual (recommended)**

Run all checks before committing:

```bash
make qa    # fmt > lint > typecheck > sec > test
git add -A && git commit -m "your message"
```

**Option 2: Automated with pre-commit**

Install hooks once:

```bash
uv run pre-commit install
```

Now every commit automatically runs:
- **ruff**: lint + auto-fix
- **ruff-format**: formatting
- **pyright**: type checking
- **bandit**: security scan

Tests are not included (too slow). Run `make test` before pushing.

## Core Principles

- **Single source of truth**: All config lives in `pyproject.toml`
- **Speed is a feature**: Rust-powered tools (ruff, uv) for instant feedback
- **Automation over policing**: Let CI handle formatting disputes
- **Source layout**: `src/` + `tests/`

## Requirements

- Python 3.12+
- uv

*May the Force guide your code reviews.*
