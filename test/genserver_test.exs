# https://hexdocs.pm/elixir/GenServer.html#content
defmodule Stack do
  use GenServer

  # Client

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end

defmodule GenserverTest do
  use ExUnit.Case

  test "genserver" do
    ## Case1
    # # Start the server
    # {:ok, pid} = GenServer.start_link(Stack, [:hello])

    # # This is the client
    # assert :hello == GenServer.call(pid, :pop)
    # # => :hello

    # GenServer.cast(pid, {:push, :world})
    # # => :ok

    # assert :world == GenServer.call(pid, :pop)
    # # => :world

    ## Case2
    {:ok, pid} = Stack.start_link([:hello])
    assert :hello == Stack.pop(pid)
    Stack.push(pid, :world)
    assert :world == Stack.pop(pid)

    ## Case3: use supervisor
    # children = [
    #   {Stack, [:hello]}
    # ]

    # Supervisor.start_link(children, strategy: :one_for_all)
  end
end
