defmodule PrimeNumber do
  def is_prime(n) when n in [2, 3], do: true

  def is_prime(n) when is_integer(n) and n > 3 do
    r = :math.sqrt(n) |> floor()

    2..r
    |> Enum.all?(fn d ->
      rem(n, d) != 0
    end)
  end

  def is_prime(_n), do: false

  def prime_factors_for(n) when n in 0..3 do
    [n]
  end

  def prime_factors_for(n) when is_integer(n) and n > 3 do
    r = :math.sqrt(n) |> floor()

    2..r
    |> Enum.find(fn d ->
      rem(n, d) == 0
    end)
    |> case do
      nil ->
        # when not found divisor
        [n]

      d ->
        # first divisor should be a prime
        r = div(n, d)
        # TODO: refactor to tail call
        [d] ++ prime_factors_for(r)
    end
  end

  def rand_number(bytes \\ 8) do
    bytes
    |> :crypto.strong_rand_bytes()
    |> :crypto.bytes_to_integer()
  end

  def nth_prime(_n) do
    # TODO:
  end
end
