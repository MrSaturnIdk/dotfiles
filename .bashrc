# I prefer to see colors and dotfiles
alias ls='ls -A --color=auto'
alias grep='grep --color=auto'

alias mktargz='tar -X ~/.tarignore -czvf'
alias mktar='tar -X ~/.tarignore -cvf'
alias rmswp='find . -type f -name ".*.sw?" -delete'
alias lspkg="printf '%s\n' \"\${PATH//:/$'\n'}\" | xargs ls -A --color=auto"
alias browse='lynx -accept_all_cookies'
findref() {
	lynx -accept_all_cookies "https://cppreference.com/index.php?search=${1}"
}

# Mass wall of exports and stuff
case ":${PATH}:" in
	*":/usr/lib/ccache/bin:"*) ;;
	*) PATH="/usr/lib/ccache/bin:${PATH}"
esac
export PATH
export CC='gcc'
export CXX='g++'
export CXXFLAGS=\
'-pipe -march=native -Wall -Wextra -pedantic -Wconversion -Wsign-conversion -Wshadow -Wnull-dereference '\
'-Wformat=2 -Wcast-qual -Wmissing-field-initializers -Wuninitialized'
export CFLAGS="${CXXFLAGS} -Wstrict-prototypes"
export CPP='gcc -E'
export AS='as'
export LD="ld"
export AR="ar"
export NM="nm"
export RANLIB="ranlib"
export READELF="readelf"
export STRIP="strip"
export OBJCOPY="objcopy"
export OBJDUMP="objdump"
export GDB='gdb'
export MANPAGER='vim -u /dev/null --not-a-term "+runtime ftplugin/man.vim" +MANPAGER -'
export MAKEFLAGS="-j$(nproc) -l$(nproc)"
export PS1='\h/\u:\s \v:\w\$ '
export CMAKEFLAGS=\
'-DCMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" -DCMAKE_C_FLAGS_DEBUG="-ggdb3" -DCMAKE_C_FLAGS_RELWITHDEBINFO="-Og -DNDEBUG" '\
'-DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" '\
'-DCMAKE_CXX_FLAGS_DEBUG="-ggdb3" -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-Og -DNDEBUG"'

printf 'Welcome back Mr Saturn!\n'
