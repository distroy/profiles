/*
 * Copyright (C) distroy
 */


#include <unistd.h>

#include <errno.h>
#include <iconv.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef int     ld_err_t;
typedef int     ld_fd_t;


#define ld_log              stderr


static const char    *ld_code_from  = NULL;
static const char    *ld_code_to    = NULL;

static const char    *ld_exec_file  = NULL;
static const char   **ld_exec_args  = NULL;


#define ld_stderr(err, fmt, args...)                        \
do {                                                        \
    fprintf(ld_log, fmt, ##args);                           \
    if (err != 0)                                           \
        fprintf(ld_log, " (%d: %s)", err, strerror(err));   \
    fprintf(ld_log, "\n");                                  \
} while (0)


typedef struct ld_convert_s {
    iconv_t      ic_;

    const char  *code_from_;
    const char  *code_to_;

    ld_fd_t      fd_in_;
    ld_fd_t      fd_out_;

    size_t       size_in_;
    size_t       size_out_;

    char         buff_in_[4096];
    char         buff_out_[4096];
} ld_convert_t;


int ld_init_convert(ld_convert_t *cv, const char *from, const char *to)
{
    cv->ic_ = iconv_open(to, from);
    if (cv->ic_ == (iconv_t)-1) {
        ld_err_t err = errno;
        ld_stderr(err, "iconv_open(t:%s, f:%s) failed", to, from);
        return -1;
    }

    cv->code_from_  = from;
    cv->code_to_    = to;

    cv->size_in_    = 0;
    cv->size_out_   = 0;

    return 0;
}


int ld_convert(ld_convert_t *cv)
{
    int      r;
    char    *pi;
    char    *pi_end;
    char    *po;
    char    *po_end;
    size_t   size_in;
    size_t   size_out;
    iconv_t  ic;
    ld_err_t err;

    ic      = cv->ic_;

    pi      = cv->buff_in_;
    pi_end  = pi + cv->size_in_;

    po      = cv->buff_out_ + cv->size_out_;
    po_end  = cv->buff_out_ + sizeof(cv->buff_out_);
    do {

        size_in     = pi_end - pi;
        size_out    = po_end - po;
        r = iconv(ic, &pi, &size_in, &po, &size_out);

        if (r != (size_t)-1)
            break;

        err = errno;
        switch (err) {

        case EINVAL:    // 不完整的多字节序
        case E2BIG:     // 没有足够的空间
            goto lab_end;

        case EILSEQ:    // 非法的多字节序
            goto lab_end;

        default:
            ld_stderr(err, "iconv() failed");
            return -1;
        }

    } while (1);

lab_end:

    cv->size_in_    = pi_end - pi;
    cv->size_out_   = po - cv->buff_out_;
    memmove(cv->buff_in_, pi, cv->size_in_);

    return 0;
}


ld_convert_t cv_in;
ld_convert_t cv_out;
ld_convert_t cv_err;


int ld_convert_bridge(ld_convert_t *cv, int fdi, int fdo)
{
    int              r;
    char            *p;
    char            *end;
    ld_err_t         err;

    end = cv->buff_in_ + sizeof(cv->buff_in_);
    for (; ; ) {

        p = cv->buff_in_ + cv->size_in_;
        r = read(fdi, p, end - p);

        if (r > 0) {

            cv->size_in_ += r;
            if (ld_convert(cv) != 0) {
                return -1;
            }

            write(fdo, cv->buff_out_, cv->size_out_);
            cv->size_out_ = 0;

        } else if (r == 0) {
            return 0;

        } else if (r < 0) {
            err = errno;
            ld_stderr(err, "read() failed");
            return 0;
        }
    }

    return 0;
}


int ld_get_options(int argc, char **argv)
{
    int          i;
    size_t       len;
    char        *p;

    for (i = 1; i < argc; i++) {
        p = argv[i];

        if (*p != '-') {
            break;
        }

        if (strcmp(p, "-t") == 0 || strcmp(p, "--to") == 0) {
            if (argv[++i] == NULL) {
                ld_stderr(0, "option \"%s\" requires parameter", p);
                return -1;
            }

            ld_code_to = argv[i];

        } else if (strcmp(p, "-f") == 0 || strcmp(p, "--from") == 0) {
            if (argv[++i] == NULL) {
                ld_stderr(0, "option \"%s\" requires parameter", p);
                return -1;
            }

            ld_code_from = argv[i];

        } else if (strcmp(p, "--") == 0) {
            i++;
            break;

        } else {
            ld_stderr(0, "invalid option: \"%s\"", p);
            return -1;
        }
    }

    if (i == argc) {
        ld_stderr(0, "neead command");
        return -1;
    }

    if (ld_code_to == NULL || ld_code_from == NULL) {
        ld_stderr(0, "need code from and code to");
        return -1;
    }

    ld_exec_args = (const char **)argv + i;
    ld_exec_file = *ld_exec_args;

    return 0;
}


int main(int argc, char **argv)
{
    ld_convert_t cv;

    ld_init_convert(&cv, "utf-8", "gbk");
    ld_convert_bridge(&cv, 0, 1);
    ld_convert_bridge(&cv, STDIN_FILENO, STDOUT_FILENO);

    return 0;

    if (ld_get_options(argc, argv) != 0)
        return -1;

    return 0;
}

