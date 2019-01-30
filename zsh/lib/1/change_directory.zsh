#
# Copyright (C) distroy
#


# LD_CD_ROOT_DIR=
# LD_CD_MIN_DEPTH=1
# LD_CD_MAX_DEPTH=1

function ld_cd_like_echo_directories() {
    [ $# -eq 0 ] && return 1
    local i=0
    for dir in "$@"; do
        echo "${LD_COLOR_CYAN}${i}${LD_COLOR_RESET}. $dir"
        (( i++ ))
    done
}

function ld_cd_like_get_directory_by_index() {
    [ $# -eq 0 ] && return 1
    local index=$1
    shift
    local i=0
    for dir in "$@"; do
        if (( i == index )); then
            echo $dir
            return 0
        fi
        (( i++ ))
    done
}

## Desc : change to the source directory like xxx
## Usage: ld_cd_like key
function ld_cd_like() {
    local root_dir=("${LD_CD_ROOT_DIR[@]}")
    if [[ "$root_dir" == "" ]]; then
        ld_msgr "invalid environment variable: LD_CD_ROOT_DIR"
        return 1
    fi
    test -L "$root_dir" && root_dir="$root_dir/"

    local -i max_depth=$LD_CD_MAX_DEPTH
    local -i min_depth=$LD_CD_MIN_DEPTH
    max_depth=$(( max_depth > 0 ? max_depth : 1 ))
    min_depth=$(( min_depth > 0 ? min_depth : 1 ))

    local key="$1"
    local dirs="$(find -L "${root_dir[@]}" -maxdepth $max_depth -mindepth $min_depth -type d -not -name '.*' | sort -f)"

    local errmsg=
    local dir=
    while (( 1 )); do
        if [[ "$key" == "" ]]; then
            ld_cd_like_echo_directories $(echo $dirs)
            if [[ "$errmsg" != "" ]]; then
                ld_msgr "$errmsg"
            fi
            while [[ "$key" == "" ]]; do
                ld_msgy_ "Enter key or index > "
                read key
            done
        fi

        # check is special cmd
        local is_quit=0
        case "$key" in
            \?)
                key=
                ;;
            .)
                is_quit=1
                key=
                ;;
        esac
        if (( is_quit )); then
            ld_msgc "Bye, enjoy your life!"
            break
        elif [[ "$key" == "" ]]; then
            continue
        fi

        # check is index
        echo "$key" | egrep -q '^[0-9]+$'
        if (( $? == 0 )); then
            # select by index
            dir="$(ld_cd_like_get_directory_by_index "$key" $(echo $dirs))"
        else
            # filter by words
            dir=$(echo "$dirs" | egrep -i "$key")
        fi
        key=""
        local lines=$(echo "$dir" | wc -l)
        if [[ "$lines" == "0" || "$dir" == "" ]]; then
            errmsg="Match nothing, "
            continue
        fi
        if (( lines == 1 )); then
            echo "change to [${LD_COLOR_GREEN}${dir}${LD_COLOR_RESET}]"
            cd "$dir"
            break
        fi
        dirs="$dir"
    done
}

function _ld_cd_first() {
    local root_dir=("${LD_CD_ROOT_DIR[@]}")
    echo ${root_dir[1]}
}

alias c=ld_cd_like
alias cdr='cd $(_ld_cd_first)'
