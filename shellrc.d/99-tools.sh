# Tool initialization

# fnm (Fast Node Manager)
if [ -d "$HOME/.local/share/fnm" ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
    if [ -n "$BASH_VERSION" ]; then
        eval "$(fnm env --shell bash)"
    elif [ -n "$ZSH_VERSION" ]; then
        eval "$(fnm env --shell zsh)"
    fi
fi
