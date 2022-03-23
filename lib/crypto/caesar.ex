defmodule Crypto.Caesar do
  @num 26
  @diff 0x20

  def encrypt(str, n) do
    str
    |> String.to_charlist()
    |> Enum.map(fn c -> up_then_move_n(c, n) end)
    |> to_string
  end

  def decrypt(str, n) do
    str
    |> String.to_charlist()
    |> Enum.map(fn c -> down_then_back_n(c, n) end)
    |> to_string
  end

  def down_then_back_n(?\s, _), do: ?\s

  def down_then_back_n(c, n) when n >= 0 do
    (c + @diff - rem(n, @num)) |> get_char2()
  end

  def get_char2(c) when c >= ?a, do: c

  def get_char2(c) do
    (c + @num) |> get_char2()
  end

  def up_then_move_n(?\s, _n), do: ?\s

  def up_then_move_n(c, n) when n >= 0 do
    (c - @diff + rem(n, @num)) |> get_char
  end

  def get_char(c) when c > ?Z do
    get_char(c - @num)
  end

  def get_char(c), do: c
end
