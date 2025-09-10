from base cimport B

cdef class C(B):
    def __dealloc__(self):
        pass
