defmodule Test.Kv.BucketTest do
  use ExUnit.Case, async: true
  alias KV.Bucket

  setup %{} do
    # {:ok, bucket} = Bucket.start_link([])
    bucket = start_supervised!(Bucket)
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "milk") == nil

    Bucket.put(bucket, "milk", 3)
    assert Bucket.get(bucket, "milk") == 3

    assert 3 == Bucket.delete(bucket, "milk")
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
