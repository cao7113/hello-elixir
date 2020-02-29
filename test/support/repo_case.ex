defmodule HelloElixir.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias HelloElixir.Repo

      import Ecto
      import Ecto.Query
      import HelloElixir.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(HelloElixir.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(HelloElixir.Repo, {:shared, self()})
    end

    :ok
  end
end
