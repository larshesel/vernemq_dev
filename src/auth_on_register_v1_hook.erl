-module(auth_on_register_v1_hook).
-include("vernemq_dev.hrl").

-type reg_modifiers()   :: {mountpoint, mountpoint()}
                         | {regview, reg_view()}
                         | {clean_start, flag()}
                         | {properties, properties()}.

%% called as an all_till_ok hook
-callback auth_on_register_v1(Peer          :: peer(),
                              SubscriberId  :: subscriber_id(),
                              UserName      :: username(),
                              Password      :: password(),
                              CleanStart    :: flag(),
                              Properties    :: properties()) ->
    ok |
    {ok, [reg_modifiers()]} |
    {error, invalid_credentials | any()} |
    next.

-export_type([reg_modifiers/0]).
