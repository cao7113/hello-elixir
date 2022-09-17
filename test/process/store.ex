defmodule Store do
  def start do
    spawn(__MODULE__, :loop, [%{}])
  end

  def loop(state) do
    receive do
      {:stop, pid} ->
        send(pid, "Shutting down")

      {:put, key, value} ->
        new_state = Map.put(state, key, value)
        loop(new_state)

      {:get, key, pid} ->
        value = Map.fetch(state, key)
        send(pid, value)
        loop(state)

      {:get_all, pid} ->
        send(pid, state)
        loop(state)

      _ ->
        loop(state)
    end
  end
end
