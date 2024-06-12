defmodule LoggerTest do
  use ExUnit.Case
  import Logger

  test "logger level" do
    # current logger level is info in config
    # Note: all those methods are macros
    info("this is info message")
    debug("this is debug message")
    warn("this is warn message")
    error("this is error message")

    # todo
    # Enum.each([:info, :debug, :warn, :error], fn l ->
    #   apply(Logger, l, ["this is #{l} message"])
    #   # IO.puts("this is #{l} message")
    # end)
  end
end
