# https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1
defmodule WithTest do
  use ExUnit.Case

  test "try with" do
    opts = %{width: 10}

    a =
      with {:ok, width} <- Map.fetch(opts, :width),
           {:ok, height} <- Map.fetch(opts, :height) do
        {:ok, width * height}
      end

    assert a == :error
  end

  test "try with ()" do
    with {:ok, a} <- {:ok, 3} do
      assert a == 3
    end
  end

  test "try with with else" do
    opts = %{width: 10}

    a =
      with {:ok, width} <- Map.fetch(opts, :width),
           {:ok, height} <- Map.fetch(opts, :height) do
        {:ok, width * height}
      else
        :error ->
          {:error, :wrong_data}
      end

    assert a == {:error, :wrong_data}
  end
end
