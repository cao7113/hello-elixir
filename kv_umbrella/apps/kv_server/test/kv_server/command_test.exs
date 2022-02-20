defmodule KVServer.CommandTest do
  use ExUnit.Case, async: true
  doctest KVServer.Command

  # setup ctx do
  #   _ = start_supervised!({Reg, name: ctx.test})
  #   %{registry: ctx.test}
  # end

  # test "run", %{registry: reg} do
  #   assert {:ok, "OK\r\n"} == KVServer.Command.run({:ok, "shopping"}, reg)
  # end

  @tag :distributed
  test "run" do
    pid = start_supervised!({KV.Registry, name: :"run-it"})
    assert {:ok, "OK\r\n"} == KVServer.Command.run({:create, "shopping"}, pid)
  end
end
