-module(auth_on_register_v1_hook).
-include("vernemq_dev.hrl").

-type reg_modifiers()   :: {mountpoint, mountpoint()}
                         | {regview, reg_view()}
                         | {clean_start, flag()}
                         | {properties, properties()}.

-type reason_code() :: ?SUCCESS
                     | ?UNSPECIFIED_ERROR
                     | ?MALFORMED_PACKET
                     | ?PROTOCOL_ERROR
                     | ?IMPL_SPECIFIC_ERROR
                     | ?UNSUPPORTED_PROTOCOL_VERSION
                     | ?CLIENT_IDENTIFIER_NOT_VALID
                     | ?BAD_USERNAME_OR_PASSWORD
                     | ?NOT_AUTHORIZED
                     | ?SERVER_UNAVAILABLE
                     | ?SERVER_BUSY
                     | ?BANNED
                     | ?BAD_AUTHENTICATION_METHOD
                     | ?TOPIC_NAME_INVALID
                     | ?PACKET_TOO_LARGE
                     | ?QUOTA_EXCEEDED
                     | ?PAYLOAD_FORMAT_INVALID
                     | ?RETAIN_NOT_SUPPORTED
                     | ?QOS_NOT_SUPPORTED
                     | ?USE_ANOTHER_SERVER
                     | ?SERVER_MOVED
                     | ?CONNECTION_RATE_EXCEEDED.

-type error_values() :: {reason_code, reason_code()}
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
    {error, [error_values()]} |
    {error, atom()} | %% will be turned into ?NOT_AUTHORIZED
    next.

-export_type([reg_modifiers/0,
              error_values/0,
              reason_code/0]).
