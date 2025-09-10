test:
	rm *.so *.c
	python setup.py build_ext --inplace
	python bug.py
test_limited:
	rm *.so *.c
	python setup.py --limited-api build_ext --inplace
	python bug.py
