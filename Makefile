REBAR=./rebar

all: clean compile

compile:
	$(REBAR) get-deps compile

clean:
	$(REBAR) clean

test:
	$(REBAR) ct skip_deps=true verbose=1

.PHONY: all compile clean
