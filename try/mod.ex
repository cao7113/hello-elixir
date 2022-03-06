defmodule Hi.Mod do
  require Logger

  # run when compiled
  Logger.info("Hi.Mod in top level __MODULE__: #{__MODULE__}")

  defmacro __using__(_opts) do
    # run when used
    Logger.info("Hi.Mod in __using__ macro top level __MODULE__: #{__MODULE__}")

    quote do
      # expand when compile

      # run when used, in caller context
      Logger.info("Hi.Mod in quote level __MODULE__: #{__MODULE__}")
      Logger.info("Hi.Mod in quote level unquote(__MODULE__): #{unquote(__MODULE__)}")

      def fun1() do
        Logger.info(
          "fun1 level __MODULE__: #{__MODULE__} unquote(__MODULE__): #{unquote(__MODULE__)}"
        )
      end
    end
  end
end

defmodule Try1 do
  require Logger

  use Hi.Mod

  def hi do
    fun1()
  end
end

defmodule Try2 do
  require Logger

  use Hi.Mod
end
