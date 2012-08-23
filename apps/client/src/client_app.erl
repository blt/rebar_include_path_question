-module(client_app).

-behaviour(application).
%% Application callbacks
-export([start/2, stop/1]).

-behaviour(supervisor).
%% Supervisor callbacks
-export([init/1]).

-export([is_the_moon_colonized/0]).

%% ===================================================================
%% API
%% ===================================================================

is_the_moon_colonized() ->
    nope.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop(_State) ->
    ok.

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.
