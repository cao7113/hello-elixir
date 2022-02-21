defmodule HelloBlockTest do
  use ExUnit.Case
  doctest HelloBlock

  test "greets the world" do
    assert HelloBlock.hello() == :world
  end

  test "get block number" do
    {:ok, "0x" <> hn} =
      Ethereumex.HttpClient.eth_block_number() |> IO.inspect(label: "web3 call hex number")

    num = String.to_integer(hn, 16) |> IO.inspect(label: "decimal num")
    assert num > 10_205_448
  end
end
