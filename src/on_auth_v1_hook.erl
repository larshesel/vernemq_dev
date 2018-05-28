-module(on_auth_v1_hook).
-include("vernemq_dev.hrl").

%% called as an all_till_ok - hook
-callback on_auth_v1(Properties :: properties()) ->
    {ok, properties()} |
    {incomplete, properties()} |
    {error, Reason :: any()} |
    next.
