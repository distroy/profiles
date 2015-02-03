#
# Copyright (C) distroy
#

# local
ld_local=$HOME/local

export PATH=$ld_local/bin:$PATH
export MANPATH=$ld_local/share/man:$MANPATH

export C_INCLUDE_PATH=$ld_local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$ld_local/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=$ld_local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$ld_local/lib:$LIBRARY_PATH

unset ld_local

export LANG=zh_CN.utf-8
export LANGUAGE=$LANG

export GREP_COLOR='1;32'
alias grep='grep --color=auto --exclude-dir={.git,.hg,.svn} --exclude={tags,".*.swp}"'

export LESS_TERMCAP_mb=$'\E[01;31m'         # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'         # begin bold
export LESS_TERMCAP_me=$'\E[0m'             # end mode
export LESS_TERMCAP_se=$'\E[0m'             # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'             # end underline
export LESS_TERMCAP_us=$'\E[01;32m'         # begin underline

export SVN_EDITOR=vim


umask 022


alias ls='ls --color=auto --escape --time-style=+%F\ %T'
alias la='ls -a'
alias ll='ls -l'
alias l.='ls -d .*'
alias vi='vim'

alias pu='ps f -fj -u $USER -U $USER'

