use Mix.Config

config :hello_elixir, HelloElixir.Scheduler,
  jobs: [
    # Every minute
    # {"* * * * *",      {Heartbeat, :send, []}},
    # # Every 15 minutes
    # {"*/15 * * * *",   fn -> System.cmd("rm", ["/tmp/tmp_"]) end},
    # # Runs on 18, 20, 22, 0, 2, 4, 6:
    # {"0 18-6/2 * * *", fn -> :mnesia.backup('/var/backup/mnesia') end},
    # # Runs every midnight:
    # {"@daily",         {Backup, :backup, []}}

    # Every minute
    {"* * * * *", fn -> IO.puts("Hi at #{DateTime.utc_now()}...") end}
  ]

config :logger,
  level: :debug
