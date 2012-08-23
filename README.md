This is a demonstration project for the rebar mailing list. It is a
multi-application project with two apps--`client` and `daemon`--and a third
no-code application which exists solely for header files, here simply including
the `say_hi` macro.

On compilation I see the following:

```
> make
./rebar clean
==> appstart (clean)
==> client (clean)
==> daemon (clean)
==> library (clean)
==> rebar_ct_path (clean)
./rebar get-deps compile
==> appstart (get-deps)
==> client (get-deps)
==> daemon (get-deps)
==> library (get-deps)
==> rebar_ct_path (get-deps)
==> appstart (compile)
Compiled src/appstarter.erl
Compiled src/appstart.erl
==> client (compile)
Compiled src/client_app.erl
==> daemon (compile)
/private/tmp/rebar_ct_path/apps/daemon/src/daemon_app.erl:4: can't find include file "library/include/library.hrl"
/private/tmp/rebar_ct_path/apps/daemon/src/daemon_app.erl:12: undefined macro 'say_hi/0'
/private/tmp/rebar_ct_path/apps/daemon/src/daemon_app.erl:7: function start/0 undefined
ERROR: compile failed while processing /private/tmp/rebar_ct_path/apps/daemon: rebar_abort
make: *** [compile] Error 1
```

This is a result of the line

```
-include("library/include/library.hrl").
```

in `apps/daemon/src/daemon_app.erl`. If this header were included in a
dependency, this line would not fail. I am unsure how to get a similar result
from a co-app.
