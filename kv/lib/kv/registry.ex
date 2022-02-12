defmodule KV.Registry do
  use GenServer
  require Logger

  # Client API

  @doc """
  Start registry server
  """
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  @doc """
  Create a buckect with name: name
  """
  @spec create(pid, String.t()) :: {:ok}
  def create(r, name) do
    GenServer.cast(r, {:create, name})
  end

  @doc """
  Lookup a named bucket
  """
  def lookup(r, name) do
    GenServer.call(r, {:lookup, name})
  end

  # server-side callbacks

  @impl true
  def init(_opts) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  @impl true
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      Logger.info("bucket with name: #{name} created with #{inspect(bucket)}")
      {:noreply, Map.put(names, name, bucket)}
    end
  end

  @impl true
  def handle_info(:list, names) do
    Logger.info("current names: #{inspect(names)}")
    {:noreply, names}
  end
end
