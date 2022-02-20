defmodule Friends.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Query
      alias Ecto.Changeset
      alias Friends.Repo

      import Ecto
      import Ecto.Query
      import Friends.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Friends.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Friends.Repo, {:shared, self()})
    end

    :ok
  end
end
