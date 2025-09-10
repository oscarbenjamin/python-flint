test:
	git clean -fdx flint
	python setup.py build_ext --inplace
	PYTHONPATH=src python bug.py
test_limited:
	git clean -fdx flint
	python setup.py --limited-api build_ext --inplace
	PYTHONPATH=src python bug.py
