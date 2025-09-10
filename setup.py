import sys
from setuptools import setup, Extension
from Cython.Build import cythonize

if '--limited-api' in sys.argv:
    sys.argv.remove('--limited-api')
    define_macros = [("Py_LIMITED_API", 0x03070000)]
    py_limited_api = True
else:
    define_macros = []
    py_limited_api = False

setup(
    ext_modules=cythonize([
        Extension(
            name="flint.flint_base.flint_base",
            sources=["flint/flint_base/flint_base.pyx"],
            define_macros=define_macros,
            py_limited_api=py_limited_api
        ),
        Extension(
            name="flint.types.fmpz",
            sources=["flint/types/fmpz.pyx"],
            define_macros=define_macros,
            py_limited_api=py_limited_api
        ),
    ]),
)
