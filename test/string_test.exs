defmodule StringTest do
  use ExUnit.Case

  test "join strings" do
    assert "hel" <> "lo" == "hello"
  end
end
