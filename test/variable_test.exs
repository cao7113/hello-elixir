defmodule VariableTest do
  use ExUnit.Case

  # "_" represents a value to be ignored in a pattern and cannot be used in expressions

  test "_ special underscore to ignore something" do
    a = "hello world"

    case a do
      "hello" <> _ ->
        assert 1 == 1

      _ ->
        assert 1 == 0
    end
  end

  # For variables, any identifier starting with an underscore should indicate an unused variable
  def dummy_func(_not_use_me) do
  end
end
