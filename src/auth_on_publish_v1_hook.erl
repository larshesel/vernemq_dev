-module(auth_on_publish_v1_hook).
-include("vernemq_dev.hrl").
-type msg_modifier() :: {topic, topic()}
                      | {payload, payload()}
                      | {reg_view, reg_view()}
                      | {qos, qos()}
                      | {retain, flag()}
                      | {mountpoint, mountpoint()}
                      | {properties, properties()}.

-callback auth_on_publish_v1(UserName      :: username(),
                             SubscriberId  :: subscriber_id(),
                             QoS           :: qos(),
                             Topic         :: topic(),
                             Payload       :: payload(),
                             IsRetain      :: flag(),
                             Properties    :: properties()) ->
    ok |
    {ok, Payload    :: payload()} |
    {ok, Modifiers  :: [msg_modifier()]} |
    {error, Reason  :: any()} |
    next.

-export_type([msg_modifier/0]).
