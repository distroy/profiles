#
# Copyright (C) distroy
#


GOPATH="$HOME/go"
GOCACHE="$HOME/.cache/go-build"

export PATH=$GOPATH/bin:$PATH


function __ld_golang_version_switch() (
    if [[ "$LD_GO_SWITCH_ROOT" == "" ]]; then
        ld_msgr "please set then env variable *LD_GO_SWITCH_ROOT*"
        exit 1
    fi
    cd "${LD_GO_SWITCH_ROOT}"

    if [ ! -d "$1" ]; then
        echo "should switch to:" $(find . -maxdepth 1 -name 'go*.*' | sed -e 's/\.\///g' | sort) >&2
        exit 1
    else
        rm -rv "go"
        ln -sv "$1" "go"
    fi
)

alias go-switch=__ld_golang_version_switch
