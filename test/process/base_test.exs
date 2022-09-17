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
end
