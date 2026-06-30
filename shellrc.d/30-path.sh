# PATH and pager settings

# Use bat for man pages if available
if command -v bat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
fi
