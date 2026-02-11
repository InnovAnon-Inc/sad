import sysconfig, shlex, os
from setuptools import find_packages, Extension, setup as _setup
from Cython.Build import cythonize

def setup(*args, **kwargs) -> None:
    merge_compiler_flags()
    _kwargs = dict(kwargs)
    if 'packages' not in kwargs:
        _kwargs['packages'] = find_packages()
    if 'ext_modules' not in kwargs:
        _kwargs['ext_modules'] = cythonize([Extension('*', ['*/*.pyx'], language='c++')], compiler_directives={'language_level': '3'})
    if 'exclude_package_data' not in kwargs:
        _kwargs['exclude_package_data'] = {'': ['*.cpp', '*.pyx', '*.py', 'hook-*.py', 'main-*.py', '__pycache__', '.env']}
    _setup(*args, **_kwargs)
if __name__ == '__main__':
    setup(use_scm_version=True, setup_requires=['setuptools_scm'])