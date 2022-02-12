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
end
