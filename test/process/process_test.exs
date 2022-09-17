# https://elixir-lang.org/getting-started/processes.html

defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

defmodule ProcessTest do
  use ExUnit.Case

  test "try basic spawn process" do
    pid = spawn(fn -> 1 + 3 end)
    Process.sleep(3)
    refute Process.alive?(pid)
  end

  test "try send and receive message" do
    parent = self()
    spawn(fn -> send(parent, {:hello, self()}) end)

    result =
      receive do
        {:hello, pid} ->
          IO.puts("get result from pid: #{inspect(pid)}")
          {:ok, pid}
      after
        # timeout
        1000 ->
          {:error, :timeout}
      end

    assert {:ok, _} = result

    # use flush() inside iEx to get messages from self process mailbox
  end

  test "spawn-link" do
    parent = self()
    spawn_link(fn -> IO.puts("linked from #{inspect(parent)}") end)
  end

  test "try Task" do
    assert {:ok, _pid} = Task.start(fn -> :ok end)
  end

  # Agents are simple wrappers around state.
  test "try Agent" do
    {:ok, pid} = Agent.start_link(fn -> %{} end)
    assert :ok == Agent.update(pid, fn m -> Map.put(m, :hello, :world) end)
    assert :world == Agent.get(pid, fn m -> Map.get(m, :hello) end)
  end
end

# pid = spawn(fn -> 1 + 2 end)
# # => #PID<0.118.0>
# Process.monitor(pid)
# # => #Reference<0.906660723.3006791681.40191>
# Process.exit(pid, :kill)
# # => true
