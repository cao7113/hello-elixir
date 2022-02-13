defmodule KV.Registry do
  use GenServer
  require Logger

  # Client API

  @doc """
  Start registry server
  :name required
  """
  def start_link(opts) do
    server = Keyword.fetch!(opts, :name)
    Logger.debug("starting registry with opts: #{inspect(opts)}")
    GenServer.start_link(__MODULE__, server, opts)
  end

  @doc """
  Create a buckect with name: name
  """
  @spec create(pid, String.t()) :: {:ok}
  def create(r, name) do
    GenServer.call(r, {:create, name})
  end

  @doc """
  Lookup a named bucket
  """
  def lookup(server, name) do
    # GenServer.call(r, {:lookup, name})
    case :ets.lookup(server, name) do
      [{^name, pid}] -> {:ok, pid}
      [] -> :error
    end
  end

  def state(r) do
    GenServer.call(r, :state)
  end

  def create2(name) do
    GenServer.cast(__MODULE__, {:create, name})
  end

  def lookup2(name) do
    # GenServer.call(__MODULE__, {:lookup, name})
    {:ok, pid} = lookup(__MODULE__, name)
    pid
  end

  def state2() do
    GenServer.call(__MODULE__, :state)
  end

  # server-side callbacks

  @impl true
  def init(table) do
    names = :ets.new(table, [:named_table, read_concurrency: true])
    {:ok, {names, %{}}}
  end

  @impl true
  def handle_call({:create, name}, _from, {table, refs}) do
    case lookup(table, name) do
      {:ok, pid} ->
        {:reply, pid, {table, refs}}

      :error ->
        {:ok, bucket} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)
        ref = Process.monitor(bucket)
        new_refs = Map.put(refs, ref, name)
        :ets.insert(table, {name, bucket})
        Logger.debug("created bucket with name: #{name} and #{inspect(bucket)}")
        {:reply, bucket, {table, new_refs}}
    end

    # if Map.has_key?(names, name) do
    #   {:noreply, state}
    # else
    #   # {:ok, bucket} = KV.Bucket.start_link([])
    #   {:ok, bucket} = DynamicSupervisor.start_child(KV.BucketSupervisor, KV.Bucket)

    #   ref = Process.monitor(bucket)
    #   Logger.debug("created bucket with name: #{name} and #{inspect(bucket)}")

    #   new_names = Map.put(names, name, bucket)
    #   new_refs = Map.put(refs, ref, name)
    #   {:noreply, {new_names, new_refs}}
    # end
  end

  # @impl true
  # def handle_call({:lookup, name}, _from, state) do
  #   {names, _} = state
  #   {:reply, Map.fetch(names, name), state}
  # end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, {state, self()}, state}
  end

  @impl true
  def handle_info({:DOWN, ref, :process, _obj, reason}, {names, refs}) do
    {name, refs} = Map.pop(refs, ref)
    [{_, pid}] = :ets.lookup(names, name)
    :ets.delete(names, name)

    Logger.debug(
      "clean DOWN process name: #{inspect(name)} pid: #{inspect(pid)} for reason: #{inspect(reason)}"
    )

    {:noreply, {names, refs}}
  end

  @impl true
  def handle_info(msg, state) do
    Logger.info("unexpected msg: #{inspect(msg)} for state: #{inspect(state)}")
    {:noreply, state}
  end
end
