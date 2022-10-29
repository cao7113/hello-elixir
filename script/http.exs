#!/usr/bin/env elixir
[tag] = System.argv()

Mix.install([
  {:req, "~> 0.2.1"},
  {:jason, "~> 1.0"}
])

%{status: 200, body: release} =
  Req.get!("https://api.github.com/repos/elixir-lang/elixir/releases/tags/#{tag}")

release |> IO.inspect()
