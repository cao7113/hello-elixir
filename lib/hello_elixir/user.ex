defmodule User do
  use Ecto.Schema
  import Ecto.Changeset
  require Ecto.Query
  alias HelloElixir.Repo
  alias Ecto.Query

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:birthday, :date)
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :birthday])
    |> validate_required([:email])
  end

  def find_one do
    __MODULE__ |> Query.first() |> Repo.one()
  end

  def find_all do
    __MODULE__ |> Repo.all()
  end

  def delete_all do
    __MODULE__ |> Repo.delete_all()
  end
end
