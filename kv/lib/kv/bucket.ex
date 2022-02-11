defmodule KV.Bucket do
  use Agent

  @doc """
  start a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  get value from bucket by key
  """
  @spec get(pid(), String.t()) :: term()
  def get(pid, k) do
    Agent.get(pid, &Map.get(&1, k))
  end

  @doc """
  put key, value into a bucket
  """
  def put(pid, k, val) do
    Agent.update(pid, &Map.put(&1, k, val))
  end
end
