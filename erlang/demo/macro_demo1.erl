-include("macro1.hrl").
-module(macro_demo1).
-export([bar/1]).

bar(X) ->
    ?MACRO1(X, 123).

%% compile:file("xx/path.erl", ['P'])
