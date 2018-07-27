-module(auth_on_subscribe_v1_hook).
-include("vernemq_dev.hrl").

-type sub_modifiers() ::
        #{
           topics => [{Topic :: topic(), SubInfo :: subinfo()}],
           properties => properties()
         }.

%% called as an all_till_ok - hook
-callback auth_on_subscribe_v1(UserName      :: username(),
                               SubscriberId  :: subscriber_id(),
                               Topics        :: [{Topic :: topic(), SubInfo :: subinfo()}],
                               Properties    :: properties()) ->
    ok |
    {ok, sub_modifiers()} |
    {error, Reason :: any()} |
    next.

-export_type([sub_modifiers/0]).
