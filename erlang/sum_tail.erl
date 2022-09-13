% https://www.erlang.org/blog/a-brief-beam-primer/
-module(sum).
-export([sum_tail/1]).

sum_tail(List) ->
    sum_tail(List, 0).

sum_tail([Head | Tail], Acc) ->
    sum_tail(Tail, Head + Acc);
sum_tail([], Acc) ->
    Acc.
