-module(daemon_app).
-behaviour(application).

-include("library/include/library.hrl").

%% Application callbacks
-export([start/0, start/2, stop/1]).

-export([can_we_breath_water/0]).

start() ->
    ?say_hi(),
    appstart:start(daemon).

can_we_breath_water() ->
    nope.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    daemon_sup:start_link().

stop(_State) ->
    ok.
