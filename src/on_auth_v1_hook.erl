-module(on_auth_v1_hook).
-include("vernemq_dev.hrl").

-type auth_modifiers() :: {username, username()}
                        | {properties, properties()}.

%% called as an all_till_ok - hook
-callback on_auth_v1(Properties :: properties()) ->
    {ok, [auth_modifiers()]} |
    {incomplete, properties()} |
    {error, Reason :: any()} |
    next.

-export_type([auth_modifiers/0]).
