#!/usr/bin/env elixir

import Enum

reduce(1..6, 0, &(&1 + 1 + &2)) 
  |> IO.inspect
