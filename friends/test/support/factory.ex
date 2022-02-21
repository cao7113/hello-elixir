defmodule Friends.Factory do
  alias Friends.Repo

  # Factories

  # def build(:post) do
  #   %Friends.Post{title: "hello world"}
  # end

  # def build(:comment) do
  #   %Friends.Comment{body: "good post"}
  # end

  # def build(:post_with_comments) do
  #   %Friends.Post{
  #     title: "hello with comments",
  #     comments: [
  #       build(:comment, body: "first"),
  #       build(:comment, body: "second")
  #     ]
  #   }
  # end

  # def build(:user) do
  #   %Friends.User{
  #     email: "hello#{System.unique_integer()}",
  #     username: "hello#{System.unique_integer()}"
  #   }
  # end

  def build(:person) do
    %Friends.Person{
      first_name: "boy-first-name-#{System.unique_integer()}",
      last_name: "boy-last-name-#{System.unique_integer()}"
    }
  end

  def build(:p), do: build(:person)

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert()
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
