# https://hexdocs.pm/elixir/typespecs.html#behaviours

defmodule MyBehaviour do
  @callback my_fun(arg :: any) :: any
end

defmodule MyCallbackModule do
  @behaviour MyBehaviour
  def my_fun(arg), do: arg
end

defmodule BehaviourTest do
  use ExUnit.Case
  import MyCallbackModule

  test "basic behaviour" do
    assert my_fun(true)
  end
end
