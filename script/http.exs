#!/usr/bin/env elixir
Mix.install([
  {:req, "~> 0.2.1"},
  {:jason, "~> 1.0"}
])

%{status: 200, body: body} =
  Req.get!("https://httpbin.org/ip")

body |> IO.inspect()
