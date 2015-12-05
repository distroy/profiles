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
    alias p='ps -j'
    alias pu='ps -j -u $USER -U $USER'
    ;;
cygwin)
    ;;
*)
    alias p='ps f -fj'
    alias pu='ps f -fj -u $USER -U $USER'
    ;;
esac

alias history='fc -l -t "%F %T"'
