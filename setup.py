from setuptools import setup, Extension
from Cython.Build import cythonize

setup(
    ext_modules=cythonize([
        Extension(
            name="flint.flint_base.flint_base",
            sources=["flint/flint_base/flint_base.pyx"],
            define_macros=[
                ("Py_LIMITED_API", 0x03070000),
            ],
            py_limited_api=True
        ),
        Extension(
            name="flint.types.fmpz",
            sources=["flint/types/fmpz.pyx"],
            define_macros=[
                ("Py_LIMITED_API", 0x03070000),
            ],
            py_limited_api=True
        ),
    ]),
)
