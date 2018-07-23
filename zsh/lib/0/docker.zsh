#
# Copyright (C) distroy
#


function __ld_is_in_docker() {
    awk -F/ '$2 == "docker"' /proc/self/cgroup | read
}

__ld_is_in_docker && LD_DOCKER=1

unset __ld_is_in_docker
