# https://hexdocs.pm/elixir/Kernel.SpecialForms.html#try/1

defmodule TryTest do
  use ExUnit.Case

  test "" do
    try do
      1 / 0
    rescue
      ArgumentError ->
        IO.puts("Invalid argument given")

      ArithmeticError ->
        IO.puts("ArithmeticError error")
    catch
      value ->
        IO.puts("Caught #{inspect(value)}")
    else
      value ->
        IO.puts("Success! The result was #{inspect(value)}")
    after
      IO.puts("This is printed regardless if it failed or succeeded")
    end

    assert true
  end
end
