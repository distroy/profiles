#
# Copyright (C) distroy
#


export PS1='\[\033[01;32m\]\u@$(hostname -I 2>/dev/null || echo "\h") \[\033[01;33m\]\w\[\033[01;35m\]$(type __git_ps1 &>/dev/null && __git_ps1 " (%s)")
\[\033[01;37m\]\$ \[\033[00m\]'
