Reproduction of a bug in Cython 3.1 when using the limited API.

See https://github.com/cython/cython/issues/7144

```console
$ cat bug.py
from sub import C

print(1)
C()
print(2)
print('End!!!')
$ make test
...
1
2
End!!!
$ make test_limited 
...
1
Segmentation fault (core dumped)
make: *** [Makefile:8: test_limited] Error 139
```
