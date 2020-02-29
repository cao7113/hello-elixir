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

  # todo use testing
  def mock do
    people = [
      %__MODULE__{name: "Ryan", email: "a@b.c"},
      %__MODULE__{name: "John", email: "a1@b.c"},
      %__MODULE__{name: "Jane", email: "a2@b.c"}
    ]

    Enum.each(people, fn person -> Repo.insert(person) end)
  end

  # User |> Repo.one # Ecto.MultipleResultsError one 期待最多一条记录
  def find_one do
    __MODULE__ |> Query.first() |> Repo.one()
  end

  def find_all do
    __MODULE__ |> Repo.all()
  end

  def delete_all do
    __MODULE__ |> Repo.delete_all()
  end

  def try do
    params = %{
      name: "t1",
      email: "d@b.c"
    }

    cs = %User{} |> changeset(params)

    case Repo.insert(cs) do
      {:ok, user} ->
        u = Repo.get(User, user.id)
        cs1 = u |> changeset(%{name: "new name"})
        Repo.update!(cs1)

        u2 = Repo.get(User, user.id)
        Repo.delete!(u2)

      {:error, _} ->
        nil
    end
  end

  # User |> Repo.get_by(name: "xxx") # get one record by attribute
  # User |> Ecto.Query.where(name: "xxx") |> Repo.all
  # Ecto.Query.from(p in User, where: p.name == "Smith") |> Repo.all

  # name = "Smith" # pin variable
  # User |> Ecto.Query.where(name: ^name) |> Repo.all
  # The pin operator instructs the query builder to use parameterised SQL queries protecting against SQL injection.
end
