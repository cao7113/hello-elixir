defmodule ListTest do
  use ExUnit.Case

  # https://hexdocs.pm/elixir/List.html#content

  test "basic list" do
    [head | tail] = [1, 2, 3]
    assert head == 1
    assert tail == [2, 3]
    assert is_list(tail)
    assert 2 == length(tail)
  end
end
