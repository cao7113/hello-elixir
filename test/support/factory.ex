defmodule DataFactory do
  alias HelloElixir.Repo

  # Factories

  # def build(:post) do
  #   %HelloElixir.Post{title: "hello world"}
  # end

  # def build(:comment) do
  #   %HelloElixir.Comment{body: "good post"}
  # end

  # def build(:post_with_comments) do
  #   %HelloElixir.Post{
  #     title: "hello with comments",
  #     comments: [
  #       build(:comment, body: "first"),
  #       build(:comment, body: "second")
  #     ]
  #   }
  # end

  def build(:user) do
    # System.unique_integer([:positive])
    %User{
      email: "hello#{System.unique_integer()}@b.c",
      name: "hello#{System.unique_integer()}"
    }
  end

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    Repo.insert!(build(factory_name, attributes))
  end
end
