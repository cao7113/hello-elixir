defmodule LoggerTest do
  use ExUnit.Case
  import Logger

  @tag :manual
  test "logger level" do
    # current logger level is info in config
    # Note: all those methods are macros
    info("this is info message")
    debug("this is debug message")
    warning("this is warn message")
    error("this is error message")

    # todo
    # Enum.each([:info, :debug, :warn, :error], fn l ->
    #   apply(Logger, l, ["this is #{l} message"])
    #   # IO.puts("this is #{l} message")
    # end)
  end
end
