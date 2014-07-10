# .zshrc

#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#


pushd $(dirname $0) &>/dev/null


# oh my zsh
if [ -n "$ZSH" ]; then
    ZSH_THEME=distroy
    DISABLE_AUTO_UPDATE=true
    ZSH_HIST_STAMPS="%Y-%m-%d %H:%M:%S"

    source "$ZSH/oh-my-zsh.sh"

    unset ZSH ZSH_THEME DISABLE_AUTO_UPDATE ZSH_HIST_STAMPS
fi


for config_file (lib/*.zsh); do
    source $config_file
done
unset config_file


popd &>/dev/null


