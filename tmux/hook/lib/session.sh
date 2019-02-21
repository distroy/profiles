#! /usr/bin/env bash
#
# Copyright (C) distroy
#


function _ld_tmux_renumber_sessions() {
    local i
    local j=0
    for i in $(tmux ls | awk -F: '{print $1}' | sort -n); do
        (( i == j )) || command tmux rename -t $i $j
        (( j++ ))
    done
    return 0
}
