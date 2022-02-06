-module(hello).
-export([world/0]).

world() -> io:format("Hello, world\n").

% run: `erl` to enter erlang shell
% c(hello).
% hello:world().
