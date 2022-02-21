import Config

# https://github.com/mana-ethereum/ethereumex
config :ethereumex,
  url: System.get_env("ETHEREUMEX_URL") || "http://localhost:8545"

# http_options: [pool_timeout: 5000, receive_timeout: 15_000],
# http_headers: [{"Content-Type", "application/json"}]
