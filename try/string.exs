#!/usr/bin/env elixir
# 'a char list' # Lists of Character Codes
# "a normal string"

feature = "heredoc"
IO.puts "start #{feature}"
IO.write """
    a
    multiple
    line
  """
IO.puts "end"

## magic sigils
_ = """
~C A character list with no escaping or interpolation
~c A character list, escaped and interpolated just like a single-quoted string
~D A Date in the format yyyy-mm-dd
~N A naive (raw) DateTime in the format yyyy-mm-dd hh:mm:ss[.ddd]
~R A regular expression with no escaping or interpolation
~r A regular expression, escaped and interpolated
~S A string with no escaping or interpolation
~s A string, escaped and interpolated just like a double-quoted string
~T A Time in the format hh:mm:ss[.dddd]
~W A list of whitespace-delimited words, with no escaping or interpolation
~w A list of whitespace-delimited words, with escaping and interpolation
"""

IO.inspect ~w(a b c) 
IO.inspect ~w/a b c/a # a for atom, c for char, s for string


## char list
str = 'wombat'
is_list str # true
# [67, 65, 84] #show 'CAT' in iex
#:io.format "~w~n", [ str ]
#The ~w in the format string forces str to be written as an Erlang term—the underlying list of integers. The ~n is a newline.
#List.to_tuple str
#str ++ [0]
#'∂x/∂y'
#[head | tail] = 'cat' # head is 99, ?c


String.jaro_distance("jonathan", "jonathon")
