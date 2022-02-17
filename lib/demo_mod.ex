defmodule DemoMod do
  require Logger

  # run when compiled
  Logger.info("DemoModule in top level __MODULE__: #{__MODULE__}")

  defmacro __using__(_opts) do
    # run when used
    Logger.info("DemoModule in __using__ macro top level __MODULE__: #{__MODULE__}")

    quote do
      # expand when compile

      # run when used, in caller context
      Logger.info("DemoModule in quote level __MODULE__: #{__MODULE__}")
      Logger.info("DemoModule in quote level unquote(__MODULE__): #{unquote(__MODULE__)}")

      def fun1() do
        Logger.info(
          "fun1 level __MODULE__: #{__MODULE__} unquote(__MODULE__): #{unquote(__MODULE__)}"
        )
      end
    end
  end
end

defmodule Try do
  require Logger

  use DemoMod

  def hi do
    fun1()
  end
end

defmodule Try1 do
  require Logger

  use DemoMod
end
