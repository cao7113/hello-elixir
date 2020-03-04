defmodule ModuleTest do
  use ExUnit.Case

  @modkey1 "val1"

  test "test module attribute" do
    assert "val1" == @modkey1
  end
end
