defmodule LoggerTest do
  use ExUnit.Case
  require Logger

  test "logger level" do
    # current logger level is info in config
    Logger.info("this is info message")
    Logger.debug("this is debug message")
    Logger.warn("this is warn message")
    Logger.error("this is error message")

    # todo
    # Enum.each([:info, :debug, :warn, :error], fn l ->
    #   apply(Logger, l, ["this is #{l} message"])
    #   # IO.puts("this is #{l} message")
    # end)
  end
end
