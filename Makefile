.PHONY: init
init:
	test -d _venv || \
	python3 -m venv _venv && \
	source _venv/bin/activate && \
	pip install --upgrade pip

.PHONY: reqs
reqs:
	pip install -r requirements.txt
	mkdir -p rst/_static docs 
	touch docs/.nojekyll

.PHONY: docs
docs:
	cd rst && \
	sphinx-build -b html -d _build/doctree . ../docs

.PHONY: test
test:
	nosetests

.PHONY: run
run:
	python main.py
