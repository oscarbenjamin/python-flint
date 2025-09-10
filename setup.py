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
            name="flint_base",
            sources=["flint_base.pyx"],
            define_macros=define_macros,
            py_limited_api=py_limited_api
        ),
        Extension(
            name="fmpz",
            sources=["fmpz.pyx"],
            define_macros=define_macros,
            py_limited_api=py_limited_api
        ),
    ]),
)
