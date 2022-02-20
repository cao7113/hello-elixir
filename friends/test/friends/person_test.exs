defmodule Test.Friends.PersonTest do
  use ExUnit.Case
  use Friends.RepoCase

  alias Friends.Person

  test "person CRUD" do
    fname = "test-boy"
    Person |> Query.where(first_name: ^fname) |> Repo.delete_all()

    cs = %Person{first_name: fname, last_name: "geek"}
    {:ok, p} = cs |> Repo.insert()
    assert p.first_name == fname
  end
end
