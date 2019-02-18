#! /usr/bin/env bash
#
# Copyright (C) distroy
#


cd "$(dirname "${BASH_SOURCE[0]}")"
SOURCE_DIR="$PWD"
source lib/session.sh

_ld_tmux_renumber_sessions
