use Mix.Config

config :hello_elixir, HelloElixir.Repo,
  database: "hello_elixir_test",
  username: "root",
  password: "",
  # port: 13306,
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
