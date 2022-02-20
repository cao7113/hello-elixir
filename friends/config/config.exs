import Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"
