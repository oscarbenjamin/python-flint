test:
	git clean -fdx flint
	python setup.py build_ext --inplace
	PYTHONPATH=src python bug.py
