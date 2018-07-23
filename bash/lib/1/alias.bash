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

alias p='ps f -fj'
alias pu='ps f -fj -u $UID -U $UID'

alias history='fc -l -t "%F %T"'
alias where='which -a'
