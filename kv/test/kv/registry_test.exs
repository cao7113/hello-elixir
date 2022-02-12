defmodule Test.Kv.RegistryTest do
  use ExUnit.Case
  alias KV.Registry, as: Reg

  setup %{} do
    reg = start_supervised!(Reg)
    %{registry: reg}
  end

  test "create and lookup", %{registry: reg} do
    assert :error == Reg.lookup(reg, "unknown-bucket")

    Reg.create(reg, "shopping")
    {:ok, b} = Reg.lookup(reg, "shopping")
    assert is_pid(b)

    KV.Bucket.put(b, "milk", 3)
    assert 3 == KV.Bucket.get(b, "milk")
  end

  test "removes buckets on exit", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
    send(registry, :state)
    Agent.stop(bucket)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end
end

# alias KV.Registry, as: Reg; {:ok, r} = Reg.start_link(); Reg.create(r, "shopping"); {:ok, b} = Reg.lookup(r, "shopping"); send r, :state;
