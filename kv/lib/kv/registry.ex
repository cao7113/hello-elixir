defmodule KV.Registry do
  use GenServer
  require Logger

  # Client API

  @doc """
  Start registry server
  """
  def start_link(opts \\ []) do
    Logger.debug("starting registry with opts: #{inspect(opts)}")
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

  def state(r) do
    GenServer.call(r, :state)
  end

  def create2(name) do
    GenServer.cast(__MODULE__, {:create, name})
  end

  def lookup2(name) do
    GenServer.call(__MODULE__, {:lookup, name})
  end

  def state2() do
    GenServer.call(__MODULE__, :state)
  end

  # server-side callbacks

  @impl true
  def init(_opts) do
    {:ok, {%{}, %{}}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, state) do
    {names, _} = state
    {:reply, Map.fetch(names, name), state}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:create, name}, state) do
    {names, refs} = state

    if Map.has_key?(names, name) do
      {:noreply, state}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      ref = Process.monitor(bucket)
      Logger.debug("created bucket with name: #{name} and #{inspect(bucket)}")

      new_names = Map.put(names, name, bucket)
      new_refs = Map.put(refs, ref, name)
      {:noreply, {new_names, new_refs}}
    end
  end

  @impl true
  def handle_info({:DOWN, ref, :process, _obj, reason}, state) do
    {names, refs} = state
    name = refs[ref]
    new_names = Map.delete(names, name)
    new_refs = Map.delete(refs, ref)

    Logger.debug(
      "clean DOWN process name: #{inspect(name)} pid: #{inspect(names[name])} for reason: #{inspect(reason)}"
    )

    {:noreply, {new_names, new_refs}}
  end

  @impl true
  def handle_info(msg, state) do
    Logger.error("unexpected msg: #{inspect(msg)} for state: #{inspect(state)}")
    {:noreply, state}
  end
end
