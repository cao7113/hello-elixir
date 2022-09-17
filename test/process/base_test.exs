defmodule Process.BaseTest do
  use ExUnit.Case

  describe "receive" do
    @moduletag :manual

    test "timeout even receive mismatched message" do
      timeout = 5
      caller = self()
      # ExUnit.configuration() |> IO.inspect(label: "exunit config")

      spawn(fn ->
        receive do
          :ping ->
            send(caller, :pong)
        after
          timeout ->
            send(caller, :timeout)
        end
      end)
      |> send(:missing)

      result =
        receive do
          msg -> msg
        end

      assert result == :timeout
    end
  end

  test "process crash not affect caller process" do
    spawn(fn ->
      raise "process crashed"
    end)

    Process.sleep(10)
    assert true
  end

  test "trap linked-process crash" do
    spawn_link(fn ->
      raise "process crashed"
    end)

    Process.flag(:trap_exit, true)

    assert_receive {:EXIT, _from_pid,
                    {%RuntimeError{
                       message: "process crashed"
                     }, _stacks}}
  end
end
