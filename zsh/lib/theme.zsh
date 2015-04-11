# modified by af-magic.zsh-theme


function __ld_git_prompt_info() (
    local hide_status="$(command git config --get ld.hide-status 2>/dev/null)"
    if [[ "$hide_status" == "1" ]]; then
        function parse_git_dirty() {
            echo "$ZSH_THEME_GIT_PROMPT_NO_CHECK"
        }
    fi
    git_prompt_info "$@"
)


if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
#PROMPT='$FG[032]%~$(__ld_git_prompt_info) $FG[105]%(!.#.»)%{$reset_color%} '
PROMPT=$'$FG[032]%~$(__ld_git_prompt_info)\
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt
RPROMPT='$my_gray%*[%?] %n@%m:%l%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_NO_CHECK="$my_orange!%{$reset_color%}"
