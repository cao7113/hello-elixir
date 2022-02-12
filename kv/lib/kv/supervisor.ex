defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  # callbacks

  def init(:ok) do
    childs = [
      {KV.Registry, name: KV.Registry}
    ]

    Supervisor.init(childs, strategy: :one_for_one)
  end
end
