#! /usr/bin/env bash
#
# Copyright (C) distroy
#


./install.py \
    --enable-coverage \
    --js-completer \
    --tern-completer \
    --clang-completer \
    --java-completer \
    "$@"
    # --system-libclang \
