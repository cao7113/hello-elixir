defmodule Friends.Person do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "people" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:age, :integer)
  end

  def changeset(person, params \\ %{}) do
    person
    |> Changeset.cast(params, [:first_name, :last_name, :age])
    |> Changeset.validate_required([:first_name, :last_name])
  end

  def pretty_errors(changeset) do
    Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
