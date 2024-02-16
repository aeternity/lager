REBAR ?= ./rebar

.PHONY: all compile deps clean distclean test check_plt build_plt dialyzer \
	    cleanplt

all: deps compile

compile: deps
	${REBAR} compile

deps:
	test -d deps || ${REBAR} get-deps

clean:
	${REBAR} clean

distclean: clean
	${REBAR} delete-deps

DIALYZER_APPS = kernel stdlib erts sasl eunit syntax_tools compiler crypto \
				common_test

include tools.mk
