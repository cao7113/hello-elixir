defmodule EnumTest do
  use ExUnit.Case

  test "xx" do
    l = [1]
    assert [2] = Enum.map(l, &(&1 + 1))
  end
end
