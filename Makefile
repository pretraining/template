test:
	py.test -o log_cli=true -n 1 --cov-report term-missing --cov ./ tests/*

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -rf .coverage .coverage.* .pytest_cache .cache nosetests.xml coverage.xml *.cover .hypothesis pytestdebug.log

clean: clean-pyc clean-test