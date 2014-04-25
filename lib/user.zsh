
# paths
export PATH=$HOME/local/bin:$PATH
export MANPATH=$HOME/local/share/man:$MANPATH

export LANG=zh_CN.utf-8
export LANGUAGE=$LANG

export GREP_COLOR='1;32'
export GREP_OPTIONS=--color=auto

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export SVN_EDITOR=vim


alias ls='ls --color=auto --escape --time-style=+%Y-%m-%d\ %H:%M:%S'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'
alias vi='vim'

alias pu='ps f -fj -u $USER -U $USER'


