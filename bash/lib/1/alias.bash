#
# Copyright (C) distroy
#


alias top='top -d 1'

alias ls='ls --color=auto --escape --time-style=+%FT%T%z'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'

alias vi='vim'
alias vs='vi -S'

alias tailf='tail -F'

alias where='which -a'

case $OSTYPE in
darwin*)
    alias p="$LD_BASH/../zsh/tool/psforest"
    alias pu='p -u $UID -U $UID'
    ;;
cygwin)
    alias p="$LD_BASH/../zsh/tool/psforest"
    alias pu='p'
    ;;
*)
    alias p='ps f -fj'
    alias pu='p -u $UID -U $UID'
    ;;
esac
