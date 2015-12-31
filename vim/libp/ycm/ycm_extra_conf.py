#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (C) distroy
#


import os
import time
import ycm_core


def get_handler():
    FLAGS = [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-Wc++98-compat',
        '-Wno-long-long',
        '-Wno-variadic-macros',
        '-fexceptions',
        '-DNDEBUG',
        '-DUSE_CLANG_COMPLETER',
        '-std=c++11',
        '-x',
        'c++',
        '-isystem',
        '/usr/include',
        '-isystem',
        '/usr/local/include',
        '-isystem',
        '/usr/local/include/c++/4.8.2',
    ]

    SRC_EXTS = ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']

    HOME = os.environ.get('HOME', os.path.abspath(__file__))

    database_dir    = ''
    database        = None
    if os.path.exists(database_dir):
        database = ycm_core.CompilationDatabase(database_dir)

    fd = os.open('%s/.ycm_extra_conf.log' % HOME,
        os.O_CREAT | os.O_RDWR | os.O_APPEND | os.O_SYNC, 0664)

    def log(fmt, *args):
        buff = []

        buff.append(time.strftime('%Y-%m-%d %H:%M:%S '))
        buff.append('%d ' % os.getpid())
        buff.append(fmt % tuple(args))

        buff.append('\n')
        os.write(fd, ''.join(buff))

    def make_relative_paths(flags, work_dir):
        log('make_relative_paths(%s, %s)', str(flags), str(work_dir))
        if not work_dir:
            return list(flags)

        new_flags = []
        make_next_absolute = False
        path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
        for flag in flags:
            new_flag = flag

            if make_next_absolute:
                make_next_absolute = False
                if not flag.startswith('/'):
                    new_flag = os.path.join(work_dir, flag)

            for path_flag in path_flags:
                if flag == path_flag:
                    make_next_absolute = True
                    break

                if flag.startswith(path_flag):
                    path = flag[len(path_flag) : ]
                    new_flag = path_flag + os.path.join(work_dir, path)
                    break

            if new_flag:
                new_flags.append(new_flag)
        return new_flags

    def is_header(filename):
        extension = os.path.splitext(filename)[1]
        return extension in ['.h', '.hxx', '.hpp', '.hh']

    def get_compilation_info(filename):
        if is_header(filename):
            basename = os.path.splitext(filename)[0]
            for extension in SRC_EXTS:
                replacement_file = basename + extension
                if os.path.exists(replacement_file):
                    info = database.GetCompilationInfoForFile(replacement_file)
                    if info.compiler_flags_:
                        return info
            return None
        return database.GetCompilationInfoForFile(filename)

    def get_flags_for_file(filename, **kwargs):
        log('filename: %s', filename)
        log('kwargs: %s', str(kwargs))

        if database:
            info = get_compilation_info(filename)
            if not info:
                return None

            flags       = info.compiler_flags_
            work_dir    = info.compiler_working_dir_
            try:
                final_flags.remove('-stdlib=libc++')
            except ValueError:
                pass
        else:
            work_dir    = os.path.dirname(os.path.abspath(__file__))
            flags       = FLAGS

        final_flags = make_relative_paths(flags, work_dir)

        log('final_flags: %s\n', str(final_flags))

        return {
            'flags':    final_flags,
            'do_cache': True,
        }

    return get_flags_for_file


FlagsForFile = get_handler()
