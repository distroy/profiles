#
# Copyright (C) distroy
#


alias cd=cd_func
function cd_func() {
    if ((LD_CD_COUNT == 0)); then
        ((LD_CD_COUNT = 10))
    fi

    if [[ $1 == "--" ]]; then
        dirs -v
        return 0
    fi

    local new i tmp

    new=$1
    [[ -z $new ]] && new=$HOME

    if [[ ${new:0:1} == '-' ]]; then
        # Extract dir N from dirs
        i=${new:1}
        [[ -z $i ]] && i=1
        new=$(dirs +$i)
        [[ -z $new ]] && return 1
    fi

    # '~' has to be substituted by ${HOME}
    [[ ${new:0:1} == '~' ]] && new="${HOME}${new:1}"

    # Now change to the new dir and add to the top of the stack
    pushd "${new}" > /dev/null
    [[ $? -ne 0 ]] && return 1
    new=$(pwd)

    # Remove any other occurence of this dir, skipping the top of the stack
    for ((i = 1; i <= LD_CD_COUNT; ++i)); do
        tmp=$(dirs -l +${i} 2> /dev/null)
        [[ $? -ne 0 ]] && return 0
        if [[ "${tmp}" == "${new}" ]]; then
            popd -n +$i &> /dev/null
            return 0
        fi
    done

    # Trim down everything beyond 11th entry
    popd -n +$((LD_CD_COUNT + 2)) &> /dev/null

    return 0
}

alias d='cd --'

alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
