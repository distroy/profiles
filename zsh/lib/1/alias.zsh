#
# Copyright (C) distroy
#


alias top='top -d 1'

alias ls='ls --color=auto --escape --time-style=+%F\ %T'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'

alias vi='vim'
alias vs='vim -S'

alias tailf='tail -F'

case $OSTYPE in
darwin*)
    alias p="$LD_ZSH/tool/psforest"
    alias pu='p -u $UID -U $UID'
    ;;
cygwin)
    alias p="$LD_ZSH/tool/psforest"
    alias pu='p'
    ;;
*)
    alias p='ps f -fj'
    alias pu='p -u $UID -U $UID'
    ;;
esac

alias history='fc -l -t "%F %T"'
