defmodule HelloElixir do
  @moduledoc """
  Documentation for `HelloElixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> HelloElixir.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Try in iex: iex --dbg pry -S mix,
  then call: HelloElixir.try_dbg
  type n to next line!
  """
  def try_dbg do
    [1, 2]
    |> Enum.reverse()
    |> Enum.sum()
    |> dbg()
  end

  def hi do
    :nothing_here
    :ok
  end
end
