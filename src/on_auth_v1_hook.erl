-module(on_auth_v1_hook).
-include("vernemq_dev.hrl").

-type reason_code() :: reason_code_name().

-type auth_modifiers() ::
        #{
           reason_code => reason_code(),
           properties => properties()
         }.

-type error_values() ::
        #{
           reason_code => reason_code(),
           properties => properties()
         }.

%% called as an all_till_ok - hook
-callback on_auth_v1(Properties :: properties()) ->
    {ok, auth_modifiers()} |
    {error, error_values()} |
    {error, any()} | %% does not send a reply to the client!
    next.

-export_type([auth_modifiers/0]).
