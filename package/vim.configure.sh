#! /usr/bin/env bash
#
# Copyright (C) distroy
#


./configure \
    --prefix=/opt/vim/8.0 \
    --with-features=huge \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
    --enable-multibyte \
    --enable-cscope
