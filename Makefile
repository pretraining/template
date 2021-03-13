set-git:
	git config --local commit.template .gitmessage.txt

set-test:
	pip install --no-cache-dir pre-commit pylint pytest pytest-cov
	pre-commit install

test:
	pre-commit run -a;make clean

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -f .coverage
	rm -f .coverage.*
	rm -rf .pytest_cache
	rm -rf .mypy_cache

clean: clean-pyc clean-test
