# Python Preferences

- never install python packages globally with `pip3 install ...`.
  Always use virtual environments, preferrably with `uv` (see https://docs.astral.sh/uv/).
  Use `uv add ...` over `uv pip install ...`
- Always use pathlib for paths
- I prefer lxml over the built-in xml library
- I prefer loguru over the built-in logging library
- All python code must be strongly typed, formatted with `ruff format`, and comply to as many ruff linting rules as possible.
  All python code must pass mypy checks and ruff checks.
- I prefer modern python syntax and modern patterns.
- I prefer functions to classes.
  I only use classes to bundle data (please use the built-in dataclasses).
  I dislike classes with a lot of state and behaviour.
- I prefer absolute imports rooted at the project root (e.g. `from src.package.module import thing`)
  over relative imports (`from .module import thing` or `from ..package import thing`).
