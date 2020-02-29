defmodule UserTest do
  use HelloElixir.RepoCase

  # User |> Repo.get_by(name: "xxx") # get one record by attribute
  # User |> Ecto.Query.where(name: "xxx") |> Repo.all
  # Ecto.Query.from(p in User, where: p.name == "Smith") |> Repo.all

  # name = "Smith" # pin variable
  # User |> Ecto.Query.where(name: ^name) |> Repo.all
  # The pin operator instructs the query builder to use parameterised SQL queries protecting against SQL injection.

  test "create user" do
    params = %{name: "t1", email: "a@b.c"}
    cs = %User{} |> User.changeset(params)

    case Repo.insert(cs) do
      {:ok, user} ->
        assert user.name == "t1"

      _ ->
        assert false
    end
  end

  test "CRUD user" do
    params = %{
      name: "t1",
      email: "d@b.c"
    }

    cs = %User{} |> User.changeset(params)

    case Repo.insert(cs) do
      {:ok, user} ->
        u = Repo.get(User, user.id)
        cs1 = u |> User.changeset(%{name: "new name"})
        Repo.update!(cs1)

        u2 = Repo.get(User, user.id)
        Repo.delete!(u2)
        assert true

      {:error, _} ->
        assert false
    end
  end

  test "count user" do
    people = [
      %User{name: "Ryan", email: "a@b.c"},
      %User{name: "John", email: "a1@b.c"},
      %User{name: "Jane", email: "a2@b.c"}
    ]

    Enum.each(people, fn person -> Repo.insert(person) end)

    alias HelloElixir.Repo
    cnt1 = Repo.one(from(p in "users", select: count(p.id)))
    # Repo.one(from p in "people", select: fragment("count(*)"))
    cnt2 = Repo.aggregate(from(p in "users"), :count, :id)
    assert cnt1 == cnt2
    assert 3 == cnt1
  end

  # todo
  # test "one record" do
  #   case User |> Repo.one do
  #     %Ecto.MultipleResultsError{} ->
  #       assert true
  #       # 期待最多一条记录
  #       _ ->
  #         assert false
  #   end
  # end
end
