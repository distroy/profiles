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

    go version
    if [ ! -d "$1" ]; then
        echo "should switch to:" $(find . -maxdepth 1 -name 'go*.*' | sed -e 's/\.\///g' | sort) >&2
        exit 1
    else
        rm -rv "go"
        ln -sv "$1" "go"
    fi
)

function __ld_golang_version_download() (
    if [[ "$LD_GO_SWITCH_ROOT" == "" ]]; then
        ld_msgr "please set then env variable *LD_GO_SWITCH_ROOT*"
        exit 1
    fi
    cd "${LD_GO_SWITCH_ROOT}"
    test -d package || mkdir -v package
    cd package

    local url="$1"
    local zfile="$(basename "$url")"
    local vname="${zfile}"
    vname="${vname/.darwin*/}"
    vname="${vname/.linux*/}"
    vname="${vname/.windows*/}"

    ld_msg_exec rm -rfv "$zfile"
    ld_msg_exec chmod +w "../$vname" -R
    ld_msg_exec rm -rf "../$vname"
    ld_msg_exec rm -rf "./go"
    ld_msg_exec wget "$url" \
        && ld_msg_exec tar zxf "$zfile" \
        && ld_msg_exec mv -v ./go "../$vname"
    local ret=$?
    (( ret != 0 )) && exit $?
    ld_msgg "find \"../$vname\" -name '*.go' | xargs chmod -w"
    find "../$vname" -name '*.go' | xargs chmod -w
)

alias go-switch=__ld_golang_version_switch
alias go-download=__ld_golang_version_download

# export GOPROXY=https://goproxy.io,direct
# export GOPRIVATE=
export GOPROXY=https://goproxy.cn,direct

alias go-test='go test -gcflags="all=-l"'

function __ld_golang_test_loop_run() (
    local dir="$1"
    local concurrency="$2"

    if [[ "$dir" == "" ]]; then
        dir="."
    elif [[ "$dir" != "." && "$dir" != .* && "$dir" != /* ]]; then
        dir="./$dir"
    fi

    if (( concurrency == 0 )); then
        concurrency="$LD_GO_TEST_CONCURRENCY"
    fi
    if (( concurrency == 0 )); then
        concurrency=1
    fi
    for (( ; ; )); do
        fifo=$(mktemp -u -t 'ld-golang-test-loop.XXXXXXXX')
        mkfifo "$fifo"
        r="$?"
        if (( r == 0 )); then
            break
        fi
    done

    init_childs=( )
    run_childs=( )

    clear_resource() {
        local pid
        for pid in "${init_childs[@]}"; do
            ps -p $pid > /dev/null
            if (( $? != 0 )); then
                kill $pid
            fi
        done
        for pid in "${run_childs[@]}"; do
            ps -p $pid > /dev/null
            if (( $? != 0 )); then
                kill $pid
            fi
        done
        rm "$fifo"
    }

    TRAPINT() {
        ld_msgr "TRAPINT() called: ^C was pressed"
        clear_resource
        exit 1
    }
    # TRAPQUIT() {
    #     ld_msgb "TRAPQUIT() called: ^\\ was pressed"
    # }
    TRAPTERM() {
        ld_msgr "TRAPTERM() called: a 'kill' command was aimed at this program's process ID"
        clear_resource
        exit 1
    }
    # TRAPEXIT() {
    #     ld_msgb "TRAPEXIT() called: happens at the end of the script no matter what"
    # }

    for (( i = 0; i < concurrency; i++ )); do   # 写入并发数的内容
        echo > "$fifo" &
        init_childs+=$!
    done

    find "$dir" -type d | grep -E -v '\/(vendor|\..*)(\/|$)' | while read line; do
        ld_msgg "=== RUN DIRECTORY: $line"
        tmp=$(find "$line" -maxdepth 1 -name '*.go' | wc -l)
        if (( tmp == 0 )); then
            ld_msgy "=== SKIP DIRECTORY: $line [no Go files]"
            continue
        fi
        # 从管道里读取消息。如果管道没有消息会阻塞，以此来控制并发数
        read < "$fifo"
        (
            unset TRAPINT
            unset TRAPTERM
            go-test -v "$line"
            r="$?"
            if (( r == 0 )); then
                ld_msgg "=== PASS DIRECTORY: $line"
            else
                ld_msgr "=== FAIL DIRECTORY: $line [exit code $r]"
            fi
            # 处理结束写回消息。防止下次执行被阻塞
            echo > "$fifo"
            exit $r
        ) &
        run_childs+=$!
    done

    # 所有任务执行完成了，还有一个任务在写回消息
    read < "$fifo"
    code=0
    for pid in "${run_childs[@]}"; do
        wait "$pid"
        r="$?"
        if (( r != 0 )); then
            code="$r"
        fi
    done

    wait
    rm "$fifo"
    if (( code == 0 )); then
        ld_msgg "=== ALL DONE"
    else
        ld_msgr "=== ALL DONE [exit code $code]"
    fi
    exit $code
)
alias go-test-loop=__ld_golang_test_loop_run
