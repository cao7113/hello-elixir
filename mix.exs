defmodule HelloElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_elixir,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HelloElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hello_libary, "~> 0.1.6"}
      # {:faker, "~> 0.17"},
      # {:abx, github: "cao7113/abx"},
      # {:feishu_bot, github: "cao7113/feishu-bot"}
    ]
  end
end
