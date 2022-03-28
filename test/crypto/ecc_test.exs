defmodule Crypto.EccTest do
  use ExUnit.Case

  test "y**2 = x**3 + x +1" do
    p = 23

    points =
      for x <- 0..(p - 1), y <- 0..(p - 1) do
        right = x * x * x + x + 1
        left = y * y
        rl = rem(left, p)
        rr = rem(right, p)

        if rl == rr do
          {{x, y}, rl, right, left}
        end
      end

    points = points |> Enum.reject(&is_nil(&1))

    IO.puts("#{length(points)} points #{points |> inspect}")
  end
end
