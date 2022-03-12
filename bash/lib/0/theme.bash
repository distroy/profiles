#
# Copyright (C) distroy
#


if [ $UID -eq 0 ]; then
    export PS1='\[\033[01;32m\]\u@$(hostname -I 2>/dev/null || echo "\h") \[\033[01;33m\]\w\[\033[01;35m\]$(type __git_ps1 &>/dev/null && __git_ps1 " (%s)")
\[\033[01;31m\]\$ \[\033[00m\]'
else
    export PS1='\[\033[01;32m\]\u@$(hostname -I 2>/dev/null || echo "\h") \[\033[01;33m\]\w\[\033[01;35m\]$(type __git_ps1 &>/dev/null && __git_ps1 " (%s)")
\[\033[01;37m\]\$ \[\033[00m\]'
fi
