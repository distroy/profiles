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
    local concurrency="$LD_GO_TEST_CONCURRENCY"
    local line
    local tmp
    local r
    local i

    if [[ "$dir" == "" ]]; then
        dir="."
    elif [[ "$dir" != "." && "$dir" != ".*" && "$dir" != "/*" ]]; then
        dir="./$dir"
    fi

    if (( concurrency == 0 )); then
        concurrency=1
    fi
    mkfifo __ld_golang_test_concurrency         # 创建一个命名管道
    exec 200<>__ld_golang_test_concurrency      # 将命名管道绑定到 fd 200
    for (( i = 0; i < concurrency; i++ )); do   # 写入并发数的内容
        echo >&200
    done

    find "$dir" -type d | grep -E -v '\/(vendor|\..*)(\/|$)' | while read line; do
        ld_msgg "=== RUN DIRECTORY: $line"
        tmp=$(find "$line" -name '*.go' -maxdepth 1 | wc -l)
        if (( tmp == 0 )); then
            ld_msgy "=== SKIP DIRECTORY: $line [no Go files]"
            continue
        fi
        # 从管道里读取消息。如果管道没有消息会阻塞，以此来控制并发数
        read -u200
        {

            go-test -v "$line"
            r="$?"
            if (( r == 0 )); then
                ld_msgg "=== PASS DIRECTORY: $line"
            else
                code="$r"
                ld_msgr "=== FAIL DIRECTORY: $line [exit code $r]"
            fi
            # 处理结束写回消息。防止下次执行被阻塞
            echo >&200
        } &
    done

    wait
    if (( code == 0 )); then
        ld_msgg "=== ALL DONE"
    else
        ld_msgr "=== ALL DONE [exit code $code]"
    fi
    exit $code
)
alias go-test-loop=__ld_golang_test_loop_run
