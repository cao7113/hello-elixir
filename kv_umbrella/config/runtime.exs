import Config

require Logger
Logger.info("config/runtime.exs invoked")

# config :iex, default_prompt: ">>>"

# default use current node
config :kv, :routing_table, [{?a..?z, node()}]

if config_env() == :prod do
  config :kv, :routing_table, [
    {?a..?m, :foo@rj},
    {?n..?z, :bar@rj}
  ]
end
