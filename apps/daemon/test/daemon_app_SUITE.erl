-module(daemon_app_SUITE).
-compile(export_all).
-include_lib("common_test/include/ct.hrl").

all() -> [
          water_breathing_test
].

init_per_suite(Config) ->
    daemon_app:start(),
    Config.

end_per_suite(_Config) ->
    application:stop(daemon).

water_breathing_test(_Config) ->
    nope = daemon_app:can_we_breath_water().
