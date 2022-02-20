defmodule TUser do
  defstruct [:name]
end

defmodule MapTest do
  use ExUnit.Case

  test "basic map" do
    m = %{this_is_a_key: "val1"}
    assert is_map(m)
    assert m.this_is_a_key == "val1"

    m = Map.put(m, :id, 1)
    assert 1 == m.id
    # fail when name not exists
    # m1 = %{m | name: "test"}
    # assert "test" === m1.name

    m = %{a: 3}
    assert {3, %{}} == Map.pop(m, :a)
  end

  test "from_struct" do
    assert %{name: nil} == Map.from_struct(TUser)
    u = %TUser{name: "hi"}
    assert %{name: "hi"} == Map.from_struct(u)
  end
end
