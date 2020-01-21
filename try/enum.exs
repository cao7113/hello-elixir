#!/usr/bin/env elixir

import Enum

#list = to_list(1..5)

to_list(1..5)
  |> zip([:a, :b, :c])
  |> IO.inspect


deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
deck |> shuffle |> take(13) |> IO.inspect
deck |> shuffle |> chunk_every(13) |> IO.inspect


["there", "wat", "a", "crooked"] 
  |> sort(&(String.length(&1) <= String.length(&2))) 
  |> IO.inspect


#Enum.into 1..5, [ 100, 101 ]

#result = for generator or filter… [, into: value ], do: expression
first8 = to_list 1..8
for x <- first8, y <- first8, x >= y, rem(x*y, 10) == 0, do: { x, y }
  |> IO.inspect


#min_maxes = [{1,4}, {2,3}, {10, 15}]
#for {min,max} <- min_maxes, n <- min..max, do: n
for << ch <- "hello" >>, do: <<ch>>
  |> IO.inspect


#for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }

for << <<b1::size(2), b2::size(3), b3::size(3)>> <- "hello" >>, do: "0#{b1}#{b2}#{b3}"
  |> IO.inspect
  
