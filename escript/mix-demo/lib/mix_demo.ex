defmodule MixDemo do
  @moduledoc """
  synopsis:
    Prints args, possibly multiple times.
  usage:
    $ test10 {options} arg1 arg2 ...
  options:
    --verbose     Add more info.
    --count=n     Print n times.
  """

  def main([]) do
    IO.puts(@moduledoc)
  end

  def main([help_opt]) when help_opt == "-h" or help_opt == "--help" do
    IO.puts(@moduledoc)
  end

  def main(args) do
    {opts, positional_args, errors} = args |> parse_args

    case errors do
      [] ->
        process_args(opts, positional_args)
        show_jason(positional_args)

      _ ->
        IO.puts("Bad option:")
        IO.inspect(errors)
        IO.puts(@moduledoc)
    end
  end

  defp parse_args(args) do
    {opts, cmd_and_args, errors} =
      args
      |> OptionParser.parse(
        strict: [verbose: :boolean, count: :integer],
        aliases: [c: :count]
      )

    {opts, cmd_and_args, errors}
  end

  defp process_args(opts, args) do
    count = Keyword.get(opts, :count, 1)

    printfn =
      if Keyword.has_key?(opts, :verbose) do
        fn arg ->
          IO.write("Message: ")
          IO.puts(arg)
        end
      else
        fn arg ->
          IO.puts(arg)
        end
      end

    Stream.iterate(0, &(&1 + 1))
    |> Stream.take(count)
    |> Enum.each(fn _counter ->
      Enum.with_index(args, fn arg, idx ->
        printfn.("#{idx}. #{arg}")
      end)
    end)
  end

  defp show_jason(args) do
    {:ok, content} = Jason.encode(args)
    IO.puts("json content: #{content}")
  end
end
