defmodule Stack do
  use GenServer

  # client-api

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def push(pid, el) do
    GenServer.cast(pid, {:push, el})
  end

  def state(pid) do
    GenServer.call(pid, :state)
  end

  # callbacks

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:push, el}, state) do
    {:noreply, [el | state]}
  end
end
