defmodule Chaindata.Test.CryptTest do
  use ExUnit.Case

  # Data flow: just for test fun
  # Step1. generate eth account by `geth account new` with password: caotest
  # Step2. Import into Metamask the json file: ~/Library/Ethereum/keystore/UTC--2022-03-21T08-19-39.712000000Z--fb1284e86aeb017cf8b23df1661b000a235d8052
  # Step3. Export private key in Metamask
  @priv_key "0f4cac8f876aa7732da4c903a1ce71e69a66a704ced68426ecc3ef788fcced0c"
  # copied from MetaMask
  @pub_key "0xfb1284E86AEB017cf8b23df1661b000a235d8052"

  test "pub key from priv key" do
    pkey = @pub_key |> String.downcase()
    # compare with raw pub-key
    assert {pkey, @priv_key} == Ether.make_key(@priv_key)
  end

  test "how to sign" do
    # todo
  end
end
