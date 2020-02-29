# https://hexdocs.pm/elixir/Kernel.SpecialForms.html#quote/2
# looks great!
# https://elixir-lang.org/getting-started/meta/macros.html#macros-hygiene

defmodule Math do
  defmacro squared(x) do
    quote do
      unquote(x) * unquote(x)
    end
  end
end

defmodule MacroTest do
  use ExUnit.Case

  import Math

  test "try with" do
    assert squared(3) == 9
  end
end
