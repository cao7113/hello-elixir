defmodule Mix.Tasks.H.Hello do
  use Mix.Task

  @shortdoc "Hello mix task"

  def run(_) do
    Mix.shell().info("Simple hello from hello-elixir")
  end
end
