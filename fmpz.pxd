from flint_base cimport flint_scalar

cdef class fmpz(flint_scalar):
    cdef long long val
