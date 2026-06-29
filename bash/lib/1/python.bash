#
# Copyright (C) distroy
#


__ld_python_execute() {
    local args=()
    local i
    for i in "$@"; do
        # echo "0: $i"
        if [ -f "$i" ]; then
            i="${i#./}"
            i="${i%.py}"
            i="${i//\//.}"
        fi
        # echo "1: $i"
        args=("${args[@]}" "$i")
    done
    # echo "${args[@]}"
    ld_msgg python3 -m "${args[@]}"
    python3 -m "${args[@]}"
}

alias py3-exec=__ld_python_execute
