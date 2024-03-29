defmodule Hello.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:bio, :string)
    field(:email, :string)
    field(:name, :string)
    field(:num_of_pets, :integer)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :bio, :num_of_pets])
    |> validate_required([:name, :email])
    |> validate_length(:bio, min: 2)
    |> validate_length(:bio, max: 20)
    |> validate_format(:email, ~r/@/)
  end
end
