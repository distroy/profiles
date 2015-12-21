#
# Copyright (C) distroy
#


alias ls='ls --color=auto --escape --time-style=+%F\ %T'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'

alias vi='vim'
alias vs='vim -S'

case $OSTYPE in
darwin*)
    alias p="$LD_ZSH/lib/tool/psforest"
    alias pu='p -u $USER -U $USER'
    ;;
cygwin)
    alias p="$LD_ZSH/lib/tool/psforest"
    alias pu='p'
    ;;
*)
    alias p='ps f -fj'
    alias pu='p -u $USER -U $USER'
    ;;
esac

alias history='fc -l -t "%F %T"'
