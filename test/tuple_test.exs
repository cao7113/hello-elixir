defmodule TupleTest do
  use ExUnit.Case

  test "basic tuple" do
    {_, a} = {:ok, "a"}
    assert "a" == a
  end
end
