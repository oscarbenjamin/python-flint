import sys
import os
from subprocess import check_call

from Cython.Distutils import build_ext
from Cython.Build import cythonize


if sys.platform == 'win32' and sys.version_info < (3, 12):
    from distutils.core import setup
    from distutils.extension import Extension
    from numpy.distutils.system_info import default_include_dirs, default_lib_dirs
    from distutils.sysconfig import get_config_vars
else:
    from setuptools import setup
    from setuptools.extension import Extension
    from sysconfig import get_config_vars
    default_include_dirs = []
    default_lib_dirs = []


libraries = ["flint"]


if sys.platform == 'win32':
    #
    # This is used in CI to build wheels with mingw64
    #
    if os.getenv('PYTHON_FLINT_MINGW64'):
        includedir = os.path.join(os.path.dirname(__file__), '.local', 'include')
        librarydir1 = os.path.join(os.path.dirname(__file__), '.local', 'bin')
        librarydir2 = os.path.join(os.path.dirname(__file__), '.local', 'lib')
        librarydirs = [librarydir1, librarydir2]
        default_include_dirs += [includedir]
        default_lib_dirs += librarydirs
        # Add gcc to the PATH in GitHub Actions when this setup.py is called by
        # cibuildwheel.
        os.environ['PATH'] += r';C:\msys64\mingw64\bin'
        libraries += ["mpfr", "gmp"]
    elif os.getenv('PYTHON_FLINT_MINGW64_TMP'):
        # This would be used to build under Windows against these libraries if
        # they have been installed somewhere other than .local
        libraries += ["mpfr", "gmp"]
    else:
        # For the MSVC toolchain link with mpir instead of gmp
        libraries += ["mpir", "mpfr", "pthreads"]
else:
    libraries = ["flint"]
    (opt,) = get_config_vars('OPT')
    os.environ['OPT'] = " ".join(flag for flag in opt.split() if flag != '-Wstrict-prototypes')


define_macros = [("Py_LIMITED_API", 0x03070000)]
compiler_directives = {
    'language_level': 3,
    'binding': True,
}


# Enable coverage tracing
if os.getenv('PYTHON_FLINT_COVERAGE'):
    define_macros.append(('CYTHON_TRACE', 1))
    compiler_directives['linetrace'] = True


packages = [
    'flint',
    'flint.flintlib',
    'flint.flint_base',
    'flint.types',
    'flint.utils',
    'flint.test',
]


ext_files = [
    ("flint.flint_base.flint_base", ["src/flint/flint_base/flint_base.pyx"]),
    ("flint.types.fmpz", ["src/flint/types/fmpz.pyx"]),
]

ext_options = {
    "libraries" : libraries,
    "library_dirs" : default_lib_dirs,
    "include_dirs" : default_include_dirs,
    "define_macros" : define_macros,
    "py_limited_api": True,
}

ext_modules = []
for mod_name, src_files in ext_files:
    ext = Extension(mod_name, src_files, **ext_options)
    ext_modules.append(ext)

for e in ext_modules:
    e.cython_directives = {"embedsignature": True}


setup(
    cmdclass={'build_ext': build_ext},
    ext_modules=cythonize(ext_modules, compiler_directives=compiler_directives),
    packages=packages,
    package_dir={'': 'src'},
)
