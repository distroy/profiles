#
# Copyright (C) distroy
#


function __ld_is_in_docker() {
    test -f /proc/self/cgroup && awk -F/ '$2 == "docker"' /proc/self/cgroup | read
}

__ld_is_in_docker && LD_DOCKER=1
