defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view
  require Logger
  @interval 10000

  @impl true
  def mount(params, _session, socket) do
    Logger.debug("mount with params: #{inspect(params)}")

    socket =
      if connected?(socket) do
        Logger.debug("connected")
        Process.send_after(self(), :tick, @interval)

        # When the view loads we set the initial count to 0
        assign(socket, count: 1)
      else
        Logger.debug("not connected")

        # When the view loads we set the initial count to 0
        assign(socket, count: 0)
      end

    {:ok, socket}
  end

  @impl true
  def handle_params(unsigned_params, uri, socket) do
    Logger.debug("handle_params #{unsigned_params |> inspect} uri: #{uri}")
    {:noreply, socket}
  end

  # @impl true
  # def render(assigns) do
  #   Logger.debug("render callback with assigns: #{inspect(assigns)}")

  #   ~H"""
  #     <h1 class="text-2xl">LiveView counter111!</h1>

  #     <div class="h-10 w-32">
  #     <div class="flex flex-row h-10 w-full rounded-lg relative bg-transparent mt-1">
  #     <button phx-click="decrease" class="bg-gray-300 cursor-pointer outline-none">
  #       <span class="m-auto text-2xl font-thin">−</span>
  #     </button>
  #     <input value={@count} class="outline-none text-center" name="custom-input-number" />
  #     <button phx-click="increase" class="bg-gray-300 t">
  #     <span class="m-auto text-2xl font-thin">+</span>
  #     </button>
  #     </div>
  #     </div>
  #   """
  # end

  @impl true
  def handle_event("increase", _, socket) do
    # Add 1 to the current count
    socket = assign(socket, count: socket.assigns.count + 1)
    {:noreply, socket}
  end

  @impl true
  def handle_event("decrease", _, socket) do
    # Substract 1 to the current count
    socket = assign(socket, count: socket.assigns.count - 1)
    {:noreply, socket}
  end

  @impl true
  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, @interval)

    Logger.debug("tick on current count: #{socket.assigns.count}")

    {:noreply, assign(socket, :count, socket.assigns.count + 1)}
  end
end
