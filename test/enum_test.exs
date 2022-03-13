defmodule EnumTest do
  use ExUnit.Case
  import Enum

  test "basic ussage" do
    # map
    assert [1] |> Enum.map(&(&1 + 1)) == [2]

    # zip
    assert ~w[b c]a |> Enum.zip(2..3) == [b: 2, c: 3]

    assert ~w(ab cde f) |> sort(&(String.length(&1) <= String.length(&2))) == ~w[f ab cde]

    assert 1..3 |> into([]) == [1, 2, 3]
  end

  test "Enum.reduce then reverse pattern" do
    assert 2..4 |> Enum.reduce([], &[&1 + 1 | &2]) |> Enum.reverse() == [3, 4, 5]
  end
end

# deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
# deck |> shuffle |> take(13) |> IO.inspect()
# deck |> shuffle |> chunk_every(13) |> IO.inspect()

# first8 = Enum.to_list(1..8)

# for x <- first8,
#     y <- first8,
#     x <= y,
#     rem(x * y, 10) == 0,
#     do: {x, y} |> IO.inspect()

# min_maxes = [{1, 4}, {2, 3}, {10, 15}]
# for {min, max} <- min_maxes, n <- min..max, do: n

# for <<ch <- "hello">>,
#   do:
#     <<ch>>
#     |> IO.inspect()

# for x <- ~w{ cat dog }, into: %{}, do: {x, String.upcase(x)}

# for <<(<<b1::size(2), b2::size(3), b3::size(3)>> <- "hello")>>,
#   do:
#     "0#{b1}#{b2}#{b3}"
#     |> IO.inspect()
