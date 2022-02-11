defmodule KV.BucketTest do
  use ExUnit.Case, async: true
  alias KV.Bucket

  test "stores values by key" do
    {:ok, b} = Bucket.start_link([])
    assert Bucket.get(b, "milk") == nil

    Bucket.put(b, "milk", 3)
    assert Bucket.get(b, "milk") == 3
  end
end
