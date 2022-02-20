defmodule Hi.GenServer do
  use GenServer
  require Logger

  @interval 2_000
  @max_times 5

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, 1, opts)
  end

  @impl GenServer
  def init(init_arg) do
    {:ok, init_arg, @interval}
  end

  @impl GenServer
  def handle_info(:timeout, n) do
    if n < @max_times do
      Logger.info("#{n} timeout occurred in process: #{inspect(self())}")
      {:noreply, n + 1, @interval}
    else
      Logger.warn("stop after #{@max_times} times timeout")
      {:noreply, n}
    end
  end
end
