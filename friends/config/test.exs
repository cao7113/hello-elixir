# use Mix.Config
import Config

config :friends, Friends.Repo,
  # username: "postgres",
  # password: "postgres",
  database: "friends_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# In this case, we use a Postgres database and set it up to use the sandbox pool that will wrap each test in a transaction.
