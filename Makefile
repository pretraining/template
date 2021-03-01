.PHONY: quality

check_dirs := tests

quality:
	black $(check_dirs)
	isort $(check_dirs)
	prospector $(check_dirs)