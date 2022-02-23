defmodule Test.Hello.UserTest do
  # use ExUnit.Case
  use Hello.DataCase

  test "CRUD" do
    # todo factory and mox
    email = "testonly-#{System.unique_integer()}@a.b"
    user = Repo.get_by(User, email: email)

    if not is_nil(user) do
      Repo.delete(user)
    end

    {:ok, u} = %User{} |> User.changeset(%{name: "hi", email: email}) |> Repo.insert()
    assert u.email == email

    Repo.all(from(u in User, select: %{u.id => u.email})) |> IO.inspect()

    cnt = from(u in User, select: count(u)) |> Repo.one()
    assert cnt >= 0

    Repo.delete_all(User)
    cnt = from(u in User, select: count(u)) |> Repo.one()
    assert cnt == 0
  end
end
