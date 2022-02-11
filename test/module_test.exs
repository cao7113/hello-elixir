defmodule AMod do
  @modkey1 "val1"

  require Logger

  def val1(), do: @modkey1

  def __using__(_) do
    Logger.debug("__using__ running")
  end
end

defmodule Parser do
  # define behaviours

  @doc """
  Parse a string.
  """
  @callback parse(String.t()) :: {:ok, term()} | {:error, String.t()}

  @doc """
  List file extensions.
  """
  @callback extension() :: [String.t()]
end

defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some json " <> str}

  @impl Parser
  def extension(), do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some yaml " <> str}

  @impl Parser
  def extension(), do: ["yml"]
end

defmodule ModTest do
  use ExUnit.Case

  use AMod

  test "test module attribute" do
    assert "val1" == AMod.val1()
  end

  test "parse ok" do
    assert {:ok, "some json ok"} = JSONParser.parse("ok")
    assert {:ok, "some yaml ok"} = YAMLParser.parse("ok")
  end
end
