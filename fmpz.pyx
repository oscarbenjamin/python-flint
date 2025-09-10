from flint_base cimport flint_scalar

cdef class fmpz(flint_scalar):
    def __dealloc__(self):
        pass
