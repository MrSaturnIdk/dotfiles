# I prefer to see colors and dotfiles
alias ls='ls -A --color=auto'
alias grep='grep --color=auto'

alias mktargz='tar -X ~/.tarignore -czvf'
alias mktar='tar -X ~/.tarignore -cvf'
alias rmswp='find . -type f -name ".*.sw?" -delete'
alias lspkg="printf '%s\n' \"${PATH//:/$'\n'}\" | xargs ls -A --color=auto"
alias browse='lynx -accept_all_cookies'

help2() {
    if [ -t 2 ]; then
        ansi_reset="\033[0m"
        ansi_bold="\033[1m"
        ansi_red="\033[31m"
    fi
    if [ "$#" -eq 0 ]; then
        printf 'help2: %berror:%b %bprovide at least 1 argument%b\n' \
            "${ansi_bold}${ansi_red}" \
            "${ansi_reset}" \
            "${ansi_bold}" \
            "${ansi_reset}" \
        >&2
        return 1
    fi
    if ! command -v $1 > /dev/null 2>&1; then
        printf 'help2: %berror:%b %bcommand %b not found%b\n' \
            "${ansi_bold}${ansi_red}" \
            "${ansi_reset}" \
            "${ansi_bold}" \
            "'$1'" \
            "${ansi_reset}" \
        >&2
        return 1
    fi

    tempfile=$(mktemp /tmp/help2.XXXXXX)
    if [ "$#" -gt 1 ]; then
        command_name="$1"
        shift
        if ! ${command_name} $@ > ${tempfile}; then
            return 1
        fi
    else
        if ! $1 --help > ${tempfile}; then
            return 1
        fi
    fi
    vim -M -c 'set filetype=help' ${tempfile}
}

export CXX='ccache clang++'
export CC='ccache clang'
export LD="lld"
export AR="llvm-ar"
export NM="llvm-nm"
export RANLIB="llvm-ranlib"
export READELF="llvm-readelf"
export STRIP="llvm-strip"
export OBJCOPY="llvm-objcopy"
export OBJDUMP="llvm-objdump"
export MANPAGER='vim +MANPAGER'
export MAKEFLAGS="-j$(nproc)"

printf 'Welcome back Mr Saturn!\n'
