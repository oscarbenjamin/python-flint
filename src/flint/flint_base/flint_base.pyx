from flint.flintlib.types.flint cimport (
    FLINT_BITS as _FLINT_BITS,
    FLINT_VERSION as _FLINT_VERSION,
    __FLINT_RELEASE as _FLINT_RELEASE,
    slong,
)
from flint.utils.flint_exceptions import DomainError
from flint.flintlib.types.mpoly cimport ordering_t
from flint.flintlib.functions.fmpz cimport fmpz_cmp_si
from flint.flint_base.flint_context cimport thectx
from flint.utils.typecheck cimport typecheck
cimport libc.stdlib

from collections.abc import Iterable
from flint.utils.flint_exceptions import IncompatibleContextError

from flint.types.fmpz cimport fmpz, any_as_fmpz

import enum

FLINT_BITS = _FLINT_BITS
FLINT_VERSION = _FLINT_VERSION.decode("ascii")
FLINT_RELEASE = _FLINT_RELEASE


cdef class flint_elem:
    def __repr__(self):
        if thectx.pretty:
            return self.str()
        else:
            return self.repr()

    def __str__(self):
        return self.str()


cdef class flint_scalar(flint_elem):
    # =================================================
    # These are the functions a new class should define
    # assumes that addition and multiplication are
    # commutative
    # =================================================
    def is_zero(self):
        return False

    def _any_as_self(self, other):
        return NotImplemented

    def _neg_(self):
        return NotImplemented

    def _add_(self, other):
        return NotImplemented

    def _sub_(self, other):
        return NotImplemented

    def _rsub_(self, other):
        return NotImplemented

    def _mul_(self, other):
        return NotImplemented

    def _div_(self, other):
        return NotImplemented

    def _rdiv_(self, other):
        return NotImplemented

    def _floordiv_(self, other):
        return NotImplemented

    def _rfloordiv_(self, other):
        return NotImplemented

    def _invert_(self):
        return NotImplemented

    # =================================================
    # Generic arithmetic using the above functions
    # =================================================

    def __pos__(self):
        return self

    def __neg__(self):
        return self._neg_()

    def __add__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._add_(other)

    def __radd__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._add_(other)

    def __sub__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._sub_(other)

    def __rsub__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._rsub_(other)

    def __mul__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._mul_(other)

    def __rmul__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._mul_(other)

    def __truediv__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented

        if other.is_zero():
            raise ZeroDivisionError

        return self._div_(other)

    def __rtruediv__(self, other):
        if self.is_zero():
            raise ZeroDivisionError

        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._rdiv_(other)

    def __floordiv__(self, other):
        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented

        if other.is_zero():
            raise ZeroDivisionError

        return self._floordiv_(other)

    def __rfloordiv__(self, other):
        if self.is_zero():
            raise ZeroDivisionError

        other = self._any_as_self(other)
        if other is NotImplemented:
            return NotImplemented
        return self._rfloordiv_(other)

    def __invert__(self):
        if self.is_zero():
            raise ZeroDivisionError
        return self._invert_()
