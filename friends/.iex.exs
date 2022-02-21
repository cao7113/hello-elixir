IO.puts("## !!! .iex.exs loaded with MIX_ENV=#{Mix.env()} in firends project\n")

## Friends
alias Friends.Person, as: P
alias Friends.Repo, as: R
## Ecto
alias Ecto.Query, as: Q
alias Ecto.Changeset, as: Cg

## Test
alias Friends.RepoCase, as: Rc
alias Friends.Factory, as: F

## env specific
case Mix.env() do
:test ->
  IO.puts("==> test logic loaded")
_ ->
  nil
end
