# HelloElixir

Hello elixir world!

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hello_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hello_elixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/hello_elixir](https://hexdocs.pm/hello_elixir).

## Ecto Example

https://github.com/elixir-ecto/ecto/tree/master/examples/friends

## History

2020.2.29 add missing supervision tree to use ecto by `mix new . -elixir --module HelloElixir --app hello_elixir --sup`, skip already exists files except new-generating `lib/hello_elixir/application.ex`

2020.2.29 add ecto by `mix ecto.gen.repo -r HelloElixir.Repo`

2020.1.21 created by `mix new hello-elixir --module HelloElixir --app hello_elixir`