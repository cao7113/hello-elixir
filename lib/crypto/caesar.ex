defmodule Crypto.Caesar do
  @moduledoc """
    Caesar encrypt and decrypt
    downcase represent plain text
    upcase represent cipher text
  """
  require Logger

  @num 26
  @case_diff 0x20

  def encrypt(str, n) do
    str
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(fn c -> encrypt_shift(c, n) end)
    |> to_string
  end

  def encrypt_p(str, n) do
    str
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(fn c ->
      Task.async(fn ->
        encrypt_shift(c, n)
      end)
    end)
    |> Enum.map(fn t ->
      Task.await(t)
    end)
    |> to_string
  end

  def encrypt_shift(c, _n) when c < ?a or c > ?z, do: c

  def encrypt_shift(c, n) when n >= 0 do
    (c - @case_diff + rem(n, @num)) |> _up_char
  end

  def _up_char(c) when c > ?Z do
    (c - @num) |> _up_char
  end

  def _up_char(c), do: c

  def decrypt(str, n) do
    str
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.map(fn c -> decrypt_back_shift(c, n) end)
    |> to_string
  end

  def decrypt_back_shift(c, _) when c < ?A or c > ?Z, do: c

  def decrypt_back_shift(c, n) when n >= 0 do
    (c + @case_diff - rem(n, @num)) |> _down_char()
  end

  def _down_char(c) when c < ?a do
    (c + @num) |> _down_char
  end

  def _down_char(c), do: c
end

# defp pmap(list, f) do
#   me = self
#   list
#   |> Enum.map(fn(i) ->
#     spawn_link fn -> (send me, { self, f.(i) }) end
#   end)
#   |> Enum.map(fn (pid) ->
#     receive do { ^pid, result } -> result end
#   end)
# end
