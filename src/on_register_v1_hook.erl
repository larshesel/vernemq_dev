-module(on_register_v1_hook).
-include("vernemq_dev.hrl").

%% called as an 'all' hook, return value is ignored
-callback on_register_v1(Peer          :: peer(),
                         SubscriberId  :: subscriber_id(),
                         UserName      :: username(),
                         Properties    :: properties()) -> any().
