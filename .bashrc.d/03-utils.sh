pyman() {
    if type -t uv > /dev/null; then
        uvx --with "$1" python -m pydoc "$1.$2" 2>/dev/null || uvx --with "$1" python -m pydoc "$1"
    fi
}
