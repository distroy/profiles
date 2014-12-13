# .zshrc
#
# Copyright (C) distroy
#


pushd $(dirname $0) &>/dev/null


# oh my zsh
if [ -n "$ZSH" ]; then
    ZSH_THEME=distroy
    DISABLE_AUTO_UPDATE=true
    ZSH_HIST_STAMPS="%F %T"

    source "$ZSH/oh-my-zsh.sh"

    unset ZSH ZSH_THEME DISABLE_AUTO_UPDATE ZSH_HIST_STAMPS
fi


for config_file (lib/sh/*.zsh); do
    source $config_file
done
unset config_file


popd &>/dev/null


