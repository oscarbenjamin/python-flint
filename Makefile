test:
	git clean -fdx src
	python setup.py build_ext --inplace
	PYTHONPATH=src python bug.py
