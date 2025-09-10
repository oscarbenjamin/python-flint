Reproduction of a bug in Cython 3.1 when using the limited API.

```console
$ cat bug.py
import fmpz

print(1)
fmpz.fmpz(0)
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
