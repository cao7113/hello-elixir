defmodule Crypto.Test.RotationalTest do
  @moduledoc """
  exercise as https://exercism.org/tracks/elixir/exercises/rotational-cipher
  """
  use ExUnit.Case

  def rotate(str, n) do
    str
    |> String.to_charlist()
    |> Enum.map(fn c ->
      rotate_char(c, n)
    end)
    |> to_string
  end

  def rotate_char(c, n) do
    nn = c + rem(n, 26)

    cond do
      c >= ?a and c <= ?z ->
        if nn > ?z do
          nn - 26
        else
          nn
        end

      c >= ?A and c <= ?Z ->
        if nn > ?Z do
          nn - 26
        else
          nn
        end

      true ->
        c
    end
  end

  test "rotate" do
    input = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    output = "The quick brown fox jumps over the lazy dog."

    assert output == rotate(input, 13)
    assert input == rotate(output, 13)

    assert input == rotate(input, 26)

    assert "trl" == rotate("omg", 5)
  end
end
