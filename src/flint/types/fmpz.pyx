from flint.flint_base.flint_base cimport flint_scalar

cdef class fmpz(flint_scalar):
    def __cinit__(self):
        pass

    def __dealloc__(self):
        pass

    def __init__(self, *args):
        pass
