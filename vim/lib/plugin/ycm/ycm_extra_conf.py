#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (C) distroy
#


import os
import time
import ycm_core


SOURCE_EXTS = ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']
HEADER_EXTS = ['.h', '.hxx', '.hpp', '.hh']

FLAGS = [
    '-x', 'c++',
    '-std=c++11',
    '-Wc++11-compat',
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    '-DUSE_CLANG_COMPLETER',
]

SYSTEM_INC = [
    '/usr/include',
    '/usr/local/include',
    '/usr/local/include/c++/4.8.2',
]

LOCAL_INC = [
]

REPO_INC = [
]


HOME = os.environ.get('HOME', os.path.dirname(os.path.abspath(__file__)))

class Log(object):

    __fd = -1
    __file_flag = os.O_CREAT | os.O_RDWR | os.O_APPEND | os.O_SYNC

    def __init__(self):
        self.__path = '%s/.ycm_extra_conf.log' % HOME

        self.open()
        size = os.lseek(self.__fd, 0, os.SEEK_END)
        if size > 10 << 20:
            os.rename(self.__path, '%s.1' % self.__path)
            self.open()

    def __del__(self):
        self.close()

    def open(self):
        self.close()
        self.__fd = os.open(self.__path, self.__file_flag, 0664)

    def close(self):
        if self.__fd != -1:
            os.close(self.__fd)
            self.__fd = -1

    def debug(self, fmt, *args):
        if self.__fd == -1:
            return

        buff = []

        buff.append(time.strftime('%Y-%m-%d %H:%M:%S '))
        buff.append('%d ' % os.getpid())
        buff.append(fmt % tuple(args))

        buff.append('\n')
        os.write(self.__fd, ''.join(buff))


log = Log()


class YcmExtraConf(object):

    local_path = None
    repo_path = None
    database_dir = ''
    database = None

    def __init__(self):
        if os.path.exists(self.database_dir):
            self.database = ycm_core.CompilationDatabase(self.database_dir)

        self.FLAGS = FLAGS[:]

        for i in SYSTEM_INC:
            self.FLAGS.append('-isystem')
            self.FLAGS.append(i)

        for i in LOCAL_INC:
            self.FLAGS.append('-isystem')
            self.FLAGS.append(os.path.join(self.get_local_dir(), i))

        for i in REPO_INC:
            self.FLAGS.append('-I')
            self.FLAGS.append(os.path.join(self.get_repo_dir(), i))

    def get_local_dir(self):
        if not self.local_path:
            self.local_path = os.path.dirname(os.path.abspath(__file__))
        return self.local_path

    def get_repo_dir(self):
        if self.repo_path:
            return self.repo_path

        path = os.path.abspath(os.getcwd())
        while path and path != '/':
            if os.path.isdir(os.path.join(path, '.git')):
                self.repo_path = path
                break
            if os.path.isdir(os.path.join(path, '.svn')):
                self.repo_path = path
                break
        if not self.repo_path:
            self.repo_path = os.getcwd()
        return self.repo_path

    def make_relative_paths(self, flags, work_dir):
        log.debug('make_relative_paths(%s, %s)', str(flags), str(work_dir))
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
                    path = flag[len(path_flag):]
                    new_flag = path_flag + os.path.join(work_dir, path)
                    break

            if new_flag:
                new_flags.append(new_flag)
        return new_flags

    def is_header(filename):
        extension = os.path.splitext(filename)[1]
        return extension in HEADER_EXTS

    def get_compilation_info(filename):
        if is_header(filename):
            basename = os.path.splitext(filename)[0]
            for extension in SOURCE_EXTS:
                replacement_file = basename + extension
                if os.path.exists(replacement_file):
                    info = self.database.GetCompilationInfoForFile(replacement_file)
                    if info.compiler_flags_:
                        return info
            return None
        return self.database.GetCompilationInfoForFile(filename)

    def get_flags_for_file(self, filename, **kwargs):
        log.debug('filename: %s', filename)
        log.debug('kwargs: %s', str(kwargs))

        if self.database:
            info = get_compilation_info(filename)
            if not info:
                return None

            flags = info.compiler_flags_
            work_dir = info.compiler_working_dir_
            try:
                final_flags.remove('-stdlib=libc++')
            except ValueError:
                pass
        else:
            work_dir = os.path.dirname(os.path.abspath(__file__))
            flags = self.FLAGS

        final_flags = self.make_relative_paths(flags, work_dir)

        log.debug('final_flags: %s\n', str(final_flags))

        return {
            'flags':    final_flags,
            'do_cache': True,
        }


FlagsForFile = YcmExtraConf().get_flags_for_file
