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
  @spec put(pid(), String.t(), term()) :: any()
  def put(pid, k, val) do
    Agent.update(pid, &Map.put(&1, k, val))
  end

  @doc """
  delete value
  """
  def delete(pid, k) do
    Agent.get_and_update(pid, &Map.pop(&1, k))
  end
end
