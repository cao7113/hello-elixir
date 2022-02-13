defmodule Test.Kv.RegistryTest do
  use ExUnit.Case
  alias KV.Registry, as: Reg

  setup ctx do
    _ = start_supervised!({Reg, name: ctx.test})
    %{registry: ctx.test}
  end

  test "spawns buckets", %{registry: reg} do
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
    # normal stop
    Agent.stop(bucket)

    # Do a call to ensure the registry processed the DOWN message
    _ = KV.Registry.create(registry, "bogus")
    assert KV.Registry.lookup(registry, "shopping") == :error
  end

  test "removes buckets on crash", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

    # If a process terminates with a reason different than :normal, all linked processes receive an EXIT signal, causing the linked process to also terminate unless it is trapping exits.
    Agent.stop(bucket, :shutdown)

    # Do a call to ensure the registry processed the DOWN message
    _ = KV.Registry.create(registry, "bogus")
    assert KV.Registry.lookup(registry, "shopping") == :error
  end
end
