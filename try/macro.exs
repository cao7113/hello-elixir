defmodule M1 do
  defmacro mt do
    __MODULE__ |> IO.inspect(label: "macro ctx")

    quote do
      __MODULE__ |> IO.inspect(label: "caller ctx module")

      unquote(__MODULE__) |> IO.inspect(label: "unquoted module from macro quote in caller ctx")
    end
  end
end

defmodule M2 do
  require M1

  def hi do
    M1.mt()
  end
end
