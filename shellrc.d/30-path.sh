# PATH and pager settings

# # Use bat for man pages if available
if command -v bat >/dev/null 2>&1; then
    # export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
    export MANROFFOPT="-c"
    export MANPAGER="sh -c 'col -bx | bat -p -l man'"
else
    export MANROFFOPT="-c"
    export LESS="-R"

    export LESS_TERMCAP_mb=$'\e[1;31m'
    export LESS_TERMCAP_md=$'\e[1;31m'
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_se=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[1;33;44m'
    export LESS_TERMCAP_ue=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[4;1;32m'
    export LESS_TERMCAP_mr=$'\e[7m'
    export LESS_TERMCAP_mh=$'\e[2m'
    export LESS_TERMCAP_ZN=$'\e[74m'
    export LESS_TERMCAP_ZV=$'\e[75m'
    export LESS_TERMCAP_ZO=$'\e[73m'
    export LESS_TERMCAP_ZW=$'\e[75m'
    export MANPAGER='less'
fi

