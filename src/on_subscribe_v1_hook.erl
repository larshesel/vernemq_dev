-module(on_subscribe_v1_hook).
-include("vernemq_dev.hrl").

%% called as an 'all'-hook, return value is ignored
-callback on_subscribe_v1(UserName      :: username(),
                          SubscriberId  :: subscriber_id(),
                          Topics        :: [Topic :: topic()]) -> any().
