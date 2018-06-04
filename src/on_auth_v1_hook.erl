-module(on_auth_v1_hook).
-include("vernemq_dev.hrl").

-type auth_modifiers() :: {username, username()}
                        | {properties, properties()}.

-type reason_code() :: reason_code_name().

-type error_values() :: {reason_code, reason_code()}
                      | {properties, properties()}.

%% called as an all_till_ok - hook
-callback on_auth_v1(Properties :: properties()) ->
    {ok, [auth_modifiers()]} | %% corresponds to ?SUCCESS
    {incomplete, properties()} | %% corresponds to ?CONTINUE_AUTHENTICATION
    {error, [error_values()]} |
    next.

-export_type([auth_modifiers/0]).
