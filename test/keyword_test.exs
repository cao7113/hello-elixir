defmodule KeywordTest do
  use ExUnit.Case

  # https://hexdocs.pm/elixir/Keyword.html#content

  test "basic keyword list" do
    kw = [name: :geek, age: 3]
    assert kw[:name] == :geek
    assert Access.get(kw, :age) == 3

    assert is_list(kw)
  end
end
