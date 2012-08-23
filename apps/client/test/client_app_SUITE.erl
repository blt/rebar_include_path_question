-module(client_app_SUITE).
-compile(export_all).
-include_lib("common_test/include/ct.hrl").

all() -> [
          colonized_test
].

init_per_suite(Config) ->
    application:start(client),
    Config.

end_per_suite(_Config) ->
    application:stop(client).

colonized_test(_Config) ->
    nope = client_app:is_the_moon_colonized().
