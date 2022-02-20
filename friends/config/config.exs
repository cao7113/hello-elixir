import Config

config :friends, Friends.Repo,
  database: "friends",
  # username: "user",
  # password: "pass",
  hostname: "localhost"

config :friends, ecto_repos: [Friends.Repo]

import_config "#{Mix.env()}.exs"
