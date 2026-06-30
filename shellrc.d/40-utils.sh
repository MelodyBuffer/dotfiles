# Utility functions

# pyman: Python documentation viewer using uv
# Usage: pyman <package> [module]
pyman() {
    if command -v uv >/dev/null 2>&1; then
        uvx --with "$1" python -m pydoc "$1.$2" 2>/dev/null || uvx --with "$1" python -m pydoc "$1"
    else
        echo "uv not found. Install from https://github.com/astral-sh/uv"
        return 1
    fi
}
