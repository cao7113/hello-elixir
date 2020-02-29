defmodule MapTest do
  use ExUnit.Case

  test "basic map" do
    some_map = %{this_is_a_key: "and a value"}
    assert true == is_map(some_map)
  end
end
