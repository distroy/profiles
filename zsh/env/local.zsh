#
# Copyright (C) distroy
#


test -z "$C_INCLUDE_PATH" && \
    export C_INCLUDE_PATH=/usr/local/include:/usr/include:/include
test -z "$CPLUS_INCLUDE_PATH" && \
    export CPLUS_INCLUDE_PATH=/usr/local/include:/usr/include:/include


# local
ld_local=$HOME/local

export PATH=$ld_local/bin:$PATH
export MANPATH=$ld_local/share/man:$MANPATH

export C_INCLUDE_PATH=$ld_local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$ld_local/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=$ld_local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$ld_local/lib:$LIBRARY_PATH

unset ld_local
