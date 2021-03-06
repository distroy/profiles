#!/bin/bash
#
# Copyright (C) distroy
#

exe=/cygdrive/c/windows/system32/cmd

self=$(basename ${BASH_SOURCE[0]})

symbolic=0
symbolic_n=hard
directory=0         # allow the superuser to attempt to hard link directories
force=0
verbose=0


function link()
{
    gbk2utf8 "$exe" /c mklink "$@" >/dev/null
    return $?
}

function winpath()
{
    cygpath -w "$@"
}


function echo_link()
{
    local dst src
    src="$1"
    dst="$2"
    echo "\`$dst' => \`$src'"
}


function stderr()
{
    echo "$@" >&2
}


function echo_help()
{
    ln --help 2>&1 | sed -e "s/\\<ln\\>/$self/g" >&2
    exit $?
}


# Usage: ln [OPTION]... [-T] TARGET LINK_NAME   (1st form)
#   or:  ln [OPTION]... TARGET                  (2nd form)
#   or:  ln [OPTION]... TARGET... DIRECTORY     (3rd form)
#   or:  ln [OPTION]... -t DIRECTORY TARGET...  (4th form)
# In the 1st form, create a link to TARGET with the name LINK_NAME.
# In the 2nd form, create a link to TARGET in the current directory.
# In the 3rd and 4th forms, create links to each TARGET in DIRECTORY.
# Create hard links by default, symbolic links with --symbolic.
# By default, each destination (name of new link) should not already exist.
# When creating hard links, each TARGET must exist.  Symbolic links
# can hold arbitrary text; if later resolved, a relative link is
# interpreted in relation to its parent directory.
form=0      # 2 or 3

files=()
nfile=0
next_dst=0
destination=


for i in "$@"; do
    case "$i" in
    --*)
        case "${i:2}" in
        help)
            echo_help
            ;;
        directory)
            directory=1
            ;;
        force)
            force=1
            ;;
        verbose)
            verbose=1
            ;;
        no-target-directory)
            form=1
            next_dst=1
            ;;
        *)
            ;;
        esac
        ;;
    -*)
        if [[ "$i" = "-" ]]; then
            stderr "$self: invalid option:"
            exit -1
        fi
        i=${i:1}
        for ((j = 0; j < ${#i}; ++j)); do
            op=${i:j:1}
            case "$op" in
            h)
                echo_help
                ;;
            s)
                symbolic=1
                symbolic_n=symbolic
                ;;
            d|F)
                directory=1
                ;;
            f)
                force=1
                ;;
            v)
                verbose=1
                ;;
            T)
                form=1
                next_dst=1
                ;;
            t)
                form=4
                next_dst=1
                ;;
            *)
                stderr "$self: invalid option character: $op"
                exit -1
                ;;
            esac
        done
        ;;
    *)
        file="$i"
        if ((next_dst)); then
            destination="$file"
            next_dst=0
        else
            files[$((nfile++))]="$file"
        fi
        ;;
    esac

done


if ((nfile == 0)); then
    stderr "$self: missing file operand"
    exit -1
fi


if ((form == 0)); then
    case $nfile in
    1)
        form=2
        ;;
    2)
        destination=${files[$((--nfile))]}
        if [ -d "$destination" ]; then
            form=3
        elif [ -e "$destination" ]; then
            stderr "$self: failed to create $symbolic_n link \`$destination': File exists"
            exit -1
        else
            form=1
        fi
        ;;
    *)
        form=3
        destination=${files[$((--nfile))]}
        if [ ! -d "$destination" ]; then
            stderr "$self: target \`$destination' is not a directory"
            exit -1
        fi
        ;;
    esac
fi


# Usage: ln [OPTION]... [-T] TARGET LINK_NAME   (1st form)
#   or:  ln [OPTION]... TARGET                  (2nd form)
#   or:  ln [OPTION]... TARGET... DIRECTORY     (3rd form)
#   or:  ln [OPTION]... -t DIRECTORY TARGET...  (4th form)
for ((i = 0; i < nfile; i++)); do
    src=${files[$i]}
    argv=()
    argc=0

    case $form in
    1)
        dst="$destination"
        ;;
    2)
        dst="$(basename "$src")"
        ;;
    3|4)
        dst="$destination/$(basename "$src")"
        ;;
    esac

    if [ ! -e "$src" ]; then
        stderr "$self: accessing \`$src': No such file or directory"
        exit -1
    fi

    if ((!symbolic)); then
        if [ -d "$src" ]; then
            stderr "$self: failed to create $symbolic_n link $(echo_link "$src" "$dst"): Permission denied"
            exit -1
        fi

        argv[$((argc++))]=/h
    fi

    if [ -e "$dst" ]; then
        stderr "$self: failed to create $symbolic_n link \`$dst': File exists"
        exit -1
    fi

    if [ -d "$src" ]; then
        argv[$((argc++))]=/d
    fi

    link "${argv[@]}" "$(winpath "$dst")" "$(winpath "$src")"
    ret=$?

    if ((ret != 0)); then
        exit $ret
    fi

    if ((verbose)); then
        echo_link "$src" "$dst"
    fi
done


