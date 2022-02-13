defmodule KV.Bucket do
  # However, when the supervisor restarts the new bucket, the registry does not know about it. So we will have an empty bucket in the supervisor that nobody can access! To solve this, we want to say that buckets are actually temporary. If they crash, regardless of the reason, they should not be restarted.
  use Agent, restart: :temporary

  @doc """
  start a new bucket
  """
  def start_link(_opts \\ []) do
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

  def state(pid) do
    Agent.get(pid, & &1)
  end

  def crash(pid) do
    Agent.get(pid, fn state ->
      raise "mock a crash"
      state
    end)
  end

  @doc """
  delete value
  """
  def delete(pid, k) do
    Agent.get_and_update(pid, &Map.pop(&1, k))
  end
end
