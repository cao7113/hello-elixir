defmodule BoolTest do
  use ExUnit.Case

  test "falsy cases only false or nil" do
    assert !false
    assert !nil
    refute false
    refute nil
  end

  test "truthy cases" do
    assert 1
    assert :ok
    assert "t"
  end
end
