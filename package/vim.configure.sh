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
    --with-python-config-dir=/usr/lib64/python2.7/config \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib64/python3.5/config \
    --enable-multibyte \
    --enable-cscope
