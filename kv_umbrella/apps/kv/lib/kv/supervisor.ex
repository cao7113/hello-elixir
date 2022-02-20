defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  # callbacks

  def init(:ok) do
    childs = [
      {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one},
      {KV.Registry, name: KV.Registry},
      {Task.Supervisor, name: KV.RouterTasks}
    ]

    Supervisor.init(childs, strategy: :one_for_all)
  end
end
