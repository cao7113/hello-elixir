defmodule HelloElixir.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  # https://hexdocs.pm/ecto/Ecto.Schema.html#module-types-and-casting
  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :birthday, :date
      timestamps()
    end
  end
end
