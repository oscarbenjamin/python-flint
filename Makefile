test:
	rm -f *.so *.c
	python setup.py build_ext --inplace
	python bug.py
test_limited:
	rm -f *.so *.c
	python setup.py --limited-api build_ext --inplace
	python bug.py
