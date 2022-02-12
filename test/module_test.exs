defmodule AMod do
  @modkey1 "val1"

  require Logger

  def val1(), do: @modkey1

  def __using__(_) do
    Logger.debug("__using__ running")
  end
end

defmodule ModTest do
  use ExUnit.Case

  use AMod

  test "test module attribute" do
    assert "val1" == AMod.val1()
  end
end
