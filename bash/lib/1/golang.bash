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

# export GOPROXY=https://goproxy.io,direct
# export GOPRIVATE=
export GOPROXY=https://goproxy.cn,direct

alias go-test='go test -gcflags="all=-l"'

function __ld_golang_test_loop_run() (
    local dir="$1"
    local code=0
    local line
    local r
    local tmp
    if [[ "$dir" == "" ]]; then
        dir="."
    elif [[ "$dir" != "." && "$dir" != ".*" && "$dir" != "/*" ]]; then
        dir="./$dir"
    fi
    ld_msgg "$dir"
    find "$dir" -type d | grep -E -v '\/(vendor|\..*)(\/|$)' | while read line; do
        ld_msgg "=== RUN directory: $line"
        tmp=$(find "$line" -name '*.go' -maxdepth 1 | wc -l)
        if (( tmp == 0 )); then
            ld_msgy "=== SKIP directory: $line [no Go files]"
            continue
        fi

        go-test -v "$line"
        r="$?"
        if (( r == 0 )); then
            ld_msgg "=== PASS directory: $line"
        else
            code="$r"
            ld_msgr "=== FAIL directory: $line [exit code $r]"
        fi
    done
    exit $code
)
alias go-test-loop=__ld_golang_test_loop_run
