#
# Copyright (C) distroy
#


alias top='top -d 1'

alias ls='ls --color=auto --escape --time-style=+%FT%T%z'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'

if type nvim &> /dev/null; then
    alias vi='nvim'
else
    alias vi='vim'
fi
alias vs='vi -S'

alias tailf='tail -F'

alias p='ps f -fj'
alias pu='ps f -fj -u $UID -U $UID'

alias where='which -a'
