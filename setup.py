import sys
import os
from subprocess import check_call

from Cython.Distutils import build_ext
from Cython.Build import cythonize


from setuptools import setup
from setuptools.extension import Extension


define_macros = [("Py_LIMITED_API", 0x03070000)]
compiler_directives = {
    'language_level': 3,
    'binding': True,
}


packages = [
    'flint',
    'flint.flint_base',
    'flint.types',
]


ext_files = [
    ("flint.flint_base.flint_base", ["src/flint/flint_base/flint_base.pyx"]),
    ("flint.types.fmpz", ["src/flint/types/fmpz.pyx"]),
]

ext_options = {
    "define_macros" : define_macros,
    "py_limited_api": True,
}

ext_modules = []
for mod_name, src_files in ext_files:
    ext = Extension(mod_name, src_files, **ext_options)
    ext_modules.append(ext)

setup(
    cmdclass={'build_ext': build_ext},
    ext_modules=cythonize(ext_modules, compiler_directives=compiler_directives),
    packages=packages,
    package_dir={'': 'src'},
)
