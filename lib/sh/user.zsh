#
# Copyright (C) distroy
#

# paths
export PATH=$HOME/local/bin:$PATH
export MANPATH=$HOME/local/share/man:$MANPATH

export LANG=zh_CN.utf-8
export LANGUAGE=$LANG

export GREP_COLOR='1;32'
export GREP_OPTIONS="--color=auto --exclude-dir=.git --exclude-dir=.svn --exclude-dir=.hg"

export LESS_TERMCAP_mb=$'\E[01;31m'         # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'         # begin bold
export LESS_TERMCAP_me=$'\E[0m'             # end mode
export LESS_TERMCAP_se=$'\E[0m'             # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'             # end underline
export LESS_TERMCAP_us=$'\E[01;32m'         # begin underline

export SVN_EDITOR=vim


alias ls='ls --color=auto --escape --time-style=+%F\ %T'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'
alias vi='vim'

alias pu='ps f -fj -u $USER -U $USER'


