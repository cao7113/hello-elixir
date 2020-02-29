defmodule TupleTest do
  use ExUnit.Case

  # https://hexdocs.pm/elixir/Tuple.html#content

  test "basic tuple" do
    {_, a} = {:ok, "a"}
    assert "a" == a
  end

  test "tuple functions" do
    t = {:ok, "a", 1}
    assert elem(t, 1) == "a"
    assert tuple_size(t) == 3
  end
end
