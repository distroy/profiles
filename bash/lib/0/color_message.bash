#
# Copyright (C) distroy
#


# ANSI Foreground color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white 39=default
# ANSI Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white 49=default

LD_COLOR_RED=$'\E[31;1m'
LD_COLOR_GREEN=$'\E[32;1m'
LD_COLOR_YELLO=$'\E[33;1m'
LD_COLOR_BLUE=$'\E[34;1m'
LD_COLOR_MAGENTA=$'\E[35;1m'
LD_COLOR_CYAN=$'\E[36;1m'
LD_COLOR_RESET=$'\E[0m'


ld_printf() { printf "$@"; printf "%s" "${LD_COLOR_RESET}";     }
ld_echo()   { echo "$@${LD_COLOR_RESET}";   }

ld_msgr_()  { ld_printf "%s" "${LD_COLOR_RED}$*";       }
ld_msgg_()  { ld_printf "%s" "${LD_COLOR_GREEN}$*";     }
ld_msgy_()  { ld_printf "%s" "${LD_COLOR_YELLO}$*";     }
ld_msgb_()  { ld_printf "%s" "${LD_COLOR_BLUE}$*";      }
ld_msgm_()  { ld_printf "%s" "${LD_COLOR_MAGENTA}$*";   }
ld_msgc_()  { ld_printf "%s" "${LD_COLOR_CYAN}$*";      }

ld_msgr() { ld_msgr_ "$@"; echo; }
ld_msgg() { ld_msgg_ "$@"; echo; }
ld_msgy() { ld_msgy_ "$@"; echo; }
ld_msgb() { ld_msgb_ "$@"; echo; }
ld_msgm() { ld_msgm_ "$@"; echo; }
ld_msgc() { ld_msgc_ "$@"; echo; }
