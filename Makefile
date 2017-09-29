
#############
# VARIABLES #

NPM ?= npm

KERNEL ?= $(shell uname -s)
ifeq ($(KERNEL), Darwin)
	OPEN ?= open
else
	OPEN ?= xdg-open
endif


# NOTES #

NOTES ?= 'TODO|FIXME|WARNING|HACK|NOTE'


# JSHINT #

JSHINT ?= ./node_modules/.bin/jshint
JSHINT_REPORTER ?= ./node_modules/jshint-stylish


# FILES #

SOURCES ?= js/*.js index.html package.json


###########
# TARGETS #


# HELP #

.PHONY: help

help:
	@echo ''
	@echo 'Usage: make <cmd>'
	@echo ''
	@echo '  make help        Print this message.'
	@echo '  make notes       Search for code annotations.'
	@echo '  make lint        Run code linting.'
	@echo '  make install     Install dependencies.'
	@echo '  make clean       Clean the build directory.'
	@echo '  make clean-node  Remove Node dependencies.'
	@echo ''


# NOTES #

.PHONY: notes

notes:
	grep -Ern $(NOTES) $(SOURCES)


# LINT #

.PHONY: lint lint-jshint

lint: lint-jshint

lint-jshint: node_modules
	$(JSHINT) \
		--reporter $(JSHINT_REPORTER) \
		./


# NODE #

.PHONY: install clean-node

install: package.json
	$(NPM) install

clean-node:
	rm -rf node_modules


# CLEAN #

.PHONY: clean

clean:
	rm -rf build
